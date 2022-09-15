import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view_model/bloc/app_cubit/app_cubit.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state) {} ,
      builder: (context,state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: cubit.currentIndex,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index){
                cubit.changeBottom(index);
              },
              items: [
                BottomNavyBarItem(
                  icon: Icon(
                    Icons.home_outlined  ,
                    size: 30,
                  ),
                  title: Text(
                      'Home',
                  style: GoogleFonts.poppins(
                    fontSize: 18
                  ),
                  ),
                  activeColor: Colors.orange,
                  inactiveColor: Colors.black
                ),
                BottomNavyBarItem(
                    icon: Icon(
                      Icons.newspaper_outlined,
                      size: 30,
                    ),
                    title: Text(
                      'News',
                      style: GoogleFonts.poppins(
                        fontSize: 18
                    ),),
                    activeColor: Colors.orange,
                    inactiveColor: Colors.black
                ),
                BottomNavyBarItem(
                    icon: Icon(
                        Icons.settings_outlined,
                      size: 30,
                    ),
                    title: Text(
                        'Settings',
                      style: GoogleFonts.poppins(
                          fontSize: 18
                      ),
                    ),
                    activeColor: Colors.orange,
                    inactiveColor: Colors.black
                ),
              ],
            )
        );
      },
    );
  }
}
