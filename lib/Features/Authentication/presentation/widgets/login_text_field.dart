import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({super.key, required this.labelText, required this.suffixIcon, required this.isPassword,
    required this.onChange, required this.controller,});
final String labelText;
final Icon suffixIcon;
final bool isPassword;
  final TextEditingController controller;
final Function (String) onChange;
  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
       validator: widget.isPassword ?
           (value) {
         if (value == null || value.isEmpty) {
           return 'Please enter a password';
         } else if (value.length < 8) {
           return 'Password must be at least 8 characters';
         }
         // else if (!RegExp(r'[A-Z]').hasMatch(value)) {
         //   return 'Password must contain at least one uppercase letter';}
         else if (!RegExp(r'[0-9]').hasMatch(value)) {
           return 'Password must contain at least one number';
         }
         return null; // Input is valid
       }
      : (value) {
         if (value == null || value.isEmpty) {
           return 'Please enter an email';
         } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
             .hasMatch(value)) {
           return 'Please enter a valid email address';
         }
         return null; // Email is valid
       },
      obscureText: widget.isPassword ? !_passwordVisible : false,

      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: GoogleFonts.cairo(fontSize: 15.49, fontWeight: FontWeight.w500,),
        suffixIcon: widget.isPassword ?  IconButton(
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_outlined
            : Icons.visibility_off_outlined

          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        )
            : widget.suffixIcon,
      ),
      onChanged: (text) {
        widget.onChange.call(text);
      },
    );
  }
}
