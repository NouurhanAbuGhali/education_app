import 'package:complete_quiz/firebase/references.dart';
import 'package:complete_quiz/screens/home/home_screen.dart';
import 'package:complete_quiz/screens/introduction/introduction.dart';
import 'package:complete_quiz/screens/login/login_screen.dart';
import 'package:complete_quiz/widgets/dialogs/dialogs_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    print(
      "step number one *****************************************************************",
    );
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  Future<void> signInWithGoogle() async {
    navigateToHomePage();
    // final GoogleSignIn googleSignIn = GoogleSignIn();
    // print("///////////////////////step number one");
    // try {
    //   GoogleSignInAccount? account = await googleSignIn.signIn();
    //   print("///////////////////////step number two");
    //
    //   if (account != null) {
    //     final authAccount = await account.authentication;
    //     final credential = GoogleAuthProvider.credential(
    //       idToken: authAccount.idToken,
    //       accessToken: authAccount.accessToken,
    //     );
    //     print("///////////////////////step number three");
    //
    //     await _auth.signInWithCredential(credential);
    //     await saveUser(account);
    //     print("///////////////////////step number four");
    //]
    //     navigateToHomePage();
    //   } else {
    //     print("nullll///////////////////////////////");
    //     return null;
    //   }
    // } on Exception catch (error) {
    //   //AppLogger.e(error);
    // }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      'email': account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  Future<void> SignOut() async {
    //AppLogger.d('Sign out');
    try {
      await _auth.signOut();
      Future.delayed(Duration(seconds: 2));
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      // AppLogger.e(e);
    }
  }

  navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void navigateToIntroduction() {
    Get.offAllNamed(AppIntroductionScreen.routeName);
  }

  void showLoginAlertDialogue() {
    Get.dialog(
      Dialogs.questionStartDialogs(
        onTap: () {
          Get.back();
          navigateToLoginPage();
        },
      ),
      barrierDismissible: false,
    );
  }

  navigateToLoginPage() {
    Get.toNamed(LoginScreen.routeName);
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }
}
