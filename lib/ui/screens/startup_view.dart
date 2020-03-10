
import 'package:classapp/core/viewmodels/startup_viewmodel.dart';
import 'package:classapp/ui/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartupView extends StatelessWidget {
  
  final startUpViewmodel = locator<StartUpViewmodel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewmodel>.withConsumer(
      viewModel: startUpViewmodel,
      onModelReady: (model)=> model.handleStartUplogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height:100,
              width:300,
              
            ), CircularProgressIndicator(
              strokeWidth:3
              // valueColor:AlwaysStoppedAnimation(Color(0xff19c7c1)),
            )
          ],
        )),
      ),
    );
  }
}
