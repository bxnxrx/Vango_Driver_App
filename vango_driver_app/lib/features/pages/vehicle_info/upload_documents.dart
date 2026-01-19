import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vango_driver_app/features/pages/home/home_page.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    const Color vangoBlue = Color(0xFF2D325A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. SHARED DIAGONAL BACKGROUND
          ClipPath(
            clipper: BackgroundClipper(), // Reuse your existing clipper
            child: Container(
              width: double.infinity,
              height: 450,
              color: vangoBlue,
            ),
          ),

          // 2. CONTENT CARD
          SafeArea(
            child: Center(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button and Title
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_circle_left, size: 35),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Upload Documents',
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Front Side Section
                    Text('Front side', 
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    _buildUploadZone(vangoBlue),

                    const SizedBox(height: 25),

                    // Back Side Section
                    Text('Back side', 
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 10),
                    _buildUploadZone(vangoBlue),

                    const SizedBox(height: 40),

                    // Continue Button
                    Center(
                      child: SizedBox(
                        width: 250,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                  context,
                                   MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: vangoBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
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
    );
  }

  // Helper to build the large rounded upload rectangles
  Widget _buildUploadZone(Color buttonColor) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: SizedBox(
          width: 120,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.file_upload_outlined, size: 18, color: Colors.white),
            label: const Text('Upload', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
      ),
    );
  }
}

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