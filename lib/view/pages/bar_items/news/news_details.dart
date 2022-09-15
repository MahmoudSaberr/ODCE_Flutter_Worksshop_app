import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/model/bar_options/news/news_details_model.dart';
import 'package:login/view/components/core/widgets/components.dart';
import 'package:login/view/pages/bar_items/news/news_screen.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsDetails? details = ModalRoute.of(context)?.settings.arguments as NewsDetails?;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.orange,),
          onPressed: () {
            navigateTo(context, NewsScreen());
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       Image(image: NetworkImage(
                "${details?.imageUrl}"
            )),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "${details?.title}",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "${details?.date}",
                style: GoogleFonts.poppins(
                    color: Colors.orange,)
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(child: Text(
                "${details?.body}",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)
            ),),
          )
        ],
      ),
    );
  }
}
