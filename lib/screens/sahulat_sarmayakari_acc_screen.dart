import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Utils/custome_text.dart';
import 'package:emlaak/Widgets/Elevtaed_btn/custome_elevtaed_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Widgets/form_and_date_picker/form_and_date_picker.dart';

// Import your custom widgets here
// import 'custom_textformfield.dart';

class SahulatSarmayakariAccScreen extends StatefulWidget {
  const SahulatSarmayakariAccScreen({super.key});

  @override
  State<SahulatSarmayakariAccScreen> createState() => _SahulatSarmayakariAccScreenState();
}

class _SahulatSarmayakariAccScreenState extends State<SahulatSarmayakariAccScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Form Controllers
  final _fullNameController = TextEditingController();
  final _cnicController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _employerNameController = TextEditingController();
  final _monthlyIncomeController = TextEditingController();
  final _nextOfKinNameController = TextEditingController();
  final _nextOfKinCnicController = TextEditingController();
  final _nextOfKinContactController = TextEditingController();
  final _residentialAddressController = TextEditingController();
  final _mailingAddressController = TextEditingController();

  // Dropdown Values
  String? _selectedTitle;
  String? _selectedOccupation;
  String? _selectedIncomeSource;
  String? _selectedZakat;

  // Date Values
  DateTime? _cnicIssuanceDate;

  @override
  void dispose() {
    _fullNameController.dispose();
    _cnicController.dispose();
    _motherNameController.dispose();
    _employerNameController.dispose();
    _monthlyIncomeController.dispose();
    _nextOfKinNameController.dispose();
    _nextOfKinCnicController.dispose();
    _nextOfKinContactController.dispose();
    _residentialAddressController.dispose();
    _mailingAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
        title: SizedBox(
          height: 40,
          child: Image.asset("assets/logo.png", fit: BoxFit.contain),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Center(
                  child: Column(
                    children: [
                      CustomText(
                        "Al Meezan Islamic Cash Fund",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Account Information Card
                _buildAccountInfoCard(),
                const SizedBox(height: 24),
                
                // Personal Information Form
                _buildPersonalInfoSection(),
                const SizedBox(height: 24),
                
                // Employment Information
                _buildEmploymentInfoSection(),
                const SizedBox(height: 24),
                
                // Next of Kin Information
                _buildNextOfKinSection(),
                const SizedBox(height: 24),
                
                // Address Information
                _buildAddressSection(),
                const SizedBox(height: 32),
                
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shadowColor: Colors.green.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_balance_wallet_outlined, size: 20),
                        const SizedBox(width: 8),
                        CustomText(
                          "Open Account",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfoCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: CustomText(
                "Sahulat Sarmayakari Account",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("Key Features", Icons.star_outline),
                const SizedBox(height: 12),
                _buildFeatureItem("Maximum Transaction Limit", "Rs 400,000"),
                _buildFeatureItem("Annual Investment Limit", "Rs 800,000"),
                _buildFeatureItem("Maximum Investment Limit", "Rs 1,000,000"),
                const SizedBox(height: 16),
                _buildSectionHeader("Document Requirements", Icons.description_outlined),
                const SizedBox(height: 8),
                _buildDocumentItem("No Documents Required"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoSection() {
    return _buildFormSection(
      title: "Personal Information",
      icon: Icons.person_outline,
      children: [
        Row(
          children: [
            SizedBox(
              width: 100,
              child: CustomDropdownFormField<String>(
                labelText: "Title",
                hintText: "Title",
                value: _selectedTitle,
                isRequired: true,
                items: ['Mr', 'Ms', 'Mrs', 'Dr']
                    .map((title) => DropdownMenuItem(
                          value: title,
                          child: Text(title, style: const TextStyle(fontSize: 15)),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _selectedTitle = value),
                validator: (value) => value == null ? 'Please select title' : null,
              ),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: CustomTextFormField(
                labelText: "Full Name",
                hintText: "Enter your full name",
                controller: _fullNameController,
                isRequired: true,
                textCapitalization: TextCapitalization.words,
                prefixIcon: const Icon(Icons.person, color: Colors.grey),
                validator: (value) => value?.isEmpty ?? true ? 'Please enter full name' : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "CNIC",
          hintText: "00000-0000000-0",
          controller: _cnicController,
          isRequired: true,
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.credit_card, color: Colors.grey),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CNICFormatter(),
          ],
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter CNIC';
            if (value!.length != 15) return 'CNIC must be 13 digits';
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomDatePickerField(
          labelText: "CNIC Issuance Date",
          hintText: "Select issuance date",
          selectedDate: _cnicIssuanceDate,
          isRequired: true,
          onDateSelected: (date) => setState(() => _cnicIssuanceDate = date),
          validator: (date) => date == null ? 'Please select issuance date' : null,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "Mother's Name",
          hintText: "Enter mother's name",
          controller: _motherNameController,
          isRequired: true,
          textCapitalization: TextCapitalization.words,
          prefixIcon: const Icon(Icons.person, color: Colors.grey),
          validator: (value) => value?.isEmpty ?? true ? 'Please enter mother\'s name' : null,
        ),
      ],
    );
  }

  Widget _buildEmploymentInfoSection() {
    return _buildFormSection(
      title: "Employment Information",
      icon: Icons.work_outline,
      children: [
        CustomDropdownFormField<String>(
          labelText: "Occupation",
          hintText: "Select occupation",
          value: _selectedOccupation,
          isRequired: true,
          items: ['Employee', 'Self Employed', 'Business', 'Student', 'Retired', 'Housewife', 'Other']
              .map((occupation) => DropdownMenuItem(
                    value: occupation,
                    child: Text(occupation),
                  ))
              .toList(),
          onChanged: (value) => setState(() => _selectedOccupation = value),
          validator: (value) => value == null ? 'Please select occupation' : null,
        ),
        const SizedBox(height: 16),
        CustomDropdownFormField<String>(
          labelText: "Source of Income",
          hintText: "Select income source",
          value: _selectedIncomeSource,
          isRequired: true,
          items: ['Salary', 'Business', 'Investment', 'Rental Income', 'Pension', 'Other']
              .map((source) => DropdownMenuItem(
                    value: source,
                    child: Text(source),
                  ))
              .toList(),
          onChanged: (value) => setState(() => _selectedIncomeSource = value),
          validator: (value) => value == null ? 'Please select income source' : null,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "Name of Employer",
          hintText: "Enter employer name",
          controller: _employerNameController,
          textCapitalization: TextCapitalization.words,
          prefixIcon: const Icon(Icons.business, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "Monthly Income",
          hintText: "Enter monthly income",
          controller: _monthlyIncomeController,
          isRequired: true,
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.attach_money, color: Colors.grey),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: (value) => value?.isEmpty ?? true ? 'Please enter monthly income' : null,
        ),
        const SizedBox(height: 16),
        CustomDropdownFormField<String>(
          labelText: "Zakat",
          hintText: "Select zakat option",
          value: _selectedZakat,
          isRequired: true,
          items: ['Yes', 'No']
              .map((zakat) => DropdownMenuItem(
                    value: zakat,
                    child: Text(zakat),
                  ))
              .toList(),
          onChanged: (value) => setState(() => _selectedZakat = value),
          validator: (value) => value == null ? 'Please select zakat option' : null,
        ),
      ],
    );
  }

  Widget _buildNextOfKinSection() {
    return _buildFormSection(
      title: "Next of Kin Details",
      icon: Icons.family_restroom,
      children: [
        CustomTextFormField(
          labelText: "Next of Kin Name",
          hintText: "Enter next of kin name",
          controller: _nextOfKinNameController,
          isRequired: true,
          textCapitalization: TextCapitalization.words,
          prefixIcon: const Icon(Icons.person, color: Colors.grey),
          validator: (value) => value?.isEmpty ?? true ? 'Please enter next of kin name' : null,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "Next of Kin CNIC",
          hintText: "00000-0000000-0",
          controller: _nextOfKinCnicController,
          isRequired: true,
          keyboardType: TextInputType.number,
          prefixIcon: const Icon(Icons.credit_card, color: Colors.grey),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CNICFormatter(),
          ],
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter next of kin CNIC';
            if (value!.length != 15) return 'CNIC must be 13 digits';
            return null;
          },
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "Next of Kin Contact No",
          hintText: "03xx-xxxxxxx",
          controller: _nextOfKinContactController,
          isRequired: true,
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone, color: Colors.grey),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            PhoneFormatter(),
          ],
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter contact number';
            if (value!.length < 12) return 'Please enter valid contact number';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildAddressSection() {
    return _buildFormSection(
      title: "Address Information",
      icon: Icons.location_on_outlined,
      children: [
        CustomTextFormField(
          labelText: "Residential Address",
          hintText: "Enter complete residential address",
          controller: _residentialAddressController,
          isRequired: true,
          maxLines: 3,
          textCapitalization: TextCapitalization.sentences,
          prefixIcon: const Icon(Icons.home, color: Colors.grey),
          validator: (value) => value?.isEmpty ?? true ? 'Please enter residential address' : null,
        ),
        const SizedBox(height: 16),
        CustomTextFormField(
          labelText: "Mailing Address",
          hintText: "Enter mailing address (if different from residential)",
          controller: _mailingAddressController,
          maxLines: 3,
          textCapitalization: TextCapitalization.sentences,
          prefixIcon: const Icon(Icons.mail, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _mailingAddressController.text.isEmpty,
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _mailingAddressController.text = _residentialAddressController.text;
                  } else {
                    _mailingAddressController.clear();
                  }
                });
              },
              activeColor: Colors.green,
            ),
            const Expanded(
              child: Text(
                "Same as residential address",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Helper method to build form sections
  Widget _buildFormSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(title, icon),
            const SizedBox(height: 20),
            ...children,
          ],
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        const SizedBox(width: 8),
        CustomText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ],
    );
  }

  // Helper method to build feature items
  Widget _buildFeatureItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build document items
  Widget _buildDocumentItem(String document) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              document,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Form submission method
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          );
        },
      );

      // Simulate API call
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close loading dialog
        
        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 24),
                  SizedBox(width: 8),
                  Text("Success"),
                ],
              ),
              content: const Text(
                "Your account application has been submitted successfully. You will receive a confirmation email shortly.",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(); // Go back to previous screen
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            );
          },
        );
      });
    } else {
      // Show error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please fill in all required fields"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }
}

// Custom Input Formatters
class CNICFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    
    if (text.length <= 5) {
      return newValue;
    } else if (text.length <= 12) {
      return TextEditingValue(
        text: '${text.substring(0, 5)}-${text.substring(5)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    } else if (text.length <= 13) {
      return TextEditingValue(
        text: '${text.substring(0, 5)}-${text.substring(5, 12)}-${text.substring(12)}',
        selection: TextSelection.collapsed(offset: text.length + 2),
      );
    }
    
    return oldValue;
  }
}

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    
    if (text.length <= 4) {
      return newValue;
    } else if (text.length <= 11) {
      return TextEditingValue(
        text: '${text.substring(0, 4)}-${text.substring(4)}',
        selection: TextSelection.collapsed(offset: text.length + 1),
      );
    }
    
    return oldValue;
  }
}