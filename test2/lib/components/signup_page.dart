





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/View/home.dart';
import 'package:crypto/components/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
// import 'package:vessel/screens/otp_screen.dart';
// import 'package:vessel/widgets/bottom.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
 bool isObscure = true;
   final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? phone;
  String? email;
  String? password;
  String? username;



Future<void> signUp() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: mailController.text,
        password: passController.text,
      );

      // Store additional user information in Firestore (you may customize this part)
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).set({
        'username': nameController.text,
        'number': phoneController.text,
        'email': mailController.text,
        'password': passController.text,
        
      });

      print('User signed up successfully!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      print('Error signing up: $e');
    }
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
          backgroundColor: Colors.white,
          body: container(context)
        
      ));
  }





  Widget container(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
       physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
      child: Center(
        child: Container(
            
            padding: EdgeInsets.only(top: wid*0.3,bottom: wid*0.04, left: wid*0.1,  right: wid*0.1),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children: [
                
      SizedBox(height: 0),
      Text('Join us now',
                style: TextStyle(
                  fontSize: wid*0.1,
                  fontWeight: FontWeight.w600,
                ),),
      Text('Sign up',
      textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: wid*0.09,
                  color: Colors.amber,
                  fontWeight: FontWeight.w600,
                ),
      ),
      SizedBox(height: 20),
      
      
      SizedBox(height: 40),
      
      
      
      
      // ------------------ Text field
      Container(
      width: wid*0.9,
      height: 50,
      padding: EdgeInsets.only(right: wid*0.1,),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border:Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
        
      
        child: TextFormField(
          controller: mailController,
      decoration: InputDecoration(
        prefixIconColor: Color(0xffFBC700),
        prefixIcon: Icon(Icons.mail),
        hintText: 'Enter E-mail',
        border: InputBorder.none,
      ),
      style:TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      
      ),
      
        )),

SizedBox(height: 10,),
      Container(
      width: wid*0.9,
      height: 50,
      padding: EdgeInsets.only(),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border:Border.all(
          width: 2,
          color: Colors.black, ),),
        child: TextFormField(
          obscureText: isObscure,
          controller: passController,
      decoration: InputDecoration(
        hintText: 'Enter Password',

        suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });}),
        prefixIconColor: Color(0xffFBC700),
        prefixIcon: Icon(Icons.password),
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,),)),

SizedBox(height: 10,),
      Container(
      width: wid*0.9,
      height: 50,
      padding: EdgeInsets.only(right: wid*0.1,),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border:Border.all(
          width: 2,
          color: Colors.black, ),),
        child: TextFormField(
          controller: nameController,
      decoration: InputDecoration(
        hintText: 'Enter username',
        prefixIconColor: Color(0xffFBC700),
        prefixIcon: Icon(Icons.person),
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,),)),
SizedBox(height: 10,),
      Container(
      width: wid*0.9,
      height: 50,
      padding: EdgeInsets.only(right: wid*0.1),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border:Border.all(
          width: 2,
          color: Colors.black, ),),
        child: TextFormField(
          controller: phoneController,
      decoration: InputDecoration(
        prefixIconColor: Color(0xffFBC700),
        prefixIcon: Icon(Icons.phone),
        hintText: 'Enter Phone',
        border: InputBorder.none,
      ),
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,),)),
      
      

      
      
      
      
      
      
      
        // continue butoon --------------------------------------
      SizedBox(height: 30,),
        SizedBox(width: wid*0.8,
                height: 50,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Color(0xffFBC700),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),)),
      
                      // ------ Logic --------
                  onPressed: () async{
                    signUp();
                  
                    

                    
                  }, 
                  child: Text('Continue',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),),
                ),
                ),
      
      
      
      
      
        // sign Up button --------------------------------------
      SizedBox(height: 10,),
        SizedBox(width: wid*0.8,
                height: 50,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: Color(0xFF303030),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),)),
      
                      // ------ Logic --------
                  onPressed: () {
                    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
                  }, 
                  child: Text('already have account',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),),
                ),
                ),
      
      
      
              ],
            ),
        ),
      ),
    );
  }




 
}









// import 'dart:io';
// import 'package:crypto/View/splash.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:crypto/components/common/page_header.dart';
// import 'package:crypto/components/common/page_heading.dart';
// import 'package:crypto/components/login_page.dart';

// import 'package:crypto/components/common/custom_form_button.dart';
// import 'package:crypto/components/common/custom_input_field.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key}) : super(key: key);

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {

//   File? _profileImage;

//   final _signupFormKey = GlobalKey<FormState>();

//   Future _pickProfileImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if(image == null) return;

//       final imageTemporary = File(image.path);
//       setState(() => _profileImage = imageTemporary);
//     } on PlatformException catch (e) {
//       debugPrint('Failed to pick image error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Color(0xffFBC700),
//         body: SingleChildScrollView(
//           child: Form(
//             key: _signupFormKey,
//             child: Column(
//               children: [
//                 const PageHeader(),
//                 Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
//                   ),
//                   child: Column(
//                     children: [
//                       const PageHeading(title: 'Sign-up',),
//                       SizedBox(
//                         width: 130,
//                         height: 130,
//                         child: CircleAvatar(
//                           backgroundColor: Colors.grey.shade200,
//                           backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 bottom: 5,
//                                 right: 5,
//                                 child: GestureDetector(
//                                   onTap: _pickProfileImage,
//                                   child: Container(
//                                     height: 50,
//                                     width: 50,
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue.shade400,
//                                       border: Border.all(color: Colors.white, width: 3),
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                     child: const Icon(
//                                       Icons.camera_alt_sharp,
//                                       color: Colors.white,
//                                       size: 25,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16,),
//                       CustomInputField(
//                           labelText: 'Name',
//                           hintText: 'Your name',
//                           isDense: true,
//                           validator: (textValue) {
//                             if(textValue == null || textValue.isEmpty) {
//                               return 'Name field is required!';
//                             }
//                             return null;
//                           }
//                       ),
//                       const SizedBox(height: 16,),
//                       CustomInputField(
//                           labelText: 'Email',
//                           hintText: 'Your email id',
//                           isDense: true,
//                           validator: (textValue) {
//                             if(textValue == null || textValue.isEmpty) {
//                               return 'Email is required!';
//                             }
//                             if(!EmailValidator.validate(textValue)) {
//                               return 'Please enter a valid email';
//                             }
//                             return null;
//                           }
//                       ),
//                       const SizedBox(height: 16,),
//                       CustomInputField(
//                           labelText: 'Contact no.',
//                           hintText: 'Your contact number',
//                           isDense: true,
//                           validator: (textValue) {
//                             if(textValue == null || textValue.isEmpty) {
//                               return 'Contact number is required!';
//                             }
//                             return null;
//                           }
//                       ),
//                       const SizedBox(height: 16,),
//                       CustomInputField(
//                         labelText: 'Password',
//                         hintText: 'Your password',
//                         isDense: true,
//                         obscureText: true,
//                         validator: (textValue) {
//                           if(textValue == null || textValue.isEmpty) {
//                             return 'Password is required!';
//                           }
//                           return null;
//                         },
//                         suffixIcon: true,
//                       ),
//                       const SizedBox(height: 22,),
//                       CustomFormButton(innerText: 'Signup', onPressed: () {
//                         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => Splash()));
      
//                       },),
//                       const SizedBox(height: 18,),
//                       SizedBox(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const Text('Already have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
//                             GestureDetector(
//                               onTap: () => {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
//                               },
//                               child: const Text('Log-in', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 30,),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // void _handleSignupUser() {
//   //   // signup user
//   //   if (_signupFormKey.currentState!.validate()) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       const SnackBar(content: Text('Submitting data..')),
//   //     );
//   //   }
//   // }
// }
