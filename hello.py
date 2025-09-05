print("Hello World")

x = 12

if x == 12:
    print("x is 12")
else:
    print("x is not 12")

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def greet(self):
        print(f"Hello, my name is {self.name} and I am {self.age} years old.")

person = Person("John", 30)
person.greet()
