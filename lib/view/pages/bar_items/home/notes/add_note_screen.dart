import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:login/view/components/core/widgets/components.dart';
import 'package:login/view_model/bloc/note_cubit/note_cubit.dart';

import 'note_Screen.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descController = TextEditingController();
    var dateController = TextEditingController();

    DateTime date = DateTime.now();

    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.orange
              ),
              onPressed: () {
                navigateTo(context, NoteScreen());
              },
            ),
            title: Text(
              'Add Note',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.black
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                defaultFormFieldForNote(
                  controller: titleController,
                  type: TextInputType.name,
                  validate: ( value) {
                    if (value.isEmpty) {
                      return 'title must not be empty';
                    }
                  },
                  label: 'Title',
                ),
                const SizedBox(height: 30,),
                defaultFormFieldForNote(
                    controller: dateController,
                    type: TextInputType.text,
                    enabled: false,
                    onTap: () {

                      /*  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2030-12-31'),
                  ).then((value) {
                    dateController.text =
                        DateFormat.yMMMd().format(value!);
                  });*/
                    },
                    validate: ( value) {
                      if (value.isEmpty) {
                        return 'date must not be empty';
                      }
                      return null;
                    },
                    label: date.toString(),
                    readOnly: true,
                    date: date.toString()
                ),
                const SizedBox(height: 30,),
                defaultFormFieldForNote(
                  controller: descController,
                  type: TextInputType.multiline,
                  validate: ( value) {
                    if (value.isEmpty) {
                      return 'description must not be empty';
                    }
                  },
                  label: 'Description',
                ),
                const SizedBox(height: 30,),
                defaultButton(
                    function: () {
                        NoteCubit.get(context).insertNote(
                            titleController.text,
                            descController.text,
                            date.toString()
                        );

                    },
                    text: 'Add')
              ],
            ),
          ),
        );
      },
    );
  }
}
