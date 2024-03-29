import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:gtk_flutter/src/ad_helper.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        //alignment: Alignment.centerLeft,
        child: SignInScreen(
      desktopLayoutDirection: TextDirection.ltr,
      resizeToAvoidBottomInset: false,

      oauthButtonVariant: OAuthButtonVariant.icon,
      providerConfigs: [
        EmailProviderConfiguration(),
        FacebookProviderConfiguration(
            clientId: "1dae917812269b6ffe95a586db98aca8"),
        GoogleProviderConfiguration(
            clientId:
                "90817750920-9307of40hl4eg62dabtvcd403s6pg5a8.apps.googleusercontent.com"),
        //     "90817750920-qeda6kshcc4msuc0tbgnvd0lu9mh1enb.apps.googleusercontent.com"),
        // "90817750920-2bmot5is9ic9m61t8a7875v4ekhnj1m4.apps.googleusercontent.com"),
      ],
      actions: [
        ForgotPasswordAction(((context, email) {
          final uri = Uri(
            path: '/sign-in/forgot-password',
            queryParameters: <String, String?>{
              'email': email,
            },
          );
          context.push(uri.toString());
        })),
        AuthStateChangeAction(((context, state) {
          if (state is SignedIn || state is UserCreated) {
            var user = (state is SignedIn)
                ? state.user
                : (state as UserCreated).credential.user;
            if (user == null) {
              return;
            }
            if (state is UserCreated) {
              user.updateDisplayName(user.email!.split('@')[0]);
            }
            if (!user.emailVerified) {
              user.sendEmailVerification();
              const snackBar = SnackBar(
                  content: Text(
                      'Please check your email to verify your email address'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            context.pushReplacement('/');
          }
        })),
      ],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(1),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/quokka1.png'),
          ),
          //AspectRatio(aspectRatio: 1, child: Text("Hello")),
          // Image.asset('assets/Quokka-PNG-Pic.png')
          //  Image.asset('assets/travel.png')
          //  Image.asset('assets/quokka1.png')
          //),
        );
      },
      // subtitleBuilder: (context, action) {
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 4.0),
      //     child: action == AuthAction.signIn
      //         ? const Text(
      //             style: TextStyle(fontSize: 5),
      //             'Welcome to Tripify, please sign in!')
      //         : const Text(
      //             style: TextStyle(fontSize: 5),
      //             'Welcome to Tripify, please sign up!'),
      //   );
      // },
      footerBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(top: 4),
          child: Text(
            'By signing in, you agree to our terms and conditions.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
      // sideBuilder: (context, shrinkOffset) {
      //   return Padding(
      //     padding: const EdgeInsets.all(20),
      //     child: AspectRatio(aspectRatio: 1, child: Text("Bye")
      //         //Image.asset('flutterfire_300x.png'),
      //         ),
      //   );
      // },
    ));
  }
}
