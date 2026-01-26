import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vango_driver_app/screens/vehicle_info/upload_documents.dart';
import 'package:vango_driver_app/widgets/background_cliper.dart';

class DocumentVerification extends StatelessWidget {
  const DocumentVerification({super.key});

  @override
  Widget build(BuildContext context) {
    const Color vangoBlue = Color(0xFF2D325A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. DIAGONAL BACKGROUND
          ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              width: double.infinity,
              height: 450,
              color: vangoBlue,
            ),
          ),

          // 2. MAIN CARD
          SafeArea(
            child: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                padding: const EdgeInsets.all(25),
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
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_circle_left, size: 35),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Document Verification',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Driver License Illustration
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'lib/assets/images/Driving_license.jpg',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Instruction Text
                    Text(
                      'Hey Sakith!',
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.inter(color: Colors.black, fontSize: 14, height: 1.5),
                          children: const [
                            TextSpan(text: 'Please provide a Photo of the '),
                            TextSpan(text: 'Front ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'and '),
                            TextSpan(text: 'Back ', style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'of your Drives License'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Upload Buttons
                    _buildUploadButton(context, 'Photo of Front Side ID', vangoBlue),
                    const SizedBox(height: 15),
                    _buildUploadButton(context, 'Photo of Back Side ID', vangoBlue),
                    
                    const SizedBox(height: 40),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context, String text, Color color) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UploadDocuments()),
          );
        },
        icon: const Icon(Icons.file_upload_outlined, color: Colors.white),
        label: Text(
          text,
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}

