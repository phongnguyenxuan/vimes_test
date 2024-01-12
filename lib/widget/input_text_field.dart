// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vimes_test/utils/constant.dart';

class InputTextWidget extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final GlobalKey<FormState>? formKey;
  final void Function(String)? onChanged;
  const InputTextWidget({
    Key? key,
    required this.title,
    required this.controller,
    this.width,
    this.height,
    this.keyboardType, this.formKey, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleTextStyle,
            ),
            const SizedBox(height: 5,),
            SizedBox(
              width: width,
              child: TextFormField(
                controller: controller,
                style: bodyTextStyle,
                keyboardType: keyboardType ?? TextInputType.text,
                inputFormatters: keyboardType != null
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) => newValue.copyWith(
                            text: newValue.text.replaceAll('.', ','),
                          ),
                        ),
                      ]
                    : null,
                onChanged: onChanged,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Trường dữ liệu đang trống !!";
                  }
                  return null;
                },
              //  autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
