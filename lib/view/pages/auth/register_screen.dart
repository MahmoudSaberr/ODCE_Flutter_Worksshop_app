import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/pages/auth/login_screen.dart';
import 'package:login/view_model/bloc/register_cubit/register_cubit.dart';

import '../../components/core/widgets/components.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var genderController = TextEditingController();
    var universityController = TextEditingController();
    var gradeController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body:   BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
              navigateAndFinish(
                context,
                LoginScreen(),
              );
            }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    Center(
                      child: RichText(
                        text: const TextSpan(
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
                    ),
                    const SizedBox(height: 120,),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: ( value) {
                        if (value.isEmpty) {
                          showToast(text: 'enter your name', state: ToastStates.ERROR);
                          return 'please enter your name ';
                        }
                      },
                      label: 'Name',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          showToast(text: 'enter your email correctly', state: ToastStates.ERROR);
                          return 'please enter your email address';
                        }
                      },
                      label: 'E-mail',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix: RegisterCubit.get(context).suffix,
                      onSubmit: (value) {},
                      isPassword: RegisterCubit.get(context).isPassword,
                      suffixPressed: () {
                        RegisterCubit.get(context).changePasswordVisibility();
                      },
                      validate: ( value) {
                        if (value.isEmpty) {
                          showToast(text: 'enter your password', state: ToastStates.ERROR);
                          return 'password is too short';
                        }
                      },
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: confirmPasswordController,
                      type: TextInputType.visiblePassword,
                      suffix: RegisterCubit.get(context).suffixConfirm,
                      onSubmit: (value) {},
                      isPassword: RegisterCubit.get(context).isPasswordConfirm,
                      suffixPressed: () {
                        RegisterCubit.get(context).changePasswordConfirmVisibility();
                      },
                      validate: ( value) {
                        if (value.isEmpty && value.toString() != passwordController.text) {
                          showToast(text: 'not correct password', state: ToastStates.ERROR);
                          return 'password is too short';
                        }
                      },
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.emailAddress,
                      validate: ( value) {
                        if (value.isEmpty) {
                          showToast(text: 'enter your phone number', state: ToastStates.ERROR);
                          return 'please enter your phone number';
                        }
                      },
                      label: 'Phone Number',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "   Gender",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "   University",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.orange,
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          child: DropdownButton(
                            elevation: 3,
                            isDense: true,
                            value: RegisterCubit.get(context).selectedItem,
                            hint: Text('select'),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: RegisterCubit.get(context).genderItems.map((items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).selectItem(newValue);
                              genderController.text = RegisterCubit.get(context).selectedItem.toString();
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                                color: Colors.orange,
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          child: DropdownButton(
                            elevation: 3,
                            isDense: true,
                            value: RegisterCubit.get(context).selectedUni,
                            hint: Text('select'),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: RegisterCubit.get(context).universityModel.listUniversityData.map((e) {
                              return DropdownMenuItem(
                                value: e.name,
                                child: Text((e.name??"")),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              RegisterCubit.get(context).selectUni(newValue);
                              universityController.text = RegisterCubit.get(context).selectedUni.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Grade",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Colors.orange,
                                  style: BorderStyle.solid,
                                  width: 0.80),
                            ),
                            child: DropdownButton(
                              elevation: 3,
                              isDense: true,
                              value: RegisterCubit.get(context).selectedGrade,
                              hint: Text('select'),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: RegisterCubit.get(context).gradeModel.data?.map((items) {
                                return DropdownMenuItem(
                                  value: items.grade,
                                  child: Text(items.grade??""),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                RegisterCubit.get(context).selectGrade(newValue);
                                gradeController.text = RegisterCubit.get(context).selectedGrade.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40,),
                    (state is RegisterLoadingState)?
                    const Center(child: CircularProgressIndicator(color: Colors.orange,)) :

                    defaultButton(
                        function: () {
                          if (formKey.currentState!.validate())
                          {
                            RegisterCubit.get(context).userRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              gender: genderController.text,
                              phoneNumber: phoneController.text,
                              universityId: universityController.text,
                              gradeId: gradeController.text,);
                            showToast(text: 'successfully registered', state: ToastStates.SUCCESS);
                          }
                        },
                        text: "Sign Up"),
                    const SizedBox(height: 25,),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(
                            thickness: 0.8,
                            endIndent: 10.0,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          " OR  ",
                          style: TextStyle(
                              fontSize: 24
                          ),
                        ),
                        Expanded(
                            child: Divider(
                              thickness: 0.8,
                              endIndent: 10.0,
                              color: Colors.black,
                            )
                        )
                      ],
                    ),
                    const SizedBox(height: 25,),
                    defaultButton(
                        function: () {
                          navigateTo(context, LoginScreen());
                        },
                        text: "Login",
                        background: Colors.white,
                        textColor: Colors.orange
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}
