import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/pages/bar_items/settings/settings_screen.dart';

import '../../../../components/core/widgets/components.dart';

class SupportScreen extends StatelessWidget {
   SupportScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 3,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.orange
          ),
          onPressed: () {
            navigateTo(context, SettingsScreen());
          },
        ),
        title: Text(
          'Support',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: Colors.black
          ),
        ),
      ) ,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            defaultFormFieldForSupport(
              controller: nameController,
              type: TextInputType.name,
              validate: ( value) {
                if (value.isEmpty) {
                  return 'title must not be empty';
                }
              },
                date: 'Name',
                prefix: Icons.person
            ),
            const SizedBox(height: 30,),
            defaultFormFieldForSupport(
                controller: emailController,
                type: TextInputType.text,
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
                date: 'email',
                prefix: Icons.email
            ),
            const SizedBox(height: 30,),
            defaultFormFieldForSupport(
              controller: subtitleController,
              type: TextInputType.multiline,
              validate: ( value) {
                if (value.isEmpty) {
                  return 'description must not be empty';
                }
              },
              date: 'Description',
            ),
            const SizedBox(height: 30,),
            defaultButton(
                function: () {
                },
                text: 'Submit')
          ],
        ),
      )
    );
  }
}
