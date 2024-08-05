import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constaints.dart';
import 'package:weather_app/provider/homepage_provider.dart';
import 'package:weather_app/screens/help_screen.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  static String id = 'homePageScreen';

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Weather'), actions: [Padding(padding: EdgeInsets.only(right: 20), child: InkWell(child: Icon(Icons.question_mark_rounded), onTap: (){Navigator.pushNamed(context, HelpScreen.id);},),)],),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<HomepageProvider>(builder: (context, value, child) => TextField(
                    controller: _textFieldController,
                    decoration: InputDecoration(
                        filled: true,
                        hintText: value.labelText,
                        prefixIcon: Icon(Icons.location_city),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 4, color: Colors.yellow),
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),),),
                  const SizedBox(height: 20,),
                  Consumer<HomepageProvider>(builder: (context, value, child) => ElevatedButton(
                    onPressed: (){
                      if(_textFieldController.text.isNotEmpty){
                        value.setLabelText(_textFieldController.text);
                        value.getWeather();
                      } else {
                        value.setLabelText(_textFieldController.text);
                        value.getWeather();
                      }
                    }, child: Text('Save'), style: kDefaultButtonStyle,),),
                  const SizedBox(height: 100,),
                  Consumer<HomepageProvider>(builder: (context, value, child) => Text('${value.temprature.toInt()}\u00B0C', style: kTempratureStyle,),),
                  const SizedBox(height: 40,),
                  Consumer<HomepageProvider>(builder: (context, value, child) => value.weatherIcon.isEmpty ? Text('❓', style: kTempratureStyle,) : Image.network('https://openweathermap.org/img/wn/${value.weatherIcon}@2x.png'),),
                  const SizedBox(height: 80,),
                  Consumer<HomepageProvider>(builder: (context, value, child) => Text('Climet is ${value.climet} Today', style: kTempratureStyle,),)
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
