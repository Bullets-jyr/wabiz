import 'package:flutter/material.dart';

class ProjectDetailPage extends StatefulWidget {
  final String project;

  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.project);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
