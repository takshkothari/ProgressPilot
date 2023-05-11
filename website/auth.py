from flask import Flask, Blueprint, render_template, request, flash, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from os import path

from . import db
from .models import Stud, Course, Assex, Enrolls, Takes, Belongs, Semester
from werkzeug.security import generate_password_hash, check_password_hash

from flask_login import login_user, login_required, logout_user, current_user


auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        regNo = request.form.get('regIdInput')
        password = request.form.get('passwordInput')

        studs = Stud.query.filter_by(regNo=regNo).first()
        if studs:
            if check_password_hash(studs.password, password):
                login_user(studs, remember=True)
                return redirect(url_for('views.homepage'))
            else:
                return redirect(url_for('views.home'))
        else:
            return redirect(url_for('auth.sign_up'))
    return render_template("login.html", user=current_user)

@auth.route('/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('auth.login'))

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():

    if request.method == 'POST':
        name = request.form.get('nameInput')
        regNo = request.form.get('regIdInput')
        email = request.form.get('emailInput')
        password = request.form.get('passwordInput')
        phone = request.form.get('phoneInput')
        dob = request.form.get('birthdate')

        studs = Stud.query.filter_by(regNo=regNo).first()
        if studs:
            return redirect(url_for('auth.sign_up'))
        new_stud = Stud(regNo=regNo, name=name, email=email, password=generate_password_hash(password, method='sha256'), phone=phone, dob=dob)

        db.session.add(new_stud)
        db.session.commit()

        return redirect(url_for('views.homepage'))

    return render_template("signup.html", user = current_user)