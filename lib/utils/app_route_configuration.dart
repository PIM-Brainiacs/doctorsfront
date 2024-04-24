import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/components/add_doctor.dart';
import 'package:login_signup/components/admin_home.dart';
import 'package:login_signup/components/autiste_home.dart';
import 'package:login_signup/components/chat_page.dart';
import 'package:login_signup/components/forget_password_page.dart';
import 'package:login_signup/components/guest.dart';
import 'package:login_signup/components/doctor_home.dart';
import 'package:login_signup/components/login_page.dart';
import 'package:login_signup/components/rendez_vous_page.dart';
import 'package:login_signup/components/signup_page.dart';

class MyAppRouter {
  static GoRouter routing(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: 'login',
          path: "/",
          pageBuilder: (context, state) {
            return MaterialPage(child: LoginPage());
          },
        ),

        GoRoute(
          name: 'AdminHome',
          path: "/admin_home",
          pageBuilder: (context, state) {
            return MaterialPage(child: AdminPage());
          },
        ),
         GoRoute(
          name: 'docteur_home',
          path: "/docteur_home",
          pageBuilder: (context, state) {
            return MaterialPage(child: DoctorPage());
          },
        ),
         GoRoute(
          name: 'autiste_home',
          path: "/autiste_home",
          pageBuilder: (context, state) {
            return MaterialPage(child: AutistePage());
          },
        ),
         GoRoute(
          name: 'add_doctor',
          path: "/add_doctor",
          pageBuilder: (context, state) {
            return MaterialPage(child: AddDoctor());
          },
        ),
         GoRoute(
          name: 'chat_page',
          path: "/chat_page",
          pageBuilder: (context, state) {
            return MaterialPage(child: ChatPage());
          },
        ),
        GoRoute(
  name: 'chat',
  path: "/chat",
  pageBuilder: (context, state) {
    // Extraction des paramètres depuis l'état
    final receiverEmail = state.params['receiverEmail']!;
    final receiverID = state.params['receiverID']!;

    return MaterialPage(
      child: ChatPage(
       // receiverEmail: receiverEmail,
        //receiverID: receiverID,
      ),
    );
  },
),

       GoRoute(
          name: 'Rendez_vous',
          path: "/Rendez_vous",
          pageBuilder: (context, state) {
            return MaterialPage(child: RendezVousPage());
          },
        ),
        GoRoute(
          name: 'signUp',
          path: "/signup",
          pageBuilder: (context, state) {
            return MaterialPage(child: SignupPage());
          },
        ),
        GoRoute(
          name: 'forgetPwd',
          path: "/forgetpwd",
          pageBuilder: (context, state) {
            return MaterialPage(child: ForgetPasswordPage());
          },
        ),
        GoRoute(
          name: 'guest',
          path: "/guest",
          pageBuilder: (context, state) {
            return MaterialPage(child: GuestPage());
          },
        )
              
      ],
      redirect: (context, state) {
        print(isAuth);
        if (isAuth) {
          return "/homescreen";
        }
        return null;
      },
    );

    return router;
  }
}
