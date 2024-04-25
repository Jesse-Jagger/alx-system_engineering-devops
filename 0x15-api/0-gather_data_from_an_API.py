#!/usr/bin/python3
""" Rest API script that gathers data from an API. """
import json
import sys
import urllib
import urllib.request

# This base API url is for getting the employee object
USER_API_URL = "https://jsonplaceholder.typicode.com/users/"

# This base API url is for getting all todo objects for an employee
TODO_API_URL = "https://jsonplaceholder.typicode.com/todos?userId="

# Employee ID passed as an argument to the script
employee_id: str = sys.argv[1] if len(sys.argv) > 1 else ""

# Get all the todos for a given employee ID
if employee_id.isdigit():
    try:
        user_url = f"{USER_API_URL}{employee_id}"
        todos_url = f"{TODO_API_URL}{employee_id}"

        employee_response = urllib.request.urlopen(user_url)
        todos_response = urllib.request.urlopen(todos_url)

        employee_data = employee_response.read()
        todos_data = todos_response.read()

        employee = json.loads(employee_data)
        todos = json.loads(todos_data)

        name = employee.get("name")
        done = len([todo for todo in todos if todo.get("completed")])
        total = len(todos)

        print(f"Employee {name} is done with tasks({done}/{total}):")
        for todo in todos:
            if todo.get("completed"):
                print(f"\t {todo.get('title')}")

    except urllib.error.URLError as err:
        print(f"An error occurred: {err}")
    except json.JSONDecodeError as err:
        print(f"Error decoding JSON: {err}")

