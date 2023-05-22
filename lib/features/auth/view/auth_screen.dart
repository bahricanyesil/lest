import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:lest/features/auth/view-model/auth_view_model.dart';
import 'package:lest/product/constants/image_paths.dart';
import 'package:lest/product/constants/product_links.dart';
import 'package:lest/product/theme/custom_colors.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<AuthViewModel>(
        create: (_) => AuthViewModel(),
        builder: (BuildContext context, _) {
          final auth = context.read<AuthViewModel>();
          return AnimatedLogin(
            logo: Image.asset(ImagePaths.logoWithoutBg),
            loginDesktopTheme: _desktopTheme,
            loginMobileTheme: _mobileTheme,
            loginTexts: LoginTexts(
              privacyPolicyLink: ProductLinks.privacyTermsLink,
              termsConditionsLink: ProductLinks.privacyTermsLink,
            ),
            onSignup: (_) =>
                auth.operationWrapper(context, () async => auth.signUp(_)),
            onLogin: (_) =>
                auth.operationWrapper(context, () async => auth.login(_)),
          );
        },
      );

  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
        logoSize: const Size(210, 210),
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        dialogTheme: const AnimatedDialogTheme(
          languageDialogTheme: LanguageDialogTheme(
            optionMargin: EdgeInsets.symmetric(horizontal: 80),
          ),
        ),
        loadingButtonColor: Colors.white,
        privacyPolicyStyle: const TextStyle(color: Colors.black),
        privacyPolicyLinkStyle: TextStyle(
          color: CustomColors.primaryColor,
          decoration: TextDecoration.underline,
        ),
        formTitlePadding: const EdgeInsets.symmetric(vertical: 15),
        formPadding: const EdgeInsets.symmetric(vertical: 15),
        changeActionPadding: const EdgeInsets.symmetric(vertical: 20),
      );

  LoginViewTheme get _mobileTheme => LoginViewTheme(
        formFieldBackgroundColor: Colors.white,
        logoSize: const Size(140, 140),
        animatedComponentOrder: const <AnimatedComponent>[
          AnimatedComponent(
            component: LoginComponents.logo,
          ),
          AnimatedComponent(component: LoginComponents.title),
          AnimatedComponent(component: LoginComponents.description),
          AnimatedComponent(component: LoginComponents.formTitle),
          AnimatedComponent(component: LoginComponents.socialLogins),
          AnimatedComponent(component: LoginComponents.useEmail),
          AnimatedComponent(component: LoginComponents.form),
          AnimatedComponent(component: LoginComponents.notHaveAnAccount),
          AnimatedComponent(component: LoginComponents.policyCheckbox),
          AnimatedComponent(component: LoginComponents.changeActionButton),
          AnimatedComponent(component: LoginComponents.actionButton),
        ],
        formPadding: const EdgeInsets.only(top: 6, bottom: 15),
        changeActionPadding: const EdgeInsets.only(top: 10, bottom: 2),
        privacyPolicyStyle: const TextStyle(color: Colors.white),
        privacyPolicyLinkStyle: TextStyle(
          color: CustomColors.secondaryColor,
          decoration: TextDecoration.underline,
        ),
      );
}
