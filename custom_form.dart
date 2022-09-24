import 'package:dio_postapi/Ui/validators.dart';
import 'package:flutter/material.dart';

import 'alliraries.dart';
import 'custom_feild.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late FocusNode myFocusNode;
  String? gender;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerForName = TextEditingController();
  TextEditingController controllerForLastName = TextEditingController();
  TextEditingController controllerForGender = TextEditingController();
  TextEditingController controllerForDob = TextEditingController();
  TextEditingController controllerForEmail = TextEditingController();
  TextEditingController controllerForPhone = TextEditingController();
  TextEditingController controllerForPassword = TextEditingController();
  TextEditingController controllerForConfirmation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Create a new account"),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [

                firstName(),
                lastName(),
                genderSelect(),
                dob(),
                email(),
                phone(),
                password(),
                confirmPassword(),
                signUp()
              ],
            ),
          ),
          floatingActionButton: focusNode()),
    );
  }

  firstName() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        focusAuto: true,
        controller: controllerForName,
        validator: (value) => validateName(value),
        labelText: 'Name',
        hint: 'Enter your name',
        nodeFocus: null,
        keyBoard: TextInputType.name);
  }

  lastName() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        controller: controllerForLastName,
        validator: (value) => validateLastName(value),
        labelText: 'Last Name',
        hint: 'Enter your last name',
        focusAuto: false,
        nodeFocus: null,
        keyBoard: TextInputType.name);
  }

  genderSelect() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            margin:
                EdgeInsets.only(left: getFullWidth(context: context) * 0.08),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Gender?",
            )),
        RadioListTile(
          title: const Text("Male"),
          value: "male",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text("Female"),
          value: "female",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text("Other"),
          value: "other",
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        )
      ],
    );
  }

  dob() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        nodeFocus: myFocusNode,
        controller: controllerForDob,
        validator: (value) => validateDob(value),
        labelText: 'DOB',
        hint: 'DD/MM/YY',
        focusAuto: false,
        keyBoard: TextInputType.datetime);
  }

  email() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        controller: controllerForEmail,
        validator: (value) => validateEmail(value),
        labelText: 'Email or Phone Number',
        hint: 'xyz@gmail.com',
        focusAuto: false,
        nodeFocus: null,
        keyBoard: TextInputType.emailAddress);
  }

  phone() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        controller: controllerForPhone,
        validator: (value) => validatePhone(value),
        labelText: 'Phone Number',
        hint: '00000 00000',
        focusAuto: false,
        nodeFocus: null,
        keyBoard: TextInputType.phone);
  }

  password() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        controller: controllerForPassword,
        validator: (value) => validatePassword(value),
        labelText: 'Password',
        hint: '**',
        focusAuto: false,
        nodeFocus: null,
        keyBoard: TextInputType.visiblePassword);
  }

  confirmPassword() {
    return CustomField(
        length: getFullHeight(context: context) * 0.10,
        breadth: getFullWidth(context: context) * 0.90,
        controller: controllerForConfirmation,
        validator: (value) => validateConfirmation(value),
        labelText: 'Confirm Password',
        hint: '**',
        focusAuto: false,
        nodeFocus: null,
        keyBoard: TextInputType.visiblePassword);
  }

  signUp() {
    return ElevatedButton(
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          final snackBar = SnackBar(
            content: const Text('Data Entered Successfully'),
            backgroundColor: Colors.green,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.black,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: const Text('Incorrect Data'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Try Again',
              textColor: Colors.black,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const Text("Sign Up"),
    );
  }

  focusNode() {
    return FloatingActionButton(
      child: const Icon(Icons.edit),
      onPressed: () => myFocusNode.requestFocus(),
    );
  }
}
