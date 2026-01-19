import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vango_driver_app/features/pages/auth/OTP_verification.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    const Color vangoBlue = Color(0xFF2D325A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // 1. THE DIAGONAL BACKGROUND
              ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  width: double.infinity,
                  height: 450,
                  color: vangoBlue,
                ),
              ),

              // 2. THE CONTENT
              SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    // Header Text
                    Text('Join us', 
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    Text('Create Account', 
                      style: GoogleFonts.inter(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300)),
                    
                    const Spacer(),

                    // 3. THE PERSONAL INFO CARD
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                    Navigator.pop(context); // This takes the user back to the previous screen
                              },
                              icon: const Icon(
                                Icons.arrow_circle_left, 
                                size: 35, // Increased size slightly to match the UI better
                                color: Colors.black,
                                        ),
                                padding: EdgeInsets.zero, // Removes default padding to align perfectly
                                constraints: const BoxConstraints(), // Removes default minimum button size
                        ),
                              const SizedBox(width: 40),
                              Text('Personal Info', 
                                style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _inputLabel('First Name'),
                          _buildTextField('First Name', Icons.edit),
                          const SizedBox(height: 15),
                          _inputLabel('Last Name'),
                          _buildTextField('Last Name', Icons.edit),
                          const SizedBox(height: 15),
                          _inputLabel('Date of Birth'),
                          _buildTextField('Enter Your Birthday', Icons.badge_outlined),
                          const SizedBox(height: 15),
                          _inputLabel('Phone Number'),
                          Row(
                            children: [
                              // Country Picker Placeholder
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    const Text('🇱🇰', style: TextStyle(fontSize: 20)),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(child: _buildTextField('Enter Your Phone Number', null)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Create Account Button
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                   MaterialPageRoute(builder: (context) => const OTPVerification()),
                      );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: vangoBlue,
                                shape: StadiumBorder(),
                              ),
                              child: Text('Create Account', 
                                style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(label, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildTextField(String hint, IconData? suffixIcon) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon, color: Colors.black, size: 20) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF2D325A), width: 2),
        ),
      ),
    );
  }
}

// FIX: Ensure this method is named getClip, NOT getPath
class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.7); 
    path.lineTo(size.width, size.height * 0.9); 
    path.lineTo(size.width, 0); 
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}