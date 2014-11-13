# -*- coding: utf-8 -*-
from django.conf.urls import patterns, url


urlpatterns = patterns('',
    url(r'^conozca-destaju$', 'apps.general.views.description', name='conozca-destaju'),
)