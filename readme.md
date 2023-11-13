steps

    create a virtual environmene
    create .gitignore file

    create secret key
        - python -c "import secrets; print(secrets.token_urlsafe(20))
    
    create git repo
        git remote add origin https://github.com/TheVikramaditya/django_backend.git
        git branch -M main
        git push -u origin main
    
    create .env folder and files 

    create a dockerfile
    
    create entrypoint script == shabang script

    create start script file

    create .dockerignore file == allows us to mention a list of files or directories which we might want to ignore while building the image

    create a local.yml == like a docker-compose file for multiple services
        >>docker-compose -f local.yml config == command to check if we created right or not
        >>sudo docker-compose -f local.yml up --build -d --remove-orphans
    
    create a maintenance folder/file
        """this folder will contain scripts to help in database backup and restoration"""
    
    created a _sourced dir inside maintenance
        """have some helper shell scripts that will be used by our backup and restore shell scripts"""

    to create a backup file

        >>sudo docker-compose -f local.yml exec postgres backup , here postgres is a service name
        
        NOTE = now we might be wondering how backup is able to call directly without diving in folders containing this script , its because
        if we will look dockerfile inside postgres then the files of maintenance folder is moved to /user/local/bin and we can execute any file directly 
        if the file is inside this path /user/local/bin 
    
    to list backup files

        >>sudo docker-compose -f local.yml exec postgres backups
        when we will go inside postgres container then a folder has been created with the name of backups
    
    to restore database

        >>sudo docker-compose -f local.yml exec postgres restore <file_name>
    
    to run makefile
        >> make build
        >> make down
        >> make authors-db



    
    
