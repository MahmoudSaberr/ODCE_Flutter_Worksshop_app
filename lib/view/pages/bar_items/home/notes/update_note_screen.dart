import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/model/home/notes/note_details_model.dart';

import '../../../../../view_model/bloc/note_cubit/note_cubit.dart';
import '../../../../components/core/widgets/components.dart';
import 'note_Screen.dart';

class UpdateNoteScreen extends StatelessWidget {
   UpdateNoteScreen({Key? key}) : super(key: key);
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descController = TextEditingController();
    var dateController = TextEditingController();
    NoteDetails? details = ModalRoute.of(context)?.settings.arguments as NoteDetails?;

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
              'Update Note',
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
                  date: details!.title
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
                    date: details.date
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
                    date: details.subtitle

                ),
                const SizedBox(height: 30,),
                defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        NoteCubit.get(context).updateNote(
                            details.id,
                            titleController.text,
                            descController.text,
                            date.toString()
                        );
                        navigateTo(context, NoteScreen());
                      }},
                    text: 'Update')
              ],
            ),
          ),
        );
      },
    );
  }
}
