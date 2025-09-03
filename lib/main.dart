import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login & Signup',
      debugShowCheckedModeBanner: false, // Removes the debug banner
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // App theme color
      ),
      home: const AuthPage(), // First screen when app starts
    );
  }
}

// ------------------------- AUTH PAGE (LOGIN / SIGNUP) -------------------------
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // TextEditingControllers for capturing user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLogin = true; // Toggle between Login and Signup
  bool _isPasswordVisible = false; // For showing/hiding password text

  // -------------------- VALIDATION AND NAVIGATION --------------------
  void validateFields() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Basic email validation
    if (!email.contains('@')) {
      Fluttertoast.showToast(msg: "Please enter a valid email!");
      return;
    }
    // Password check
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password!");
      return;
    }

    // Show toast message based on action
    Fluttertoast.showToast(
        msg: isLogin ? "Login Successful!" : "Signup Successful!");

    // Navigate to Welcome Screen after validation
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text("Flutter Authentication"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        // SingleChildScrollView helps avoid overflow when keyboard appears
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 20),
              Text(
                isLogin ? 'Welcome Back!' : 'Create an Account',
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // -------------------- EMAIL FIELD --------------------
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),

              // -------------------- PASSWORD FIELD --------------------
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible, // Toggle password visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Updates UI when visibility icon is pressed
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // -------------------- LOGIN / SIGNUP BUTTON --------------------
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: validateFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Button color
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    isLogin ? 'Login' : 'Signup',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white, // Button text color
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // -------------------- SIGNUP TOGGLE TEXT --------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLogin = false; // Switch to Signup mode
                      });
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
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

// ------------------------- WELCOME SCREEN -------------------------
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text("Building with Flutter"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around text
          child: FittedBox(
            fit: BoxFit.scaleDown, // Prevents text overflow on small screens
            child: Text(
              "Where Innovation Meets Flutter!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center, // Centers text
            ),
          ),
        ),
      ),
    );
  }
}
