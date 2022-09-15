import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/pages/bar_items/settings/settings_screen.dart';
import 'package:login/view_model/bloc/term_cubit/term_cubit.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../../components/core/widgets/components.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TermCubit()..getTerms(),
      child: BlocConsumer<TermCubit, TermState>(
        listener: (context, state) {},
        builder: (context, state) {


          TermCubit cubit = TermCubit.get(context);

          if(cubit.isLoading != true) {
            final TextSpan textSpan = HTML.toTextSpan(
              context,
              cubit.termModel!.data!.terms.toString(),
              linksCallback: (dynamic link) {
                debugPrint('You clicked on ${link.toString()}');
              },
              // as name suggests, optionally set the default text style
              defaultTextStyle: TextStyle(color: Colors.grey[700]),
              overrideStyle: <String, TextStyle>{
                'p': const TextStyle(fontSize: 17.3),
                'li': const TextStyle(fontSize: 17.3),
                'a': const TextStyle(wordSpacing: 2),
                // specify any tag not just the supported ones,
                // and apply TextStyles to them and/override them
              },
            );

            return Scaffold(
              appBar: AppBar(
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
                  'Term & Conditions',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(text: textSpan),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
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
                  'Term & Conditions',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
              ),
              body: Center(child: CircularProgressIndicator(color: Colors.orange,),),
            );
          }
        },
      ),
    );
  }
}
