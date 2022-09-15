import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/components/core/widgets/components.dart';
import 'package:login/view/pages/auth/login_screen.dart';
import 'package:login/view/pages/bar_items/settings/our_parents/our_parents_screen.dart';
import 'package:login/view/pages/bar_items/settings/support/support_screen.dart';
import 'package:login/view/pages/bar_items/settings/terms/terms_screen.dart';
import 'package:login/view_model/bloc/faqs_cubit/faqs_cubit.dart';
import 'package:login/view_model/bloc/setting_cubit/setting_cubit.dart';
import 'package:login/view_model/bloc/term_cubit/term_cubit.dart';

import '../../../../utils/network/local/cache_helper.dart';
import 'faqs/faqs_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
              'Settings',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.black
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  navigateTo(context, FaqScreen());
                },
                child: Row(
                  children: [
                     Text(
                        "FAQ",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){
                          navigateTo(context, FaqScreen());
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey)
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1.3,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, TermsScreen());
                },
                child: Row(
                  children: [
                     Text(
                      "Term & Conditions",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){
                          navigateTo(context, TermsScreen());
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey)
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1.3,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, OurParentsScreen());
                },
                child: Row(
                  children: [
                     Text(
                        "Our Parents",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){
                          navigateTo(context, OurParentsScreen());
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey)
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1.3,
              ),
              InkWell(
                onTap: (){
                  navigateTo(context, SupportScreen());
                },
                child: Row(
                  children: [
                     Text(
                        "Support",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: (){
                          navigateTo(context, SupportScreen());
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey)
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1.3,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("Are you sure ?"),
                          backgroundColor: Colors.white,
                          elevation: 24.0,
                          actionsAlignment: MainAxisAlignment.spaceEvenly,
                          actions: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.orange)
                                ),
                                padding: EdgeInsets.all(10.0),
                                width: 100,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
                                LoginScreen()), (route) => false);
                                CacheHelper.saveString(key: 'token', value: '');

                              },
                              child: Container(
                                child: Text(
                                  '   Sure',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.orange
                                ),
                                padding: EdgeInsets.all(10.0),
                                width: 100,
                              ),
                            ),

                          ],

                        );
                      },
                    barrierDismissible: true
                  );
                },
                child: Row(
                  children: [
                     Text(
                        "Log out",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
