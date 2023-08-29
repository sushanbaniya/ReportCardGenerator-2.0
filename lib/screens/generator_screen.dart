import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../widgets/my_drawer.dart';

class GeneratorScreen extends StatefulWidget {
  static const routeName = '/generator-screen';

  const GeneratorScreen({super.key});

  @override
  State<GeneratorScreen> createState() => _GeneratorScreenState();
}

class _GeneratorScreenState extends State<GeneratorScreen> {
  var name1;
  var symbolNumber1;
  var math1;
  var physics1;
  var chemistry1;
  var nepali1;
  var english1;
  var _form = GlobalKey<FormState>();

  void saveForm() {
    _form.currentState!.save();
    print(name1 +
        symbolNumber1 +
        math1 +
        physics1 +
        chemistry1 +
        nepali1 +
        english1);

    _submitForm();
    Navigator.of(context).pop();
  }

  Future<void> _submitForm() async {
    var name = name1;
    var symbolNumber = symbolNumber1;
    var mathMarks = math1;
    var physicsMarks = physics1;
    var chemistryMarks = chemistry1;
    var nepaliMarks = nepali1;
    var englishMarks = english1;

    // Firebase Realtime Database URL
    String databaseURL =
        // 'https://your-firebase-project.firebaseio.com/students.json'; // Replace with your Firebase URL
        'https://reportcardgenerator99-default-rtdb.firebaseio.com/students.json';

    try {
      final response = await http.post(
        Uri.parse(databaseURL),
        body: json.encode({
          'name': name,
          'symbolNumber': symbolNumber,
          'mathMarks': mathMarks,
          'physicsMarks': physicsMarks,
          'chemistryMarks': chemistryMarks,
          'nepaliMarks': nepaliMarks,
          'englishMarks': englishMarks,
        }),
      );

      if (response.statusCode == 200) {
        // Data is successfully saved
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('Entered details has been stored in database')),
        );
      } else {
        // An error occurred
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.reasonPhrase}')),
        );
      }
    } catch (error) {
      // An error occurred
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'REPORT CARD GENERATOR',
          style: TextStyle(
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 130,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(130),
          ),
        ),
      ),
      body: Stack(
        children: [
          Icon(Icons.wifi_tethering_outlined,
              size: 400, color: Theme.of(context).primaryColor),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 170),
                Text(
                  'ENTER DETAILS',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 300,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
          // Center(child: Icon(Icons.arrow_downward, size: 200))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            // backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(79),
            ),
            // isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Enter Name'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid name';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            name1 = newValue.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Enter Symbol Number'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid symbol number';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            symbolNumber1 = newValue.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Marks in Math'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid marks in math';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            math1 = newValue.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Marks in Physics'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid marks in physics';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            physics1 = newValue.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Marks in Chemistry'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid marks in chemistry';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            chemistry1 = newValue.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Marks in Nepali'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid marks in nepali';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            nepali1 = newValue.toString();
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Marks in English'),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid marks in english';
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            english1 = newValue.toString();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // maximumSize: Size(39,300),
                            // maximumSize: Size(70,40),
                            // fixedSize: Size(10,40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(79),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          child: Text('Generate Report Card !! '),
                          onPressed: () {
                            if (_form.currentState!.validate()) {
                              saveForm();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
