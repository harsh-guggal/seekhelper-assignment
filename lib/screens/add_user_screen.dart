import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_asignment/models/user_model.dart';
import 'package:flutter_asignment/provider/data_provider.dart';
import 'package:flutter_asignment/utils/app_colors.dart';
import 'package:flutter_asignment/utils/validations.dart';
import 'package:flutter_asignment/widgets/custom_button.dart';
import 'package:flutter_asignment/widgets/custom_textfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isValidationActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: AppColors.darkPrimaryColor,
          surfaceTintColor: AppColors.darkPrimaryColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: const Text(
            'Add User',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.darkPrimaryColor, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                  textController: nameController,
                  labelText: "Name",
                  keyboardType: TextInputType.name,
                  validation: CustomValidations.noSpecialCharacterValidator,
                  onChanged: (value) {
                    if (isValidationActivated) {
                      formKey.currentState!.validate();
                    }
                  },
                ),
                CustomTextfield(
                  textController: emailController,
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validation: CustomValidations.emailValidator,
                  onChanged: (value) {
                    if (isValidationActivated) {
                      formKey.currentState!.validate();
                    }
                  },
                ),
                CustomTextfield(
                  textController: phoneController,
                  labelText: "Phone",
                  keyboardType: TextInputType.phone,
                  validation: CustomValidations.phoneValidator,
                  onChanged: (value) {
                    if (isValidationActivated) {
                      formKey.currentState!.validate();
                    }
                  },
                ),
                CustomButton(
                  text: 'Submit',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      print('done======>');
                      var data = {"name": nameController.text, "email": emailController.text, "phone": phoneController.text};

                      Provider.of<DataProvider>(context, listen: false).addUserAtTop(UserModel.fromJson(data));
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: 'User Added');
                    } else {
                      setState(() {
                        isValidationActivated = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
