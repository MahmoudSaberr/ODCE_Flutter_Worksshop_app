
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/model/home/sections/section_model.dart';
import 'package:login/view_model/bloc/section_cubit/sections_cubit.dart';
import 'package:login/view_model/bloc/section_cubit/sections_state.dart';
import '../../bottom_bar_screen.dart';
import '../../../../components/core/widgets/components.dart';

class SectionsScreen extends StatelessWidget {
  const SectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => SectionsCubit()..getSections(),
  child: BlocConsumer<SectionsCubit,SectionsState>(
        listener: (context,state){},
        builder: (context,state){
          SectionsCubit cubit = SectionsCubit.get(context);
          return (state is GetSectionsLoadingState)?
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.orange
                ),
                onPressed: () {
                  navigateTo(context, BottomBarScreen());
                },
              ),
              title: Text(
                'Sections',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black
                ),
              ),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.filter_list_alt,
                    color: Colors.orange,
                    size: 30,
                  ),
                )
              ],
            ),
            body: Center(
              child: CircularProgressIndicator(color: Colors.orange,),
            ),
          )
              :builderWidget(cubit.sectionModel, context);
        }),
);
  }
//builderWidget(cubit.lectureModel,cubit.data, context)
  /*
  *  ConditionalBuilder(
              condition: cubit.lectureModel != null,
              builder: (context) => builderWidget(cubit.lectureModel,cubit.data, context),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
          );
          * */

  Widget builderWidget(SectionModel? model,context) =>
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.orange
            ),
            onPressed: () {
              navigateTo(context, BottomBarScreen());
            },
          ),
          title: Text(
            'Sections',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.filter_list_alt,
                color: Colors.orange,
                size: 30,
              ),
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          height:double.infinity,
          color: Colors.white,
          child:ListView.builder(
              itemCount: model?.data?.length,
              itemBuilder:(context,index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 18,
                      right: 18,
                      left: 18
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 4.0,
                                left:  4.0,
                                top: 4.0,
                                bottom: 12.0
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${model?.data![index].sectionSubject}',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timer_rounded,
                                      color: Color.fromARGB(255, 90, 90, 90),
                                    ),
                                    Text(
                                      "2hrs",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Lecture Day',
                                      style: GoogleFonts.poppins(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_month),
                                        Text(
                                          '${model?.data![index].sectionDate}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14
                                          ),
                                        ),
                                      ],
                                    )],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Start Time',
                                      style: GoogleFonts.poppins(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time_filled,
                                          color: Color.fromARGB(255, 154, 213, 134),
                                        ),
                                        Text(
                                          '${model?.data![index].sectionStartTime}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14
                                          ),
                                        ),
                                      ],
                                    )],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'End Time',
                                      style: GoogleFonts.poppins(
                                          color: Color.fromARGB(255, 169, 169, 169),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time_filled,
                                          color: Color.fromARGB(255, 230, 140, 140),
                                        ),
                                        Text(
                                          '${model?.data![index].sectionEndTime}',
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14
                                          ),
                                        ),
                                      ],
                                    )],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
}
