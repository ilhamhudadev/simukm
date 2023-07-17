
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:standard_project/module/ev/event/controller/event_controller.dart';
  
  class EventScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetBuilder<EventController>(
        init: EventController(),
        builder: (EventController controller) {
          return Scaffold();
        },
      );
    }
  }