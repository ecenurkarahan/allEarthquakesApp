import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'earthquake_component.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, HomeController homeController, child) {
        if(homeController.earthquakesModel==null){
          return CircularProgressIndicator();
        }
        else{
        return Scaffold(
          appBar: AppBar(
            title: Text('All Earthquakes'),
          ),
          body: homeController.earthquakesModel == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: homeController.earthquakesModel!.data!.length,
                  itemBuilder: (context, index) {
                    return EarthquakeComponent(
                      earthquake: homeController.earthquakesModel!.data![index],
                    );
                  },
                ),
        );
      }
        },
    );
  }
}
