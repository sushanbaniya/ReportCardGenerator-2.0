import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



import '../widgets/my_drawer.dart';

class Student {
  var name;
  var mathMarks;
  var physicsMarks;
  var chemistryMarks;
  var nepaliMarks;
  var englishMarks;

  Student({
    required this.name,
    required this.mathMarks,
    required this.physicsMarks,
    required this.chemistryMarks,
    required this.nepaliMarks,
    required this.englishMarks,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    print('JSON Data: $json');
    print('Name: ${json['name']}');
    // ... other fields
    return Student(
      name: json['name'],
      mathMarks: int.parse(json['mathMarks']),
      physicsMarks: int.parse(json['physicsMarks']),
      chemistryMarks: int.parse(json['chemistryMarks']),
      nepaliMarks: int.parse(json['nepaliMarks']),
      englishMarks: int.parse(json['englishMarks']),
    );
  }
}

class FetchDataScreen extends StatefulWidget {
  static const routeName = '/display-screen';
  @override
  _FetchDataScreenState createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  List<Student> _students = [];

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse(
        'https://reportcardgenerator99-default-rtdb.firebaseio.com/students.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      _students = data.entries.map((entry) {
        final studentData = entry.value as Map<String, dynamic>;
        return Student.fromJson({
          'name': studentData['name'],
          'mathMarks': studentData['mathMarks'],
          'physicsMarks': studentData['physicsMarks'],
          'chemistryMarks': studentData['chemistryMarks'],
          'nepaliMarks': studentData['nepaliMarks'],
          'englishMarks': studentData['englishMarks'],
          // Add more fields as needed
        });
      }).toList();

      setState(() {});
    }
  }

  double calculatePercentage(Student student) {
    final totalMarks = student.mathMarks +
        student.physicsMarks +
        student.chemistryMarks +
        student.nepaliMarks +
        student.englishMarks;

    final maximumMarks = 500; // Assuming maximum marks is 500 for all subjects

    return (totalMarks / maximumMarks) * 100;
  }

  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Report Cards'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor),
              onPressed: _fetchData,
              child: Text('Tap to View the most recent data !!'),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final student = _students[index];
                  return Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    elevation: 3.0,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Math: ${student.mathMarks}',
                          ),
                          Text(
                            'Physics: ${student.physicsMarks}',
                          ),
                          Text(
                            'Chemistry: ${student.chemistryMarks}',
                          ),
                          Text(
                            'Nepali: ${student.nepaliMarks}',
                          ),
                          Text(
                            'English: ${student.englishMarks}',
                          ),
                          Divider(),
                          Text(
                            'Percentage: ${calculatePercentage(student)} %',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: FetchDataScreen()));
