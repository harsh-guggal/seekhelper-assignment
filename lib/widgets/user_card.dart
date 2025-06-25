import 'package:flutter/material.dart';
import 'package:flutter_asignment/models/user_model.dart';
import 'package:flutter_asignment/widgets/details_row.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          DetailRow(title: 'Name:', value: '${user.name}'),
          DetailRow(title: 'Email:', value: '${user.email}'),
          DetailRow(title: 'Phone Number:', value: '${user.phone}'),
        ],
      ),
    );
  }
}
