import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key, required this.title}) : super(key: key);
  final String title; //标题
}
