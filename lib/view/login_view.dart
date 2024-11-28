import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/controllers/login_controller.dart';
import 'package:medicine_delivery/routes/app_routes.dart';
import '../constants/image_constant.dart';
import '../widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginController loginScreenController = LoginController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
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
                        Text("WellCome Back!",
                          style: TextStyle(fontSize: 33),),
                        SizedBox(
                          height: 30,
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
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                RoundButton(
                  title: "Login",
                  loading: loading,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      loginScreenController.login(context,passwordController,emailController);
                    }
                    },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.signupView);
                        },
                        child: Text('Sign Up',style: TextStyle(color: Colors.orangeAccent),))
                  ],
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Center(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone_outlined),
                          SizedBox(width: 10,),
                          Text('Login with Phone'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)
                    ),
                    child: Center(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImageConstant.googleImage,
                            height: 30,),
                          SizedBox(width: 10,),
                          Text('Continue with Gogle'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
