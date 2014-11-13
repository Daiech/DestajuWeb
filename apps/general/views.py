from django.shortcuts import render
from django.conf import settings
from django.http import HttpResponse

# Create your views here.

def description(request):
    pdf = open(settings.STATICFILES_DIRS[0] + "/pdf/Descripcion-Destaju-V1.1.pdf", "r")
    response = HttpResponse(pdf.read(), mimetype='application/pdf')
    response['Content-Disposition'] = 'inline;filename=Description.pdf'
    pdf.close()
    return response