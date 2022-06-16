import 'package:flutter/material.dart';

import '../../data/api/providers/api_provider.dart';
import '../user_details_view.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget(
      {Key? key,
      required this.message,
      required this.icon,
      required this.color,
      required this.apiProvider})
      : super(key: key);
  final ApiProvider apiProvider;
  final String message;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Icon(
        icon,
        size: 60,
        color: color,
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(message, textAlign: TextAlign.center),
      ),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            apiProvider.errorList.isNotEmpty
                ? Navigator.pop(context)
                : {
                    Navigator.of(context).popUntil((route) => route.isFirst),
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                UserDetailsView(apiProvider: apiProvider))))
                  };
          },
        ),
      ],
    );
  }
}
