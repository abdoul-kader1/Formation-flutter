class GroupedWeather{

  int min;
  int max;
  String description;
  String icon;
  String day;

  GroupedWeather({required this.min,required this.max,required this.description,required this.icon,required this.day});

  String minAndMax(){
    return "min $min°C - Maw $max°C";
  }

}