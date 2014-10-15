# -*- coding: utf-8 -*-

from django import forms
from website.models import *

from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _


class AnalyseMgfForm(forms.ModelForm):
    class Meta:
        model = AnalyseMgf
        exclude = ["owner","ignore"]

    def __init__(self, *args, **kwargs):
        super(AnalyseMgfForm, self).__init__(*args, **kwargs)
        self.fields['AAs'].initial = AA.objects.filter(type=2)
        self.fields['modifications'].initial = AAModification.objects.filter(type=2)

    def clean_mgf(self):
        return self.cleaned_data["mgf"]

    def save(self,commit=True,request=None):
        object = super(forms.ModelForm,self).save(commit=False)
        object.owner = request.user
        object.ignore = False

        if commit :
            object.save()
        return object

class CreatUserForm(UserCreationForm):
    #~ _('mail') was in EmailField django 1.5
    email = forms.EmailField(label = _('mail'))

    class Meta:
        model = User
        fields = ("email",)

    def save(self, commit=True):
        user = super(CreatUserForm, self).save(commit=False)
        user.email = self.cleaned_data["email"]
        user.username= self.cleaned_data["username"]
        if commit:
            user.save() 
            pass
        return user

class CreateBlastForm(forms.ModelForm):
    class Meta:
        model = BlastAnalyse
        exclude = ["xml","fasta"]

    def __init__(self,*args,**kwargs):
        user = kwargs.pop('user')
        ana = kwargs.pop('ana')
        super(forms.ModelForm, self).__init__(*args, **kwargs)
        self.fields["analyse"].queryset = AnalyseMgf.objects.filter(owner=user)
        self.fields["analyse"].initial = ana


