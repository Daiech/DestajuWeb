from cms.app_base import CMSApp
from cms.apphook_pool import apphook_pool
from django.utils.translation import ugettext_lazy as _


class AgroApp(CMSApp):
    name = _("Agro App")  # give your app a name, this is required
    urls = ["agro.urls"]  # link your app to url configuration(s)
    app_name = "agro"

apphook_pool.register(AgroApp)  # register your app