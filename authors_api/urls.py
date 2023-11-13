from django.conf import settings
from django.contrib import admin
from django.urls import path , include
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions

schema_view = get_schema_view(
    openapi.Info(
        title="Authors Haven API",
        default_version="V1",
        description="API endpoints for Authors Haven API COurse",
        contact=openapi.Contact(email="api@xyz.com"),
        license=openapi.License(name="MIT Licence")
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)


urlpatterns = [
    # path("admin/", admin.site.urls),
    path('redoc/',schema_view.with_ui("redoc",cache_timeout=0)),
    path(settings.ADMIN_URL, admin.site.urls),
]

admin.site.site_header = "Authors Haven Api admin"
admin.site.site_title= "Authors haven api admin portal"
admin.site.index_title = "welcome to authors Haven API POrtal"