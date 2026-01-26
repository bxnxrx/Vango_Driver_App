import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vango_driver_app/screens/vehicle_info/document_verification.dart';
import 'package:vango_driver_app/widgets/background_cliper.dart';

class AddVehicle extends StatelessWidget {
  const AddVehicle({super.key});

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
              // 1. DIAGONAL BACKGROUND
              ClipPath(
                clipper: BackgroundClipper(),
                child: Container(
                  width: double.infinity,
                  height: 450,
                  color: vangoBlue,
                ),
              ),

              // 2. VEHICLE ILLUSTRATION
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Center(
                  child: Image.network(
                    'https://your-image-url-here.png', // Replace with your asset image
                    height: 120,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.directions_bus,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              // 3. MAIN CARD
              SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 160),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_circle_left, size: 35),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Add Your Vehicle',
                                  style: GoogleFonts.inter(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // FORM FIELDS
                            _buildLabel("Make"),
                            _buildDropdown("Select...."),
                            
                            _buildLabel("Type"),
                            _buildDropdown("Select...."),

                            _buildLabel("Year"),
                            _buildDropdown("Select...."),

                            _buildLabel("License plate"),
                            _buildTextField(""),

                            _buildLabel("Seat capacity"),
                            _buildTextField("", isNumeric: true),

                            const Spacer(),

                            // Confirm Button
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                   MaterialPageRoute(builder: (context) => const DocumentVerification()),
                      );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: vangoBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  'Confirm',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  // Label Helper
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, top: 10),
      child: Text(
        text,
        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  // Dropdown Helper
  Widget _buildDropdown(String hint) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(hint, style: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
          items: [],
          onChanged: (value) {},
        ),
      ),
    );
  }

  // Text Field Helper
  Widget _buildTextField(String hint, {bool isNumeric = false}) {
    return Container(
      height: 50,
      child: TextField(
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          suffixIcon: isNumeric ? const Icon(Icons.unfold_more, color: Colors.black) : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xFF2D325A), width: 2),
          ),
        ),
      ),
    );
  }
}

