def is_debug(request):
    from django.conf import settings
    return {"DEBUG": settings.DEBUG}


def url_base(request):
    from django.conf import settings
    return {"URL_BASE": settings.URL_BASE}

