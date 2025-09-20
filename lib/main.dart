import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

// Root of the app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login & Signup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AuthPage(), // Loads the authentication screen first
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
  // Controllers to capture user input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLogin = true; // true = Login mode, false = Signup mode
  bool _isPasswordVisible = false; // Password visibility toggle

  // -------------------- VALIDATION AND NAVIGATION --------------------
  void validateFields() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Basic email validation (checks for '@')
    if (!email.contains('@')) {
      Fluttertoast.showToast(msg: "Please enter a valid email!");
      return;
    }

    // Ensure password is not empty
    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password!");
      return;
    }

    // Show success message based on mode
    Fluttertoast.showToast(
        msg: isLogin ? "Login Successful!" : "Signup Successful!");

    // Navigate to Welcome Screen
    // (Note: Navigator.push keeps AuthPage in backstack, so user can go back)
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
        // Avoids overflow when keyboard opens
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.lock, size: 100, color: Colors.deepPurple),
              const SizedBox(height: 20),

              // Title changes based on Login/Signup mode
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
                obscureText: !_isPasswordVisible, // Password hide/show
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    // Eye icon to toggle password visibility
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
                  onPressed: validateFields, // Runs validation & navigation
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // -------------------- SIGNUP TOGGLE TEXT --------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Switches form to Signup mode
                      setState(() {
                        isLogin = false;
                      });
                    },
                    child: const Text(
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
          padding: const EdgeInsets.all(16.0),
          child: FittedBox(
            // Ensures text scales on small devices
            fit: BoxFit.scaleDown,
            child: const Text(
              "Where Innovation Meets Flutter!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
