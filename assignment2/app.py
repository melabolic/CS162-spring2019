import os
from flask import Flask, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy

project_dir = os.path.dirname(os.path.abspath(__file__)) # gets our current project directory
database_file = "sqlite:///{}".format(os.path.join(project_dir, "kanban.db"))

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = database_file # initialises the database connection
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True # to prevent warning message for setup.py

db = SQLAlchemy(app)

# creating the Task class to store the task title and status
class Task(db.Model):
    title = db.Column(db.String(80), unique=True, nullable=False, primary_key=True)
    status = db.Column(db.String(80), nullable=False)

    def __repr__(self):
        return "<Title :{}".format(self.title)

# home page
@app.route("/", methods = ["GET", "POST"])
def home():
    if request.form:
        task = Task(title=request.form.get("title"),
                    status=request.form.get("status"))
        db.session.add(task)
        db.session.commit()
    todo = Task.query.filter_by(status="todo").all()
    doing = Task.query.filter_by(status="doing").all()
    done = Task.query.filter_by(status="done").all()
    return render_template("kanban.html", todo=todo, doing=doing, done=done)

# when the user chooses to change a task from todo to doing
@app.route("/doing", methods=["POST"])
def doing():
    title = request.form.get("title")
    task = Task.query.filter_by(title=title).first()
    task.status = "doing"
    db.session.commit()
    return redirect("/")

# when the user chooses to change a task from doing to done
@app.route("/done", methods=["POST"])
def done():
    title = request.form.get("title")
    task = Task.query.filter_by(title=title).first()
    task.status = "done"
    db.session.commit()
    return redirect("/")

# when the user wants to delete a task
@app.route("/delete", methods=["POST"])
def delete():
    title = request.form.get("title")
    task = Task.query.filter_by(title=title).first()
    db.session.delete(task)
    db.session.commit()
    return redirect("/")

if __name__ == "__main__":
    db.create_all()
    app.run(debug=True)
