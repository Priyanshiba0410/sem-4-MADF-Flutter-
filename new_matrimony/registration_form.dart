import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:matrimony_new/new_matrimony/db_helper.dart';



class RegistrationForm extends StatefulWidget {
  final Map<String, dynamic>? userDetail;
  final Function(Map<String, dynamic>)? onSubmit;

  RegistrationForm({super.key, this.userDetail, this.onSubmit});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final DBHelper dbHelper = DBHelper();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  List<String> cities = ['Ahmedabad', 'Surat', 'Rajkot', 'Vadodara'];
  String? selectedCity;
  String? gender;
  bool isReading = false;
  bool isMusic = false;
  bool isTimepass = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    if (widget.userDetail != null) {
      nameController.text = widget.userDetail!['name'] ?? '';
      emailController.text = widget.userDetail!['email'] ?? '';
      phoneController.text = widget.userDetail!['phone'] ?? '';
      selectedCity = widget.userDetail!['city'] ?? cities[0];
      dobController.text = widget.userDetail!['dob'] ?? '';
      passwordController.text = widget.userDetail!['password'] ?? '';
      confirmPasswordController.text = widget.userDetail!['confirmPassword'] ?? '';
      gender = widget.userDetail!['gender'];
      isReading = widget.userDetail!['hobbies']?.contains('Reading') ?? false;
      isMusic = widget.userDetail!['hobbies']?.contains('Music') ?? false;
      isTimepass = widget.userDetail!['hobbies']?.contains('Timepass') ?? false;
    } else {
      selectedCity = cities[0];
    }
  }

  void resetForm() {
    _formKey.currentState?.reset();
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    dobController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    gender = null;
    isReading = false;
    isMusic = false;
    isTimepass = false;
    setState(() {});
  }

  void submitForm() async {
    if (_formKey.currentState!.validate()) {
      int age = calculateAge(dobController.text);
      Map<String, dynamic> userData = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'dob': dobController.text,
        'age': age,
        'city': selectedCity ?? '',
        'gender': gender ?? '',
        'hobbies': [
          if (isReading) 'Reading',
          if (isMusic) 'Music',
          if (isTimepass) 'Timepass'
        ].join(', '),
      };

      await dbHelper.insertUser(userData);

      Navigator.pop(context, userData);
    }
  }
  int calculateAge(String dob) {
    DateTime birthDate = DateFormat('dd-MM-yyyy').parse(dob);
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userDetail == null ? 'Registration' : 'Edit User',
          style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg.jpeg'), // Replace with your image path
              fit: BoxFit.cover, // This ensures the image covers the whole screen
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Name Field
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Enter your name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Icon(Icons.person),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        } else if (!RegExp(r'^[a-zA-Z\s]{3,50}$')
                            .hasMatch(value)) {
                          return 'Enter a valid full name (3-50 characters, alphabets only)';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Email Field
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter your email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Phone Field
                    TextFormField(
                      controller: phoneController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allows only numbers
                        LengthLimitingTextInputFormatter(10), // Limits input to 10 digits
                      ],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Enter your mobile number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Icon(Icons.call),
                      ),
                      validator: (value) => value!.length != 10 ? 'Enter a valid phone number' : null,
                    ),
                    SizedBox(height: 16),

                    // DOB Field
                    TextFormField(
                      controller: dobController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: "Select your BirthDate",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            dobController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty) return 'Please select your date of birth';
                        if (calculateAge(value) < 18) return 'You must be at least 18 years old';
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              suffixIcon: Icon(Icons.location_city),
                            ),
                            value: selectedCity,
                            items: cities.map((String city) {
                              return DropdownMenuItem<String>(value: city, child: Text(city));
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a city';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Password Field


                    SizedBox(height: 16),

                    Row(
                      children: [
                        Text(
                          "Gender:",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            Radio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                            Text("Male"),
                            Radio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                });
                              },
                            ),
                            Text("Female"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hobbies :", style: TextStyle(fontSize: 15)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: isReading,
                                  onChanged: (value) {
                                    setState(() {
                                      isReading = !isReading;
                                    });
                                  },
                                ),
                                Text('Reading'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isMusic,
                                  onChanged: (value) {
                                    setState(() {
                                      isMusic = !isMusic;
                                    });
                                  },
                                ),
                                Text('Music'),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: isTimepass,
                                  onChanged: (value) {
                                    setState(() {
                                      isTimepass = !isTimepass;
                                    });
                                  },
                                ),
                                Text('Time Pass'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Submit & Reset Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: submitForm,
                          child: Text(widget.userDetail == null ? 'Submit' : 'Edit',style: TextStyle(color: Colors.pink),),
                        ),
                        ElevatedButton(
                          onPressed: resetForm,
                          child: Text('Reset',style: TextStyle(color: Colors.pink),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}