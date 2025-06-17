import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Utils/custome_text.dart';
import 'package:emlaak/Widgets/AppBar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Widgets/form_and_date_picker/form_and_date_picker.dart';

// Import your custom widgets here
// import 'path/to/your/custom_form_widgets.dart';

class SarmayakariProfileMakingScreen extends StatefulWidget {
  const SarmayakariProfileMakingScreen({super.key});

  @override
  State<SarmayakariProfileMakingScreen> createState() => _SarmayakariProfileMakingScreenState();
}

class _SarmayakariProfileMakingScreenState extends State<SarmayakariProfileMakingScreen> {
  final _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();
  
  // Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  final TextEditingController _motherMaidenNameController = TextEditingController();
  final TextEditingController _emergencyperonnameController =TextEditingController();
    final TextEditingController _emergencyperonContactNumberController =TextEditingController();
      final TextEditingController __emergencyPersoncnicController = TextEditingController();


  final TextEditingController _noDependentsController = TextEditingController();
  final TextEditingController _landlineController = TextEditingController();
  final TextEditingController _mailingAddressController = TextEditingController();
  
  // Selected values
  String? _selectedTitle;
  DateTime? _cnicIssueDate;
  String? _selectedOccupation;
  String? _selectedEducation;
  String? _selectedMaritalStatus;
  
  int _currentPage = 0;

  @override
  void dispose() {
    _fullNameController.dispose();
    _cnicController.dispose();
    _motherMaidenNameController.dispose();
    _noDependentsController.dispose();
    _landlineController.dispose();
    _mailingAddressController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _submitForm();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(' Sarmayakri Account created successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Progress Indicator
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Create Your Sarmayakari Account',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: List.generate(3, (index) {
                        return Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              right: index < 2 ? 8 : 0,
                            ),
                            height: 4,
                            decoration: BoxDecoration(
                              color: index <= _currentPage 
                                  ? AppColors.primaryColor 
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Step ${_currentPage + 1} of 3',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Form Pages
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _buildPersonalInfoPage(),
                    _buildContactInfoPage(),
                    _buildAdditionalInfoPage(),
                  ],
                ),
              ),
              
              // Navigation Buttons
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _previousPage,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const CustomText("Previous")
                        ),
                      ),
                    if (_currentPage > 0) const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(_currentPage < 2 ? 'Next' : 'Submit'),
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

  Widget _buildPersonalInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionCard(
            title: 'Personal Information',
            icon: Icons.person,
            children: [
              CustomDropdownFormField<String>(
                labelText: 'Title',
                hintText: 'Select title',
                isRequired: true,
                value: _selectedTitle,
                items: const [
                  DropdownMenuItem(value: 'Mr', child: Text('Mr')),
                  DropdownMenuItem(value: 'Ms', child: Text('Ms')),
                  DropdownMenuItem(value: 'Mrs', child: Text('Mrs')),
                  DropdownMenuItem(value: 'Dr', child: Text('Dr')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedTitle = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a title';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                controller: _fullNameController,
                isRequired: true,
                textCapitalization: TextCapitalization.words,
                prefixIcon: const Icon(Icons.person_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'CNIC',
                hintText: '12345-1234567-1',
                controller: _cnicController,
                isRequired: true,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.credit_card),
                inputFormatters: [CNICFormatter()],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your CNIC';
                  }
                  if (value.replaceAll('-', '').length != 13) {
                    return 'CNIC must be 13 digits';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomDatePickerField(
                labelText: 'CNIC Issue Date',
                hintText: 'Select CNIC issue date',
                selectedDate: _cnicIssueDate,
                isRequired: true,
                onDateSelected: (date) {
                  setState(() {
                    _cnicIssueDate = date;
                  });
                },
                validator: (date) {
                  if (date == null) {
                    return 'Please select CNIC issue date';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'Mother\'s Maiden Name',
                hintText: 'Enter mother\'s maiden name',
                controller: _motherMaidenNameController,
                isRequired: true,
                textCapitalization: TextCapitalization.words,
                prefixIcon: const Icon(Icons.woman),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mother\'s maiden name';
                  }
                  return null;
                },
              ),
                const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'Emergency Person Name',
                hintText: 'Emergency Person Name',
                controller: _emergencyperonnameController,
                isRequired: true,
                textCapitalization: TextCapitalization.words,
                prefixIcon: const Icon(Icons.woman),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter mother\'s maiden name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
               CustomTextFormField(
                labelText: 'Emergenvy Peron Cotact Number',
                hintText: 'Enter Emergenvy Peron Cotact Number',
                controller: _emergencyperonContactNumberController,
                isRequired: true,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.family_restroom),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of dependents';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'Emergency Person CNIC',
                hintText: '12345-1234567-1',
                controller: __emergencyPersoncnicController,
                isRequired: true,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.credit_card),
                inputFormatters: [CNICFormatter()],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Emerrgency  CNIC';
                  }
                  if (value.replaceAll('-', '').length != 13) {
                    return 'CNIC must be 13 digits';
                  }
                  return null;
                },
              ),
              
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildSectionCard(
            title: 'Contact & Family Information',
            icon: Icons.contact_phone,
            children: [
              CustomTextFormField(
                labelText: 'Number of Dependents',
                hintText: 'Enter number of dependents',
                controller: _noDependentsController,
                isRequired: true,
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.family_restroom),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of dependents';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'Landline Number',
                hintText: '0321-1234567',
                controller: _landlineController,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                inputFormatters: [PhoneFormatter()],
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (value.replaceAll('-', '').length < 10) {
                      return 'Please enter a valid phone number';
                    }
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomDropdownFormField<String>(
                labelText: 'Marital Status',
                hintText: 'Select marital status',
                isRequired: true,
                value: _selectedMaritalStatus,
                items: const [
                  DropdownMenuItem(value: 'Single', child: CustomText('Single')),
                  DropdownMenuItem(value: 'Married', child: CustomText('Married')),
                  DropdownMenuItem(value: 'Divorced', child: CustomText('Divorced')),
                  DropdownMenuItem(value: 'Widowed', child: CustomText('Widowed')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedMaritalStatus = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select marital status';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomTextFormField(
                labelText: 'Mailing Address',
                hintText: 'Enter your complete mailing address',
                controller: _mailingAddressController,
                isRequired: true,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                prefixIcon: const Icon(Icons.location_on_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mailing address';
                  }
                  if (value.length < 10) {
                    return 'Please enter a complete address';
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildSectionCard(
            title: 'Professional Information',
            icon: Icons.work,
            children: [
              CustomDropdownFormField<String>(
                labelText: 'Occupation',
                hintText: 'Select your occupation',
                isRequired: true,
                value: _selectedOccupation,
                items: const [
                  DropdownMenuItem(value: 'Employee', child: CustomText('Employee')),
                  DropdownMenuItem(value: 'Business Owner', child: CustomText('Business Owner')),
                  DropdownMenuItem(value: 'Self Employed', child: CustomText('Self Employed')),
                  DropdownMenuItem(value: 'Student', child: CustomText('Student')),
                  DropdownMenuItem(value: 'Retired', child: CustomText('Retired')),
                  DropdownMenuItem(value: 'Housewife', child: CustomText('Housewife')),
                  DropdownMenuItem(value: 'Other', child: CustomText('Other')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedOccupation = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your occupation';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              
              CustomDropdownFormField<String>(
                labelText: 'Education Level',
                hintText: 'Select your education level',
                isRequired: true,
                value: _selectedEducation,
                items: const [
                  DropdownMenuItem(value: 'Matriculation', child: CustomText('Matriculation')),
                  DropdownMenuItem(value: 'Intermediate', child: CustomText('Intermediate')),
                  DropdownMenuItem(value: 'Bachelor\'s Degree', child: CustomText('Bachelor\'s Degree')),
                  DropdownMenuItem(value: 'Master\'s Degree', child: CustomText('Master\'s Degree')),
                  DropdownMenuItem(value: 'PhD', child: CustomText('PhD')),
                  DropdownMenuItem(value: 'Other', child: CustomText('Other')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedEducation = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your education level';
                  }
                  return null;
                },
              ),
            ],
          ),
          
          const SizedBox(height: 30),
          
          // Summary Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade600),
                    const SizedBox(width: 8),
                    CustomText(
                      'Review Your Information',
                      
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade800,
                      ),
                    
                  ],
                ),
                const SizedBox(height: 12),
                CustomText(
                  'Please review all the information you\'ve entered before submitting. Make sure all details are correct as this will be used for your profile verification.',
                  
                    color: Colors.blue.shade700,
                    fontSize: 14,
                    height: 1.4,
                  ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: Colors.blue.shade600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }
}





