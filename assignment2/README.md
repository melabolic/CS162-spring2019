## Kanban Board assignment
### Jie Wen Lim, Spring 2019

This is the Kanban Board that I created for assignment 2 of CS162: Software Development. This assignment uses flask and SQLAlchemy.

### Project Structure:
assignment2 (root folder):
- requirements.txt
- app.py
- templates
  - kanban.html
- tests
  - test_app.py


### To run the code:
Simply unzip the .zip file and boot up a virtual engine inside the root folder, as so:

`python3.6 -m venv .venv`
`source .venv/bin/activate`

Next, run the following code to execute the program:

`pip3 install -r requirements.txt`
`python3 /flask/app.py`

Run `localhost:5000` in your browser to see the Kanban board.

### Running unittest:
To run unittest, simply do:

`python3 -m unittest discover tests`
