import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_monkey/utils/Constants.dart';

import '../Helper/TrainglePainter.dart';
import '../utils/Api.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();

}

class _RegisterState extends State<Register> {
  var _fromKey = GlobalKey<FormState>();
  var _userController = TextEditingController();
  var _userError = "";
  var _passwordController = TextEditingController();
  var _passwordError = "";
  var _emailController = TextEditingController();
  var _emailError = "";
  var _phoneController = TextEditingController();
  var _phoneError = "";
  var errorMsg =[];
  @override
  Widget build(BuildContext context) { 
     var mSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
         CustomPaint(
          painter: TrainglePainter(mSize),
        ),
         SingleChildScrollView(
           child: Column(
           children: [
            SizedBox(
              height: 100,
            ),
              Image.asset("assets/images/fm.png",scale: 1.5,),
              SizedBox(
              height:10,
            ),
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Register",style: TextStyle(fontSize: 23,color: Constants.normal,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Form(key: _fromKey,child: 
                Column(
                  children: [
                    TextFormField(
                      controller: _userController,
                      validator: (value) {
                        if(value!.isEmpty){
                        errorMsg.add("Cant be empty");
                        return "cant be empty";
                        }else{
                          return null;
                        }
                      },
                      onChanged: ((value) {
                        if(value.length > 1 && value.length < 6){
                          setState(() {
                             _userError = "Must be greater than six words";
                          });
                         
                        }else{
                         setState(() {
                             _userError = "";
                          });
                        }

                        if(value.isEmpty){
                          setState(() {
                            _userError = "Can't be empty";
                          });
                        }else{
                          setState(() {
                            _userError = "";
                          });
                        }
                      }),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
                      ],
                      style: TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        labelText: "Username",
                        errorText: _userError,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                    ),
                    // SizedBox(height: 10,),
                     TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if(value!.isEmpty){
                          errorMsg.add("Email cant be empty");
                          return "Email cant be empty";
                        }
                        
                      },
                      onChanged: ((value) {
                        if(value.length < 11){
                          setState(() {
                          _emailError = "Must have at least eleven words";
                        });
                        }else{
                          setState(() {
                            _emailError = "";
                          });
                        }
                      }),
                      style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    labelText: "Email",
                    errorText: _emailError,
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                // SizedBox(height: 10,),
                 TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if(value!.isEmpty){
                      errorMsg.add("Phone cant be empty");
                      return "Phone cant be empty";
                    }
                  },
                  onChanged: (value) {
                    if(value.length < 7 || value.length > 11){
                      setState(() {
                        _phoneError = "Phone must be between 7 and 11";
                      });
                    }else{
                      setState(() {
                        _phoneError ="";
                      });
                    }
                  },
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    labelText: "phone",
                    errorText: _phoneError,
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                // SizedBox(height: 10,),
                 TextFormField(
                  controller: _passwordController,
                  style: TextStyle(fontSize: 12),
                  obscureText: true,
                  validator: (value) {
                    if(value!.isEmpty){
                        errorMsg.add("Password cannot empty");
                        return "Password cannot empty";
                    }
                  },
                  onChanged: (value) {
                    if(value.length < 6){
                      setState(() {
                        _passwordError = "Password must be at least six numbers";
                      });
                    }else{
                      setState(() {
                        _passwordError = "";
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    errorText: _passwordError,
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                // SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    
                    RaisedButton(color: Constants.accent,onPressed: (){
                      var con = _fromKey.currentState!.validate();

                      if(con){
                      var username = _userController.text;
                      var email = _emailController.text;
                      var phone = _phoneController.text;
                      var password = _passwordController.text;
                      Api.getAllRegisters(username,email,phone,password);
                      }else{
                        print(errorMsg);
                      }
                      
                    },child: Row(
                      children: [
                        Icon(Icons.person,color: Colors.white,),
                        Text("Register",style:TextStyle(color: Colors.white),
                        ),
                      ],
                    ),),
                  ],
                )
                  ],
                ),
                
                ),
              )
           ],),
         ) 
        ],
      ),
    );
  }
}