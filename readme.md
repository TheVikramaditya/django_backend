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

    
    
