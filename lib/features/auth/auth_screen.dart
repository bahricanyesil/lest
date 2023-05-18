import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';
import 'package:lest/core/helpers/color_helpers.dart';
import 'package:lest/product/constants/icon_paths.dart';
import 'package:lest/product/theme/custom_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          primarySwatch:
              ColorHelpers.getMaterialColor(CustomColors.primaryColor),
        ),
        child: AnimatedLogin(
          logo: Image.asset(IconPaths.logoWithoutBg),
          loginDesktopTheme: _desktopTheme,
          loginMobileTheme: _mobileTheme,
          loginTexts: LoginTexts(
            privacyPolicyLink: 'https://github.com/bahricanyesil/lest',
            termsConditionsLink: 'https://github.com/bahricanyesil/lest',
          ),
          // TODO: Fix
          // languageOptions: const <LanguageOption>[
          //   LanguageOption(value: 'English', code: 'EN', iconPath: IconPaths.en)
          // ],
        ),
      );

  LoginViewTheme get _desktopTheme => _mobileTheme.copyWith(
        actionButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        dialogTheme: const AnimatedDialogTheme(
          languageDialogTheme: LanguageDialogTheme(
            optionMargin: EdgeInsets.symmetric(horizontal: 80),
          ),
        ),
        loadingButtonColor: Colors.white,
        privacyPolicyLinkStyle: TextStyle(
          color: CustomColors.primaryColor,
          decoration: TextDecoration.underline,
        ),
      );

  LoginViewTheme get _mobileTheme => LoginViewTheme(
        formFieldBackgroundColor: Colors.white,
        logoSize: const Size(200, 200),
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
          AnimatedComponent(component: LoginComponents.forgotPassword),
          AnimatedComponent(component: LoginComponents.policyCheckbox),
          AnimatedComponent(component: LoginComponents.changeActionButton),
          AnimatedComponent(component: LoginComponents.actionButton),
        ],
        privacyPolicyLinkStyle: const TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
        ),
      );
}
