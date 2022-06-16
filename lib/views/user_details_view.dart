import 'package:api_project/data/api/providers/api_provider.dart';
import 'package:flutter/material.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({Key? key, required this.apiProvider})
      : super(key: key);
  final ApiProvider apiProvider;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("User Details"), centerTitle: true),
      body: Center(
        child: SizedBox(
          height: size.height * .3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(
                  text: apiProvider.userList.first.user.message.toString(),
                  fontSize: 30),
              _buildText(
                  text:
                      "Company:  ${apiProvider.userList.first.user.company.toString()}"),
              _buildText(
                  text:
                      "Name:  ${apiProvider.userList.first.user.name.toString()}"),
              _buildText(
                  text:
                      "Title:  ${apiProvider.userList.first.user.title.toString()}"),
              _buildText(
                  text:
                      "E-Mail:  ${apiProvider.userList.first.user.mail.toString()}"),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildText({required String text, double? fontSize}) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize ?? 16),
    );
  }
}
