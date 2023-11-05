

    1 - ARG PYTHON_VERSION=3.10-bullseye

            """The ARG instruction in a Dockerfile is used to define variables that can be passed 
                at build-time to customize the build process."""


    2 - FROM python:${PYTHON_VERSION} as python

            """This line tells Docker to use a base image of Python with the version specified in 
                the PYTHON_VERSION variable. We also give this stage a name, "python.""""


            """The part before the colon : (python) is the name of the base Docker image, 
            and the part after the colon (${PYTHON_VERSION}) is a specific tag or version of that image."""

            """The word written after "as" (in this case, "python") is the stage name. 
            It's used to give the build stage a name or alias that you can use to refer to 
            that specific stage in subsequent parts of the Dockerfile. So, "python" is the stage name in this context."""
        

    3 - FROM python as python-build-stage

            """the first 'python' name is the name of docker base image and 'python-build-stage' is the name or alias 
                you are giving to this particular stage in the Docker image-building process. """


    4 - RUN apt-get update && apt-get install --no-install-recommends -y \
        build-essentials \
        libpq-dev

            """Updates the package list and installs essential build tools (build-essential) and 
                the PostgreSQL development library (libpq-dev) in the "python-build-stage.""""
    
    5 - COPY ./requirements .

        """Copies the application's requirements folder 
            from the local directory into the current build context."""
    
    6 - RUN pip wheel --wheel-dir /usr/src/app/wheels \
            -r ${BUILD_ENVIRONMENT}.txt
    
            """--wheel-dir /usr/src/app/wheels: This flag specifies the directory where the built wheel packages will be stored. 
                In this case, the wheel packages will be placed in the /usr/src/app/wheels directory within the Docker image."""
            
            """-r ${BUILD_ENVIRONMENT}.txt: This part of the command specifies the requirements file that contains a list of Python dependencies. 
                The ${BUILD_ENVIRONMENT}.txt part uses the value of the BUILD_ENVIRONMENT build argument to dynamically reference the appropriate 
                requirements file. For example, if BUILD_ENVIRONMENT is set to "local," it would reference a file named "local.txt.""""
    
    
    7 - ENV PYTHONDONTWRITEBYTECODE 1
    8 - ENV PYTHONUNBUFFERED 1 
        
        """PYTHONDONTWRITEBYTECODE 1: Prevents Python from writing .pyc files.
            PYTHONUNBUFFERED 1: Ensures that Python doesn't buffer its output."""
    
    9 - ENV BUILD_ENV ${BUILD_ENVIRONMENT}

        """Sets the build environment."""
    
    10 - WORKDIR ${APP_HOME}

        """WORKDIR: This is a Dockerfile instruction that sets the working directory for the container when it's running. 
            The working directory is the current directory in which commands and processes executed within the container will run."""


    11 - apt-get install --no-install-recommends -y \ libpq-dev \ gettext \

        """--no-install-recommends: This flag tells apt-get not to install recommended packages along with the specified packages. It helps keep the image size smaller by avoiding unnecessary dependencies."""

        """-y: This flag tells apt-get to assume "yes" as the answer to all prompts, enabling unattended installation."""

        """libpq-dev and gettext: These are packages that are being installed. libpq-dev is the development library for PostgreSQL, 
            and gettext is a set of tools and libraries for internationalization and localization."""

    12 - apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

        """--auto-remove: This flag tells apt-get to automatically remove packages that were installed as dependencies and are no longer required."""

        """-o APT::AutoRemove::RecommendsImportant=false: This is an option to disable automatic removal of recommended packages. 
                It's used to prevent the removal of recommended packages, which might be necessary for some software to work correctly."""
    
    13 - rm -rf /var/lib/apt/lists/*

        """This command is used to remove the package cache files stored in the /var/lib/apt/lists/ directory. 
            These cache files are no longer needed after package installation and can be safely removed to reduce the image size."""

    14 - COPY --from=python-build-stage /usr/src/app/wheels /wheels/

        """ the command COPY --from=python-build-stage /usr/src/app/wheels /wheels/ copies the contents of the /usr/src/app/wheels directory 
            from the "python-build-stage" into the /wheels/ directory in the current build stage. This is typically used to transfer artifacts 
            or files built in a previous build stage to the current build stage for further use. In this case, it's used to copy built wheel 
            packages (Python dependencies) from an earlier stage to make them available for installation in the final image."""

    15 - RUN pip install --no-cache-dir --no-index --find-links=/wheels/ /wheels/* \ && rm -rf /wheels/

        """--find-links=/wheels/: This flag specifies the directory where pip should look for wheel packages. 
            In this case, it's set to /wheels/, which is where you copied the wheel packages in the previous COPY instruction."""
        
        """/wheels/*: This part specifies the list of wheel packages that should be installed. The * is a wildcard that means 
            "install all wheel packages in the /wheels/ directory.""""




