import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/pages/bar_items/bottom_bar_screen.dart';
import 'package:login/view/components/core/widgets/components.dart';

import '../../../../../view_model/bloc/note_cubit/note_cubit.dart';
import 'add_note_screen.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..getNotes(),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {},
        builder: (context, state) {
          NoteCubit cubit = NoteCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: Colors.orange),
                onPressed: () {
                  navigateTo(context, BottomBarScreen());
                },
              ),
              title: Text(
                'Notes',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white,
                child: cubit.notes.isNotEmpty ? ListView.builder(
                    itemCount: cubit.notes.length,
                    itemBuilder: (context, index) {
                      print(cubit.notes[index].id);
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              border:
                                  Border.all(color: Colors.orange, width: 1),
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.sticky_note_2_rounded,
                                color: Colors.orange,
                              ),
                              title: Text(
                                cubit.notes[index].title.toString(),
                                style:
                                    GoogleFonts.poppins(color: Colors.black),
                              ),
                              subtitle: Text(
                                cubit.notes[index].description!,
                                style:
                                    GoogleFonts.poppins(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    }):
                Center(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 100.0,
                        color: Colors.grey,
                      ),
                      Text(
                        'No Tasks Yet, Please Add Some Tasks',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.orange,
              onPressed: () {
                navigateTo(context, AddNoteScreen());
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
