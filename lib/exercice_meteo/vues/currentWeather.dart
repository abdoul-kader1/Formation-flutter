import 'package:flutter/material.dart';
import '../modele/api_reponse.dart';
import '../services/data_converter.dart';

class CurrentWeather extends StatelessWidget{

  Forcast forcast;

  CurrentWeather({required this.forcast});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height/3,
      padding: EdgeInsets.all(8),
      child: Card(
        elevation: 7,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(DataConverter().fromIcon(forcast.weather.first.icon)),
                  Text("${forcast.main.temp?.toInt()}°C ",style: Theme.of(context).textTheme.headlineLarge,)
                ],
              ),
              const Spacer(),
              Text(forcast.weather.first.description,style: Theme.of(context).textTheme.headlineMedium),
              Text("Min ${forcast.main.temp_min?.toInt()} ° C - Max ${forcast.main.temp_max?.toInt()} ° C",style: Theme.of(context).textTheme.headlineSmall,)
            ],
          ),
        ),
      ),
    );
  }

}