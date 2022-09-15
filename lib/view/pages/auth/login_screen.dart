import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/view/pages/auth/register_screen.dart';

import '../../../view_model/bloc/login_cubit/login_cubit.dart';
import '../../components/core/widgets/components.dart';
import '../bar_items/bottom_bar_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  Future getFuture() {
    return Future(() async {
      await Future.delayed(Duration(seconds: 3));
      return 'Hello, Future Progress Dialog!';
    });
  }
  Future<void> showProgressWithoutMsg(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => FutureProgressDialog(getFuture(),));
  }

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          navigateAndFinish(
            context,
            BottomBarScreen(),
          );
        }

        if (state is LoginLoadingState) {
          showProgressWithoutMsg(context);
        }

        if (state is LoginErrorState) {
          showToast(
            text: state.error,
            state: ToastStates.ERROR,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
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
                      'Login',
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
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: ( value) {
                        if (value.isEmpty) {
                          showToast(text: 'Email Empty', state: ToastStates.ERROR);
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
                      suffix: LoginCubit.get(context).suffix,
                      onSubmit: (value) {
                        if (formKey.currentState!.validate()) {
                          LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      isPassword: LoginCubit.get(context).isPassword,
                      suffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      validate: ( value) {
                        if (value.isEmpty) {
                          showToast(text: 'Password Empty', state: ToastStates.ERROR);
                          return 'password is too short';
                        }
                      },
                      label: 'Password',
                    ),
                    defaultTextButton(
                      function: () {},
                      text: 'Forgot Password?',
                    ),
                    const SizedBox(height: 40,),
                    // const Center(child: CircularProgressIndicator(color: Colors.orange,))
                    defaultButton(
                        function: () {
                          LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          showToast(text: 'Welcome Back', state: ToastStates.SUCCESS);
                        },
                        text: "Login"),

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
                          " OR ",
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
                          navigateTo(context, RegisterScreen());
                        },
                        text: "Sign Up",
                        background: Colors.white,
                        textColor: Colors.orange
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
