import 'package:api_project/data/api/providers/api_provider.dart';
import 'package:api_project/views/widgets/alert_dialog_widget.dart';
import 'package:api_project/views/widgets/custom_button.dart';
import 'package:api_project/views/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Login"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFieldWidget(
              controller: apiProvider.emailController,
              hintText: "Email",
            ),
            const SizedBox(height: 10),
            CustomTextFieldWidget(
              suffixIcon: apiProvider.obsecure
                  ? Icons.visibility
                  : Icons.visibility_off,
              obsecure: apiProvider.obsecure,
              changeObsecure: apiProvider.setObsecure,
              controller: apiProvider.passwordController,
              hintText: "Şifre",
            ),
            CustomButton(
              press: () {
                _loginAction(apiProvider, context);
              },
              text: "Giriş",
            )
          ],
        ),
      ),
    );
  }

  void _loginAction(ApiProvider apiProvider, BuildContext context) {
    apiProvider.login(context).whenComplete(() {
      if (apiProvider.errorList.isNotEmpty) {
        showDialog(
            context: context,
            builder: (ctxt) => AlertDialogWidget(
                    message: apiProvider.errorList.first.message,
                    icon: Icons.warning,
                    color: Colors.red,
                    apiProvider: apiProvider)
                .build(context));
      } else if (apiProvider.loginList.isNotEmpty) {
        showDialog(
            context: context,
            builder: (ctxt) => AlertDialogWidget(
                    message: apiProvider.loginList.first.status.toString(),
                    icon: Icons.check_circle,
                    color: Colors.green,
                    apiProvider: apiProvider)
                .build(context));
      }
    });
  }
}
