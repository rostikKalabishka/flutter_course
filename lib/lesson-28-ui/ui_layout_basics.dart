import 'package:flutter/material.dart';

class WeatherForeCast extends StatelessWidget {
  const WeatherForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather forecast',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[400],
      ),
      body: const SafeArea(child: WeatherForeAllInfo()),
    );
  }
}

class WeatherForeAllInfo extends StatelessWidget {
  const WeatherForeAllInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchWidget(),
        SizedBox(
          height: 20,
        ),
        InfoForeCast(),
        SizedBox(
          height: 40,
        ),
        Info(),
        SizedBox(
          height: 40,
        ),
        Text(
          '7-DAY WEATHER FORECAST',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 20,
        ),
        DayWeatherForecast()
      ],
    );
  }
}

class InfoForeCast extends StatelessWidget {
  const InfoForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Zakarpatska Oblast, UA',
          style: TextStyle(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.w300),
        ),
        Text(
          'Friday, Mar 20, 2020',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.sunny,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  '14 °F',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  'LIGHT SNOW',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Enter City Name',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              Icons.cloudy_snowing,
              color: Colors.white,
              size: 40,
            ),
            Text(
              '5',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text('km/hr', style: TextStyle(color: Colors.white, fontSize: 17))
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.cloudy_snowing,
              color: Colors.white,
              size: 40,
            ),
            Text(
              '3',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text('%', style: TextStyle(color: Colors.white, fontSize: 17))
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.cloudy_snowing,
              color: Colors.white,
              size: 40,
            ),
            Text(
              '20',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Text('%', style: TextStyle(color: Colors.white, fontSize: 17))
          ],
        )
      ],
    );
  }
}

class DayWeatherForecast extends StatelessWidget {
  DayWeatherForecast({super.key});

  List<DayForecast> listForecast = [
    DayForecast(day: 'Friday', temp: 6),
    DayForecast(day: 'Saturday', temp: 5),
    DayForecast(day: 'Sunday', temp: 22),
    DayForecast(day: 'Monday ', temp: 13),
    DayForecast(day: 'Tuesday ', temp: 17),
    DayForecast(day: 'Wednesday ', temp: 2),
    DayForecast(day: 'Thursday ', temp: 4)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          itemExtent: 200,
          scrollDirection: Axis.horizontal,
          itemCount: listForecast.length,
          itemBuilder: (context, index) {
            final forecast = listForecast[index];
            return Card(
              color: Colors.red[200],
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      forecast.day,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${forecast.temp} °F',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                        const Icon(
                          Icons.sunny,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    )
                  ]),
            );
          }),
    );
  }
}

class DayForecast {
  final String day;
  final int temp;

  DayForecast({required this.day, required this.temp});
}
