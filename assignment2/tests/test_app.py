import os
import unittest
import app

class TestApp(unittest.TestCase):
    '''
    test case for app.py.
    Mainly just tested to see if database would always start up empty because
    testing other methods required an active HTTP request.
    '''

    def setUp(self):
        # set up a temporary database to test the following functions
        # checking if a file called "kanban.db" already exists,
        # if so, delete it and instantiate a new one
        if os.path.isfile("./kanban.db"):
            os.remove("./kanban.db")

        self.db = app.db.create_all()

    def test_empty_database(self):
        # test if the database is originally empty upon start-up
        self.assertEqual(self.db, None)

    def tearDown(self):
        # disposing of the temporary test database
        os.remove("./kanban.db")

if __name__ == '__main__':
    unittest.main()
