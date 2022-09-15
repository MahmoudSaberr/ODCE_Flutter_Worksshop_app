import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/pages/bar_items/settings/settings_screen.dart';
import 'package:simple_html_css/simple_html_css.dart';

import '../../../../../view_model/bloc/faqs_cubit/faqs_cubit.dart';
import '../../../../../view_model/bloc/faqs_cubit/faqs_state.dart';
import '../../../../components/core/widgets/components.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getData(),
      child: BlocConsumer<FaqCubit, FaqState>(
        listener: (context, state) {},
        builder: (context, state) {
          FaqCubit myCubit = FaqCubit.get(context);

          if (myCubit.isLoading != true) {
            final TextSpan textQuestionSpan = HTML.toTextSpan(
              context,
              myCubit.data!.data![0].question.toString(),
              linksCallback: (dynamic link) {
                debugPrint('You clicked on ${link.toString()}');
              },
              // as name suggests, optionally set the default text style
              defaultTextStyle: TextStyle(color: Colors.grey[700]),
              overrideStyle: <String, TextStyle>{
                'p': const TextStyle(fontSize: 17.3),
                'li': const TextStyle(fontSize: 17.3),
                'h4': const TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                // specify any tag not just the supported ones,
                // and apply TextStyles to them and/override them
              },
            );
            final TextSpan textAnswerSpan = HTML.toTextSpan(
              context,
              myCubit.data!.data![0].answer.toString(),
              linksCallback: (dynamic link) {
                debugPrint('You clicked on ${link.toString()}');
              },
              // as name suggests, optionally set the default text style
              defaultTextStyle: TextStyle(color: Colors.grey[700]),
              overrideStyle: <String, TextStyle>{
                'h4': const TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                'li': const TextStyle(fontSize: 17.3),
                'h4': const TextStyle(wordSpacing: 2,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
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
                  'FAQ',
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
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: ExpansionTile(
                        backgroundColor: Colors.grey,
                        title: RichText(text: textQuestionSpan),
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(146, 70, 70, 69),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: ListTile(
                              title: Center(
                                  child: RichText(text: textAnswerSpan)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                  'FAQ',
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