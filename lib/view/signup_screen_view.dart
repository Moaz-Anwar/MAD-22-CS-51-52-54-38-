import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/controllers/signup_controller.dart';
import 'package:medicine_delivery/routes/app_routes.dart';

import '../utils/utils.dart';
import '../widgets/round_button.dart';
import 'login_view.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();

  SignupScreenController signupScreenController = SignupScreenController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNoController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text("Create Account",
                        style: TextStyle(fontSize: 33),),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: 'Name',
                              labelText: 'Name',
                              prefixIcon: Icon(Icons.person_outline)),
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Enter Name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined)),
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'password',
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline)),
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: phoneNoController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Phone No',
                              labelText: 'Contact Number',
                              prefixIcon: Icon(Icons.phone_outlined)),
                          validator: (value){
                            if (value!.isEmpty){
                              return 'Give your contat no';
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
                SizedBox(height: 50,),
                RoundButton(
                  title: "SignUp",
                  loading: loading,
                  onPress: () {
                    if(_formKey.currentState!.validate()){
                      signupScreenController.signUp(context,emailController,passwordController,nameController,phoneNoController);
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(onPressed: (){
                      Get.toNamed(AppRoutes.loginView);
                    },
                        child: Text('Login',style: TextStyle(color: Colors.orangeAccent),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
