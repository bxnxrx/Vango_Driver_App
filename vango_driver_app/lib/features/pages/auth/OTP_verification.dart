import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vango_driver_app/features/pages/vehicle_info/add_vehicle.dart';
import 'package:vango_driver_app/core/widgets/background_cliper.dart';


class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    const Color vangoBlue = Color(0xFF2D325A);

    return Scaffold(
      backgroundColor: Colors.white, // Bottom half remains white
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              // 1. THE DIAGONAL BACKGROUND (Matches your other screens)
              ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  width: double.infinity,
                  height: 500, // Consistent fixed height
                  color: vangoBlue,
                ),
              ),

              // 2. THE CONTENT
              SafeArea(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 47),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header with Back Button
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.arrow_circle_left, size: 35, color: Colors.black),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              'OTP Verification',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        
                        Text(
                          'Enter the security code we sent to',
                          style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 14),
                        ),
                        
                        // Phone Number and Edit Icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '+94 77 007 6363',
                              style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(width: 5),
                            const Icon(Icons.edit, size: 16),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // 6 OTP TEXT BOXES
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(6, (index) => _buildOtpTextField(context)),
                        ),
                        
                        const SizedBox(height: 40),

                        // Verify Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                   MaterialPageRoute(builder: (context) => const AddVehicle()),
                      );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: vangoBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Verify',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        Text(
                          "Don't Receive the OTP?",
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 14),
                        ),

                        // Resend Button (TextButton)
                        TextButton(
                          onPressed: () {
                            // Logic for resending OTP
                          },
                          child: Text(
                            "Resend OTP - 00:59",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for OTP Input
  Widget _buildOtpTextField(BuildContext context) {
    return Container(
      width: 42,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

