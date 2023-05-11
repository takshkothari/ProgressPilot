from . import db
from flask_login import UserMixin
from sqlalchemy.sql import func

class Stud(db.Model, UserMixin):
    regNo = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(50))
    phone = db.Column(db.String(10))
    dob = db.Column(db.String(10))
    enrollss = db.relationship('Enrolls')
    takess = db.relationship('Takes')
    sems = db.relationship('Semester')

class Course(db.Model):
    courseId = db.Column(db.String(10), primary_key=True)
    title = db.Column(db.String(50))
    credits = db.Column(db.Integer)
    enrollss = db.relationship('Enrolls')
    belongss = db.relationship('Belongs')

class Assex(db.Model):
    aeId = db.Column(db.String(10), primary_key=True)
    maxMarks = db.Column(db.Integer)
    courseId = db.Column(db.Integer, db.ForeignKey('course.courseId'))
    takess = db.relationship('Takes')
    belongss = db.relationship('Belongs')

class Enrolls(db.Model):
    regNo = db.Column(db.Integer, db.ForeignKey('stud.regNo'), primary_key=True)
    courseId = db.Column(db.Integer, db.ForeignKey('course.courseId'), primary_key=True)
    sem = db.Column(db.Integer, primary_key=True)
    grade = db.Column(db.String(2))

class Takes(db.Model):
    regNo = db.Column(db.Integer, db.ForeignKey('stud.regNo'), primary_key=True)
    aeId = db.Column(db.Integer, db.ForeignKey('assex.aeId'), primary_key=True)
    marks = db.Column(db.Integer)

class Belongs(db.Model):
    aeId = db.Column(db.Integer, db.ForeignKey('assex.aeId'), primary_key=True)
    courseId = db.Column(db.Integer, db.ForeignKey('course.courseId'), primary_key=True)

class Semester(db.Model):
    regNo = db.Column(db.Integer, db.ForeignKey('stud.regNo'), primary_key=True)
    sem = db.Column(db.Integer, primary_key=True)
    gpa = db.Column(db.Float)