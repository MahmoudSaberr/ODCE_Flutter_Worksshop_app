import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/components/core/widgets/components.dart';
import 'package:login/view/pages/bar_items/home/events/events_screen.dart';
import 'package:login/view/pages/bar_items/home/finals/exams_screen.dart';
import 'package:login/view/pages/bar_items/home/midterms/midterm_screen.dart';
import 'package:login/view/pages/bar_items/home/sections/section_screen.dart';

import 'lectures/lectures_screen.dart';
import 'notes/note_Screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
              text: 'Orange',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 26,
                  fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(
                    text: " Digital Center",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
              ]
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
        ),children: [
          InkWell(
            onTap: (){
              navigateTo(context, LecturesScreen());
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child:Icon(
                        Icons.menu_book,
                        color: Colors.orange,
                        size: 60,
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                      "Lectures",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.orange
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              navigateTo(context, SectionsScreen());
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                        Icons.book,
                        color: Colors.orange,
                        size: 60,
                      ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Sections",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              navigateTo(context, MidtermScreen());
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                        Icons.my_library_books_rounded,
                        color: Colors.orange,
                        size: 60,
                      ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Midterms",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              navigateTo(context, ExamsScreen());
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                        Icons.my_library_books_sharp,
                        color: Colors.orange,
                        size: 60,
                      ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Finals",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              navigateTo(context, EventsScreen());
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                        Icons.calendar_month,
                        color: Colors.orange,
                        size: 60,
                      ),
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Events",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              navigateTo(context, NoteScreen());
            },
            child: Card(
              elevation: 5.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(120, 232, 231, 231),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                        Icons.note_add,
                        color: Colors.orange,
                        size: 60,
                      ),

                    ),
                  SizedBox(height: 5.0,),
                  Text(
                    "Notes",
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}
