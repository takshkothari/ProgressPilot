from flask import Blueprint, render_template, request

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    data = request.form
    print(data)
    return render_template("login.html", boolean=True)

@auth.route('/logout')
def logout():
    return "<p>Logout</p>"

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        name = request.form.get('nameInput')
        regID = request.form.get('regIdInput')
        email = request.form.get('emailInput')
        password = request.form.get('passwordInput')
        phone = request.form.get('phoneInput')
        dob = request.form.get('birthdate')



    return render_template("signup.html")