import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Register';
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: MyCustomForm(),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  String _selectedGender = 'male';
  bool isChecked = false;
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool checkedValue = false;

    var kPrimaryColor;
    var child;
    TextEditingController UserName =
        TextEditingController(); //username from signup form
    TextEditingController UserEmail =
        TextEditingController(); //user email from singup form
    TextEditingController UserPassword =
        TextEditingController(); // user password from signup form
    TextEditingController usercheckbox = TextEditingController();
    // user gender from form is  _selectedGender
    // user have a car or ni from form is checkedValue
    // user name from login form is nameController
    // user password from login form is passwordController,

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: UserName,
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Like : Jone Doe',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: UserEmail,
            decoration: const InputDecoration(
              icon: const Icon(Icons.email),
              hintText: 'Like : example@ex.cpm',
              labelText: 'E-mail',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: UserPassword,
            obscureText: true,
            obscuringCharacter: "*",
            decoration: const InputDecoration(
                icon: const Icon(Icons.password),
                hintText: 'Don\'t Forget It',
                labelText: 'Password'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter ur password';
              }
              return null;
            },
          ),
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
                icon: const Icon(Icons.question_answer),
                labelText: 'Have a Car ?'),
          ),
          Text('             If Yes , Chech This Button'),
          Checkbox(
            value: true,
            onChanged: (newValue) {
              setState(() {
                checkedValue = true;
              });
            },
          ),
          ListTile(
            leading: Radio(
              value: 'male',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = 'male';
                });
              },
            ),
            title: Text('Male'),
          ),
          ListTile(
            leading: Radio(
              value: 'female',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() {
                  _selectedGender = 'female';
                });
              },
            ),
            title: Text('Female'),
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              // ignore: deprecated_member_use
              child: new RaisedButton(
                child: const Text('Submit'),
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a Snackbar.
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Data is in processing.')));
                  }
                },
              )),
        ],
      ),
    );
  }
}
