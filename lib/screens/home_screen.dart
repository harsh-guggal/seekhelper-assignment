import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_asignment/provider/connectivity_provider.dart';
import 'package:flutter_asignment/provider/data_provider.dart';
import 'package:flutter_asignment/screens/add_user_screen.dart';
import 'package:flutter_asignment/screens/user_details_screen.dart';
import 'package:flutter_asignment/services/user_services.dart';
import 'package:flutter_asignment/utils/app_colors.dart';
import 'package:flutter_asignment/widgets/custom_textfield.dart';
import 'package:flutter_asignment/widgets/user_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });

    await UserServices.fetchAllUsers(context);

    setState(() {
      isLoading = false;
    });
  }

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
          leading: Icon(Icons.menu, color: Colors.white),
          title: Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.darkPrimaryColor, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.primaryColor))
          : Consumer<ConnectivityProvider>(
              builder: (context, connectivity, child) {
                if (!connectivity.isOnline) {
                  return const Center(
                    child: Text('No internet connection', style: TextStyle(color: Colors.red)),
                  );
                }
                return SafeArea(
                  child: Consumer<DataProvider>(
                    builder: (context, provider, child) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            CustomTextfield(
                              hintText: 'Search here',
                              onChanged: (value) {
                                provider.searchUser(value);
                              },
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: provider.allUsers.isEmpty
                                  ? const Center(child: Text('No users found'))
                                  : ListView.builder(
                                      itemCount: provider.allUsers.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                transitionDuration: const Duration(milliseconds: 500),
                                                pageBuilder: (context, animation, secondaryAnimation) => UserDetailsScreen(user: provider.allUsers[index]),
                                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                  return SlideTransition(
                                                    position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
                                                    child: child,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: UserCard(user: provider.allUsers[index]),
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusManager.instance.primaryFocus!.unfocus();
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) => AddUserScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
