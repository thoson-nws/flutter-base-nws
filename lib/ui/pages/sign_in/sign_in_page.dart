import 'package:flutter/material.dart';
import 'package:flutter_base/blocs/app_cubit.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_images.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/enums/load_status.dart';
import 'package:flutter_base/ui/widgets/buttons/app_tint_button.dart';
import 'package:flutter_base/ui/widgets/input/app_email_input.dart';
import 'package:flutter_base/ui/widgets/input/app_password_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/auth_repository.dart';
import '../../../repositories/user_repository.dart';
import 'sign_in_cubit.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/signInPage';

  const SignInPage({Key? key}) : super(key: key);

  static push({required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (con) {
            final authRepo = RepositoryProvider.of<AuthRepository>(context);
            final userRepo = RepositoryProvider.of<UserRepository>(context);
            final appCubit = RepositoryProvider.of<AppCubit>(context);
            return SignInCubit(
              authRepo: authRepo,
              userRepo: userRepo,
              appCubit: appCubit,
            );
          },
          child: const SignInPage(),
        ),
      ),
    );
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController usernameTextController;
  late TextEditingController passwordTextController;

  late ObscureTextController obscurePasswordController;

  late SignInCubit _cubit;

  @override
  void initState() {
    super.initState();
    usernameTextController = TextEditingController(text: 'thoson.it@gmail.com');
    passwordTextController = TextEditingController(text: "Son@1234");
    obscurePasswordController = ObscureTextController(obscureText: true);
    _cubit = BlocProvider.of<SignInCubit>(context);
    _cubit.changeUsername(username: usernameTextController.text);
    _cubit.changePassword(password: passwordTextController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: buildBodyWidget(),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget buildBodyWidget() {
    final showingKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 100),
        SizedBox(
            height: showingKeyboard ? 0 : 200,
            width: 200,
            child: Image.asset(AppImages.icLogoTransparent)),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: AppEmailInput(
            textEditingController: usernameTextController,
            labelStyle: AppTextStyle.whiteS14Bold,
            textStyle: AppTextStyle.whiteS14,
            onChanged: (text) {
              _cubit.changeUsername(username: text);
            },
          ),
        ),
        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: AppPasswordInput(
            obscureTextController: obscurePasswordController,
            textEditingController: passwordTextController,
            labelStyle: AppTextStyle.whiteS14Bold,
            textStyle: AppTextStyle.whiteS14,
            onChanged: (text) {
              _cubit.changePassword(password: text);
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildSignButton(),
      ],
    );
  }

  Widget _buildSignButton() {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AppTintButton(
            title: 'Sign In',
            onPressed: _signIn,
            isLoading: state.signInStatus == LoadStatus.loading,
          ),
        );
      },
    );
  }

  void _signIn() {
    _cubit.signIn();
  }
}
