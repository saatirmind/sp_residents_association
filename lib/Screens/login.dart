import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spra/Screens/dashbord.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final loginController = Get.put(LoginController());

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                child: Image.asset(
                  'assets/splash.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  // if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                  //   return 'Please enter a valid 10-digit phone number';
                  // }
                  return null;
                },
                onChanged: (_) {
                  loginController.checkFormValidity(
                    _phoneController.text,
                    _passwordController.text,
                  );
                },
              ),
              SizedBox(height: 20),
              Obx(
                () => TextFormField(
                  controller: _passwordController,
                  obscureText: loginController.isPasswordHidden.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        loginController.isPasswordHidden.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        loginController.togglePasswordVisibility();
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  onChanged: (_) {
                    loginController.checkFormValidity(
                      _phoneController.text,
                      _passwordController.text,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        loginController.isButtonEnabled.value ? _login : null,
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  print("Navigate to Signup Page");
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  var isButtonEnabled = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void checkFormValidity(String phone, String password) {
    if (phone.isNotEmpty && password.isNotEmpty && password.length >= 6) {
      isButtonEnabled.value = true;
    } else {
      isButtonEnabled.value = false;
    }
  }
}
