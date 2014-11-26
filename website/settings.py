import os
gettext = lambda s: s
"""
Django settings for website project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '@t56nz6)1m06&aanb2(of++c8!-*6@sg+h)$fj$2dp562ivl+2'

# SECURITY WARNING: don't run with debug turned on in production!
try:
    from .local_settings import DEBUG
except ImportError:
    DEBUG = True

URL_BASE = "http://destaju.com"

TEMPLATE_DEBUG = True

ADMINS = (
    ('Mauricio Aizaga', 'maizaga@daiech.com'),
    ('Edwin Mesa', 'emesa@daiech.com'),
)

ALLOWED_HOSTS = ['.destaju.com', '.destaju.com.', "104.131.185.107"]


# Application definition

ADMINS = (
    ('Mauricio Aizaga', 'maizaga@daiech.com'),
    ('Edwin Mesa', 'emesa@daiech.com'),
    ('Destaju Page', 'destaju@daiech.com'),
)





ROOT_URLCONF = 'website.urls'

WSGI_APPLICATION = 'website.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases



# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'es'

TIME_ZONE = 'America/Bogota'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'
MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
# STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_ROOT = "/home/dev/.statics/DestajuWeb"

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'website', 'static'),
    os.path.join(BASE_DIR , 'static').replace('\\','/'),
)
SITE_ID = 1

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
    'django.template.loaders.eggs.Loader'
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.doc.XViewMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.language.LanguageCookieMiddleware',
    'cmsplugin_contact.middleware.ForceResponseMiddleware'
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.contrib.messages.context_processors.messages',
    'django.core.context_processors.i18n',
    'django.core.context_processors.debug',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.csrf',
    'django.core.context_processors.tz',
    'sekizai.context_processors.sekizai',
    'django.core.context_processors.static',
    'cms.context_processors.cms_settings',
    'website.context_processors.is_debug',
    'website.context_processors.url_base'
    
)

TEMPLATE_DIRS = (
    os.path.join(BASE_DIR, 'website', 'templates'),
    os.path.join(BASE_DIR, 'templates').replace('\\', '/')
)

INSTALLED_APPS = (
    'djangocms_admin_style',
    'djangocms_text_ckeditor',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.admin',
    'django.contrib.sites',
    'django.contrib.sitemaps',
    'django.contrib.staticfiles',
    'django.contrib.messages',
    'cms',
    'mptt',
    'menus',
    'south',
    'sekizai',
    'djangocms_style',
    'djangocms_column',
    'djangocms_file',
    'djangocms_flash',
    'djangocms_googlemap',
    'djangocms_inherit',
    'djangocms_link',
    'djangocms_picture',
    'djangocms_teaser',
    'djangocms_video',
    'reversion',
    'website',
    'apps.general',
    'apps.agro',
)
INSTALLED_APPS += (
    'cmsplugin_filer_file',
    'cmsplugin_filer_folder',
    'cmsplugin_filer_link',
    'cmsplugin_filer_image',
    'cmsplugin_filer_teaser',
    'cmsplugin_filer_video',
)

INSTALLED_APPS += (
    "filer",
    "mptt",
    "easy_thumbnails",
    'djangocms-css-background',
    'djangocms-placeholder-attr',
    'cmsplugin_contact',
    'rosetta',
)

THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)





LANGUAGES = (
    ## Customize this
    ('es', gettext('es')),
    ('en', gettext('en')),
)

CMS_LANGUAGES = {
    ## Customize this
    'default': {
        'public': True,
        'hide_untranslated': False,
        'redirect_on_fallback': True,
    },
    1: [
        {
            'public': True,
            'code': 'es',
            'hide_untranslated': False,
            'name': gettext('es'),
            'redirect_on_fallback': True,
        },
        {
            'public': True,
            'code': 'en',
            'hide_untranslated': False,
            'name': gettext('en'),
            'redirect_on_fallback': True,
        },
    ],
}

CMS_TEMPLATES = (
    ## Customize this
    ('home.html', 'Home'),
    ('agro/home.html', 'Agro Home'),
    ('feature.html', 'Page with Feature')
)

CMS_PERMISSION = True

CMS_PLACEHOLDER_CONF = {}

try:
    from .local_settings import DATABASES
except ImportError:
    DATABASES = {
        'default':
            {'ENGINE': 'django.db.backends.sqlite3', 'NAME': 'project.db', 'HOST': 'localhost', 'USER': '', 'PASSWORD': '', 'PORT': ''}
    }
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'localhost'
EMAIL_PORT = 25

try:
    from .local_settings import DEFAULT_FROM_EMAIL
except ImportError:
    DEFAULT_FROM_EMAIL = "no-reply@daiech.com"
