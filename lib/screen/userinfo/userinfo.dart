import 'package:appening/screen/userinfo/mixin.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget with UserInfoScreenMixin {
  UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(hintText: "Name"),
                    validator: (value) => emptyValidator("Name", value),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: jobController,
                    decoration: const InputDecoration(hintText: "Job"),
                    validator: (value) => emptyValidator("Job", value),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
