

import 'package:flutter/material.dart';

import '../../../core/size_config.dart';

class EarningTabPage extends StatefulWidget {
  const EarningTabPage({Key? key}) : super(key: key);

  @override
  State<EarningTabPage> createState() => _EarningTabPageState();
}

class _EarningTabPageState extends State<EarningTabPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold();
  }
}
