import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:umla_project/controller/sign.dart'; // Ensure this path is correct
import 'package:umla_project/view/HomeScreen.dart';
import 'package:umla_project/view/SignInUpPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Successfully signed in!'),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to sign in: ${e.message}'),
        ));
      }
    }
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoZ0noOEF0z_ZvMxo1oEU6TWImf4FMpTL2Rm-N5a6Ok183jiUEPVYxyyOxczcdDaAisdM&usqp=CAU",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'Adhicine',
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 45, 176),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  label: Text('Enter email'),
                  prefixIcon: Icon(
                    Icons.alternate_email_outlined,
                    color: Colors.blue,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Password',
                  label: const Text('Enter password'),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Container(
                height: 30,
                width: 200,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  onPressed: _signIn,
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                icon: const Icon(Icons.login),
                label: const Text('Continue with Google'),
                onPressed: () async {
                  try {
                    final user = await UserController.loginWithGoogle();

                    if (user != null && mounted) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  } on FirebaseAuthException catch (error) {
                    print(error.message);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        error.message ?? "Something went wrong",
                      ),
                    ));
                  } catch (error) {
                    print(error);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        error.toString(),
                      ),
                    ));
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to Adhicine?'),
                  TextButton(
                    onPressed: _navigateToSignUp,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:umla_project/controller/sign.dart';
// import 'package:umla_project/view/HomeScreen.dart';
// import 'package:umla_project/view/SignInUpPage.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool _isPasswordVisible = false;

//   void _signIn() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _auth.signInWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         );
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Successfully signed in!'),
//           ),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Failed to sign in: ${e.message}'),
//         ));
//       }
//     }
//   }

//   void _navigateToSignUp() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => SignUpPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               Image.network(
//                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoZ0noOEF0z_ZvMxo1oEU6TWImf4FMpTL2Rm-N5a6Ok183jiUEPVYxyyOxczcdDaAisdM&usqp=CAU",
//                 width: 100,
//                 height: 100,
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Adhicine',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 15, 45, 176),
//                 ),
//               ),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Sign in',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 26,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   hintText: 'Email',
//                   label: Text('Enter email'),
//                   prefixIcon: Icon(
//                     Icons.alternate_email_outlined,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   return null;
//                 },
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: passwordController,
//                 obscureText: !_isPasswordVisible,
//                 obscuringCharacter: '*',
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                   label: const Text('Enter password'),
//                   prefixIcon: const Icon(
//                     Icons.lock,
//                     color: Colors.blue,
//                   ),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 height: 30,
//                 width: 200,
//                 child: ElevatedButton(
//                   style: const ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                   ),
//                   onPressed: _signIn,
//                   child: const Text(
//                     'Sign in',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10.0),
//                     child: Text(
//                       'OR',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 style: const ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                 ),
//                 icon: const Icon(Icons.login),
//                 label: const Text('Continue with Google'),
//                 onPressed: () async {
//                   try {
//                     final user = await UserController.loginWithGoogle();

//                     if (user != null && mounted) {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => HomeScreen(),
//                         ),
//                       );
//                     }
//                   } on FirebaseAuthException catch (error) {
//                     print(error.message);

//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                         error.message ?? "Something went wrong",
//                       ),
//                     ));
//                   } catch (error) {
//                     print(error);

//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                         error.toString(),
//                       ),
//                     ));
//                   }
//                 },
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('New to Adhicine?'),
//                   TextButton(
//                     onPressed: _navigateToSignUp,
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
