from .base import * #noqa
from .base import env



SECRET_KEY = env("DJANGO_SECRET_KEY",
                 default="FjH8lL729uUCpJf8qnKhrTvVsPSsoTNjE9Tled-mL99PTvoZkhQ")

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

CSRF_TRUSTED_ORIGINS =["http://localhost:8080"]

