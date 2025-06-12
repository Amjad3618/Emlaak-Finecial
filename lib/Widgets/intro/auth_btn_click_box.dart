import 'package:flutter/material.dart';

/// A reusable authentication dialog widget for sign up and sign in functionality.
/// 
/// This dialog provides a clean interface with name (for sign-up), email and password fields,
/// along with action buttons for authentication and account switching.
class AuthDialog extends StatefulWidget {
  /// Creates an [AuthDialog].
  /// 
  /// [isSignIn] determines whether the dialog is in sign-in or sign-up mode.
  /// [onAuthenticate] is called when the primary action button is pressed.
  /// [onSwitchMode] is called when the user wants to switch between sign-in and sign-up.
  const AuthDialog({
    super.key,
    this.isSignIn = true,
    this.onAuthenticate,
    this.onAuthenticateWithName,
    this.onSwitchMode,
  });

  /// Whether the dialog is in sign-in mode (true) or sign-up mode (false).
  final bool isSignIn;

  /// Callback function called when authenticate button is pressed for sign-in.
  /// 
  /// Receives [email] and [password] as parameters.
  final void Function(String email, String password)? onAuthenticate;

  /// Callback function called when authenticate button is pressed for sign-up.
  /// 
  /// Receives [name], [email] and [password] as parameters.
  final void Function(String name, String email, String password)? onAuthenticateWithName;

  /// Callback function called when the user wants to switch authentication mode.
  final VoidCallback? onSwitchMode;

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}

class _AuthDialogState extends State<AuthDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isObscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Validates name field.
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  /// Validates email format.
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validates password strength.
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  /// Handles the authentication process.
  void _handleAuthenticate() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call delay
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          
          // Call the appropriate callback based on the mode
          if (widget.isSignIn) {
            widget.onAuthenticate?.call(
              _emailController.text.trim(),
              _passwordController.text,
            );
          } else {
            widget.onAuthenticateWithName?.call(
              _nameController.text.trim(),
              _emailController.text.trim(),
              _passwordController.text,
            );
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
        ),
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                _buildHeader(),
                
                const SizedBox(height: 20),
                
                // Name Field (only for sign-up)
                if (!widget.isSignIn) ...[
                  _buildNameField(),
                  const SizedBox(height: 14),
                ],
                
                // Email Field
                _buildEmailField(),
                
                const SizedBox(height: 14),
                
                // Password Field
                _buildPasswordField(),
                
                const SizedBox(height: 20),
                
                // Action Buttons
                _buildActionButtons(),
                
                const SizedBox(height: 12),
                
                // Switch Mode Button
                _buildSwitchModeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the dialog header with title and icon.
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            widget.isSignIn ? Icons.login : Icons.person_add,
            size: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          widget.isSignIn ? 'Welcome Back' : 'Create Account',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          widget.isSignIn 
              ? 'Sign in to your account' 
              : 'Join us today',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  /// Builds the name input field (only for sign-up).
  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: _validateName,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Full Name',
        hintText: 'Enter your full name',
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIcon: const Icon(Icons.person_outlined, color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  /// Builds the email input field.
  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _validateEmail,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIcon: const Icon(Icons.email_outlined, color: Colors.black54),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  /// Builds the password input field.
  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _isObscurePassword,
      textInputAction: TextInputAction.done,
      validator: _validatePassword,
      onFieldSubmitted: (_) => _handleAuthenticate(),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        labelStyle: const TextStyle(color: Colors.black54),
        hintStyle: const TextStyle(color: Colors.black54),
        prefixIcon: const Icon(Icons.lock_outlined, color: Colors.black54),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.black54,
          ),
          onPressed: () {
            setState(() {
              _isObscurePassword = !_isObscurePassword;
            });
          },
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  /// Builds the action buttons (Cancel and Authenticate).
  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _isLoading ? null : () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: Colors.white, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleAuthenticate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  )
                : Text(
                    widget.isSignIn ? 'Sign In' : 'Sign Up',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ],
    );
  }

  /// Builds the switch mode button.
  Widget _buildSwitchModeButton() {
    return TextButton(
      onPressed: _isLoading ? null : widget.onSwitchMode,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: widget.isSignIn 
                  ? "Don't have an account? " 
                  : "Already have an account? ",
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
            TextSpan(
              text: widget.isSignIn ? 'Sign Up' : 'Sign In',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Utility class to show authentication dialogs.
class AuthDialogUtils {
  /// Shows a sign-in dialog.
  static Future<void> showSignInDialog(
    BuildContext context, {
    required void Function(String email, String password) onSignIn,
    VoidCallback? onSwitchToSignUp,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AuthDialog(
        isSignIn: true,
        onAuthenticate: onSignIn,
        onSwitchMode: onSwitchToSignUp,
      ),
    );
  }

  /// Shows a sign-up dialog.
  static Future<void> showSignUpDialog(
    BuildContext context, {
    required void Function(String name, String email, String password) onSignUp,
    VoidCallback? onSwitchToSignIn,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AuthDialog(
        isSignIn: false,
        onAuthenticateWithName: onSignUp,
        onSwitchMode: onSwitchToSignIn,
      ),
    );
  }
}