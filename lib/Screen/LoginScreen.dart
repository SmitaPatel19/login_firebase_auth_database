import 'package:flutter/material.dart';
import 'package:login_firebase_new/functions/authFunctions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String username='';
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('SignUp/Login'),
      //   centerTitle: true,
      //   backgroundColor: Colors.deepPurple,
      //   foregroundColor: Colors.white,
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width-100,
          child: Form(
            key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isLogin? TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Username'),
                    key: ValueKey('username'),
                    validator: (value){
                      if(value.toString().isEmpty){
                        return 'Usename should not be empty';
                      }
                      else return null;
                    },
                    onSaved: (value){
                      setState(() {
                        username=value!;
                      });
                    },
                  ) : Container(),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Email'),
                    key: ValueKey('email'),
                    validator: (value){
                      if(!value.toString().contains('@')){
                        return 'Invalid Email';
                      }
                      else return null;
                    },
                    onSaved: (value){
                      setState(() {
                        email=value!;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Enter Password'),
                    key: ValueKey('password'),
                    obscureText: true,
                    validator: (value){
                      if(value.toString().length<8){
                        return 'Password should be of at least 8 characters.';
                      }
                      else return null;
                    },
                    onSaved: (value){
                      setState(() {
                        password=value!;
                      });
                    },
                  ),

                  SizedBox(height: 20,),

                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          _formkey.currentState!.save();
                          isLogin? signin(email, password) : signup(email, password );
                        }
                      },
                      child: isLogin? Text("Login") : Text('SignUp'),
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextButton(
                      onPressed: (){
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: isLogin? Text("Don't have an account? SignUp") : Text("Already have an account? Login"),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
