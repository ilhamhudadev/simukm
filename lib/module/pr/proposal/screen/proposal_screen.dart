
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/pr/proposal/controller/proposal_controller.dart';
  
  class ProposalScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<ProposalController>(
        init: ProposalController(),
        builder: (ProposalController controller) {
          return Scaffold();
        },
      );
    }
  }