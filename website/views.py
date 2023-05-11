from flask import Blueprint, render_template, request, flash
from flask_login import login_required, current_user

views = Blueprint('views', __name__)

@views.route('/')
def home():
    return render_template("home.html")

@views.route('/home')
@login_required
def homepage():
    return render_template('homepage.html')