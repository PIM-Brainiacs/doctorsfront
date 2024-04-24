
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/components/common/page_heading.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:login_signup/components/common/custom_input_field.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

import '../components/buttons.dart';
import '../constents/constents.dart';

//import 'package:intl/intl.dart';



class AddDoctor extends StatefulWidget {
  
  const AddDoctor({Key? key}) : super(key: key);
  

  @override
  State<AddDoctor> createState() => _SignupPageState();
  
}

class _SignupPageState extends State<AddDoctor> {

  final _signupFormKey = GlobalKey<FormState>();
  final TextEditingController _date = TextEditingController();
  int currentStep = 0;
  onSteppedTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            key: _signupFormKey,
            children: [
               const Center(
                child: Image(
                  image: AssetImage('images/friendship.png'),
                  height: 250,
                  width: 250,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 12.0, right: 70, top: 0, bottom: 0),
                child: Row(
                  
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 0, bottom: 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: themeColor,
                      minRadius: 10,
                      maxRadius: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Signup',
                      
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                     isDense: true,
                    
                         
          
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                  ),
                ),
                
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: IntlPhoneField(
                  languageCode: 'en',
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  controller: _date,
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (pickeddate != null) {
                      setState(
                        () {
                           _date.text =
                              "${pickeddate.day.toString().padLeft(2, '0')}-${pickeddate.month.toString().padLeft(2, '0')}-${pickeddate.year.toString()}";
                          //_date.text =
                              //DateFormat('dd-MM-yyyy').format(pickeddate);
                        },
                      );
                    }
                  },
                  
                  decoration: InputDecoration(
                    hintText: 'DOB',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: const TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              
               const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextFormField(
                  validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Email is required!';
                            }
                            if(!EmailValidator.validate(textValue)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            
              Padding(
                
  padding: const EdgeInsets.symmetric(horizontal: 30.0),
  child: TextFormField(
  obscureText: true, // Rend le texte du champ de mot de passe obscur
    
    validator: (textValue) {
      if (textValue == null || textValue.isEmpty) {
        return 'Veuillez entrer votre mot de passe'; // Message si le champ est vide
      }
      // Ajoutez d'autres validations selon vos besoins, par exemple la longueur minimale du mot de passe, etc.
      return null; // Retourne null si la validation réussit
    },
    decoration: InputDecoration(
      hintText: 'Password',
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: const Icon(
        Icons.lock_outline,
        color: Colors.grey,
      ),
     
      fillColor: Colors.white,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),
),

              
              const SizedBox(
                height: 15,
                
              ),
               CustomFormButton(innerText: 'add', onPressed: _handleSignupUser,),
               const SizedBox(height: 15,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Already have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                            GestureDetector(
                             
                              child: const Text('Log-in', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
              
            ],
          ),
        ),
      ),
    );
    const SizedBox(height: 22,);
                     
                      
                      const SizedBox(height: 30,);
                  
  }

  void _handleSignupUser() {
    // signup user
    if (_signupFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
    }
  }
}

 
