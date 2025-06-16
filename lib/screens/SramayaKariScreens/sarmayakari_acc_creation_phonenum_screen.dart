import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Utils/custome_text.dart';
import 'package:emlaak/Widgets/AppBar/custom_appbar.dart';
import 'package:emlaak/Widgets/Elevtaed_btn/custome_elevtaed_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/form_and_date_picker/form_and_date_picker.dart'
    show CustomTextFormField;
import '../Sahulat_Sramayakari_screen/sahulat_sarmayakari_acc_screen.dart';
import 'sarmayakari_acc_creation_otp_screen.dart';

class SarmayakariAccCreationphoneNumberScreen extends StatefulWidget {
  const SarmayakariAccCreationphoneNumberScreen({super.key});

  @override
  State<SarmayakariAccCreationphoneNumberScreen> createState() =>
      _SarmayakariAccCreationphoneNumberScreenState();
}

class _SarmayakariAccCreationphoneNumberScreenState
    extends State<SarmayakariAccCreationphoneNumberScreen> {
  final TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomText(
              "Please Enter there you Pakistani Phone Number  ",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              labelText: "Pakistani Phone Number please",
              hintText: "03xx-xxxxxxx",
              controller: _phoneNumber,
              isRequired: true,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone, color: Colors.grey),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                PhoneFormatter(),
              ],
              validator: (value) {
                if (value?.isEmpty ?? true)
                  return 'Please enter contact number';
                if (value!.length < 12)
                  return 'Please enter valid contact number';
                return null;
              },
            ),
            SizedBox(height: 20),
            CustomElevatedButton(
              text: "SENT OTP",
              onPressed: () {
                if (_phoneNumber.text.isNotEmpty &&
                    _phoneNumber.text.length == 12) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SarmayakariAccCreationOtpScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter a valid phone number"),
                    ),
                  );
                }
              },
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
