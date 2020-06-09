import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _calories;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      maxLength: 10,
      decoration: InputDecoration(
        labelText: "Name",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Name is Required";
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "E-mail",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "E-mail is Required";
        }
        if (!RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return "Please enter a valid e-mail address.";
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: "Password",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Password is Required";
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildUrl() {
    return TextFormField(
      keyboardType: TextInputType.url,
      decoration: InputDecoration(
        labelText: "Url",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Url is Required";
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "Phone Number",
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Phone Number is Required";
        }

        return null;
      },
      onSaved: (String value) {
        _phoneNumber = value;
      },
    );
  }

  Widget _buildCalories() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Calories",
      ),
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return "Calories must be grater than 0";
        }

        return null;
      },
      onSaved: (String value) {
        _calories = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Form Demo"))),
      body: Container(
        margin: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildEmail(),
              _buildPassword(),
              _buildUrl(),
              _buildPhoneNumber(),
              _buildCalories(),
              SizedBox(height: 100.0),
              RaisedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  _formKey.currentState.save();

                  print(_name);
                  print(_email);
                  print(_phoneNumber);
                  print(_url);
                  print(_password);
                  print(_calories);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
