import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/model/bar_options/news/news_details_model.dart';
import 'package:login/view/components/core/widgets/components.dart';
import 'package:login/view_model/bloc/news_cubit/news_cubit.dart';
import 'package:login/view_model/bloc/news_cubit/news_state.dart';
import 'package:share/share.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => NewsCubit()..getNewsData(),
  child: BlocConsumer<NewsCubit,NewsState>(
      builder: (context, state) => ConditionalBuilder(
        condition: NewsCubit.get(context).newsModel != null,
        builder: (context) {

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'News',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    NewsCubit.get(context).newsModel!.data!.length,
                    itemBuilder: (BuildContext context, int index) => Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context,
                              'news_details',
                              arguments: NewsDetails(
                                body: "${NewsCubit.get(context).newsModel!.data![index].body}",
                                title: "${NewsCubit.get(context).newsModel!.data![index].title}",
                                imageUrl: "${NewsCubit.get(context).newsModel!.data![index].imageUrl}",
                                date: "${NewsCubit.get(context).newsModel!.data![index].date}",
                              )
                          );
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Stack(
                            children: [
                              Container(
                                height: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(NewsCubit.get(context)
                                      .newsModel!
                                      .data![index]
                                      .imageUrl.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          " ${NewsCubit.get(context).newsModel!.data![index].title}",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600)),
                                      Container(
                                        margin:
                                        EdgeInsets.only(top: 10, right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                            BorderRadius.circular(11)),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: IconButton(
                                                    onPressed: () {
                                                      Share.share(
                                                        "${NewsCubit.get(context).newsModel!.data![index].linkUrl}"
                                                      );
                                                    },
                                                    icon: Icon(
                                                      Icons.share_outlined,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                              VerticalDivider(
                                                indent: 7,
                                                endIndent: 7,
                                                color: Colors.white,
                                                thickness: 1,
                                              ),
                                              Container(
                                                child: IconButton(
                                                  onPressed: () {
                                                    final value = ClipboardData( text: "${NewsCubit.get(context).newsModel!.data![index].linkUrl}");
                                                    Clipboard.setData(value);
                                                    showToast(
                                                        text: 'Copied Successfully',
                                                        state: ToastStates.SUCCESS
                                                    );
                                                    },
                                                  icon: Icon(
                                                    Icons.copy_rounded,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 180),
                                    padding: EdgeInsets.only(left: 5,right: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            // padding: new EdgeInsets.only(right: 2.0),
                                            child: Text(
                                              "${NewsCubit.get(context).newsModel!.data![index].body}",
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(

                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 25,right: 5),
                                          child: Text(
                                            "${NewsCubit.get(context).newsModel!.data![index].date}",
                                            style: GoogleFonts.poppins(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } ,
        fallback: (context) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              'News',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.black
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: CircularProgressIndicator(),
        ),
        ),
      ),
      listener: (context,state) {},
    ),
);
  }
}
