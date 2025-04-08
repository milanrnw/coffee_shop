import 'package:coffee_shop/presentation/custom_widgets/auth_button.dart';
import 'package:coffee_shop/presentation/custom_widgets/create_pin_field.dart';
import 'package:coffee_shop/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({super.key});

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final createPinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFFFEFEFE),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
          iconSize: 24,
        ),
        title: Text(
          'Create a PIN',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0XFF3C3C3C),
          ),
        ),
      ),
      backgroundColor: Color(0XFFFEFEFE),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                color: Color(0XFF3C3C3C).withValues(alpha: 0.15),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  children: [
                    Image.asset('assets/images/create_pin_image.png'),
                    SizedBox(height: screenHeight * 0.04),
                    Text(
                      'Finally, Your final step....',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF3C3C3C),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.001),
                    Text(
                      'Enter 6 numbers to keep your account safe',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Color(0XFF3C3C3C),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    CreatePinField(createPinController: createPinController),
                    SizedBox(height: screenHeight * 0.01),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          'show your PIN',
                          style: TextStyle(
                            color: Color(0XFF555555),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 56),
                        child: Icon(Icons.remove_red_eye_outlined),
                      ),
                    ],
                    ),
                    SizedBox(height: screenHeight * 0.298),
                    AuthButton(
                        buttonText: 'Confirm',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
