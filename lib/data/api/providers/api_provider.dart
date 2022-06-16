import 'package:api_project/data/api/models/error_model.dart';
import 'package:api_project/data/api/models/login_model.dart';
import 'package:api_project/data/api/services/api_service.dart';
import 'package:flutter/widgets.dart';

import '../models/user_model.dart';

class ApiProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<UserModel> userList = <UserModel>[];
  List<LoginModel> loginList = <LoginModel>[];
  List<ApiErrorModel> errorList = <ApiErrorModel>[];
  bool isLoadingLogin = true;
  bool isLoadingUser = true;
  bool obsecure = true;

  void setErrorMessage(ApiErrorModel model) {
    errorList.clear();
    errorList.add(model);
    notifyListeners();
  }

  void setObsecure() {
    obsecure = !obsecure;
    notifyListeners();
  }

  //loginpage
  Future<void> login(BuildContext context) async {
    loginList.clear();
    errorList.clear();
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setErrorMessage(ApiErrorModel(message: "Boş Alan Bırakmayınız..."));
    } else {
      try {
        isLoadingLogin = true;
        loginList.add(await ApiService.login(emailController.text.trim(),
            passwordController.text.trim(), context));
      } finally {
        isLoadingLogin = false;
        if (loginList.first.token != null) {
          getDetails(loginList.first.token.toString(), context);
        }
      }
    }
    notifyListeners();
  }

  //loginpage
  Future<void> getDetails(String token, BuildContext context) async {
    userList.clear();
    try {
      isLoadingUser = true;
      userList.add(await ApiService.userDetails(token, context));
    } finally {
      isLoadingUser = false;
    }
    notifyListeners();
  }
}
