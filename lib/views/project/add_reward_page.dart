import 'package:flutter/material.dart';

class AddRewardPage extends StatefulWidget {
  final String projectId;

  const AddRewardPage({
    super.key,
    required this.projectId,
  });

  @override
  State<AddRewardPage> createState() => _AddRewardPageState();
}

class _AddRewardPageState extends State<AddRewardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '리워드',
        ),
      ),
    );
  }
}
