import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_asignment/models/user_model.dart';
import 'package:flutter_asignment/utils/app_colors.dart';
import 'package:flutter_asignment/widgets/details_row.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key, required this.user});
  final UserModel user;

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
            'User Details',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.darkPrimaryColor, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailRow(title: 'Name:', value: '${user.name}'),
              DetailRow(title: 'Username:', value: '${user.username}'),
              DetailRow(title: 'Email:', value: '${user.email}'),
              DetailRow(title: 'Phone Number:', value: '${user.phone}'),
              DetailRow(title: 'Website:', value: '${user.website}'),
              user.address != null
                  ? Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        const Text('Address Details:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                        DetailRow(title: 'Street:', value: '${user.address!.street}'),
                        DetailRow(title: 'Suite:', value: '${user.address!.suite}'),
                        DetailRow(title: 'City:', value: '${user.address!.city}'),
                        DetailRow(title: 'Zipcode:', value: '${user.address!.zipcode}'),
                      ],
                    )
                  : SizedBox(),
              user.company != null
                  ? Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        const Text('Company Details:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                        DetailRow(title: 'Name:', value: '${user.company!.name}'),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
