from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/
    path('', views.index, name = 'index'),
    # ex: /polls/5/
    path('<int:question_id>', views.details, name = 'detail'),
    # ex: /polls/5/results/
    path('<int:question_id>/results/', views.details, name = 'results'),
    # ex: /polls/5/vote/
    path('int:question_id>/vote/', views.details, name = 'vote'),
]
