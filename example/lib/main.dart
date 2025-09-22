import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islamic_prayer_times/islamic_prayer_times.dart' as ipt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<ipt.SalahTimes> prayerTimes;
  late ipt.SunTimeTable sunTimeTable;
  final formatter = DateFormat('HH:mm');

  void initState() {
    super.initState();
    prayerTimes = calc();
    sunTimeTable = ipt.SunTimeTable.calculate(
      dateTime: DateTime.now().toUtc(),
      latitude: 23.777176,
      longitude: 90.399452,
    );
  }

  Future<ipt.SalahTimes> calc() async {
    final countryConfig = (await ipt.CountryConfig.getByCountryCode('bd'));
    var method = await ipt.SalahCalculationMethod.getCalculationMethod(
        countryConfig.method.defaultValue);
    method = method.copyWith(
      madhab: countryConfig.asrMethod.defaultValue,
    );
    final config = await ipt.SalahTimes.calculate(
      date: DateTime.now().toUtc(),
      latitude: 23.777176,
      longitude: 90.399452,
      method: method,
    );
    return config;
  }

  Widget buildRange(String title, DateTimeRange range) {
    return Text(
        '\n$title\n${formatter.format(range.start.toLocal())}\n${formatter.format(range.end.toLocal())}\n');
  }

  Widget get gap => const SizedBox(width: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Prayer Times'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
              future: prayerTimes,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done)
                  return const SizedBox.shrink();
                if (!snapshot.hasData) return const SizedBox.shrink();

                final data = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('\n\nPrayer Times'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildRange('Fajr', data.fajr),
                          gap,
                          buildRange('Dhuhr', data.dhuhr),
                          gap,
                          buildRange('Asr', data.asr),
                          gap,
                          buildRange('Maghrib', data.maghrib),
                          gap,
                          buildRange('Isha', data.isha),
                        ],
                      ),
                      const Text('\n\nSunnah Times'),
                      buildRange('Tahajjud', data.tahajjud),
                      buildRange('awwabin', data.awwabin),
                      buildRange('witr', data.witr),
                      const Text('\n\nRestricted Times'),
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildRange('Sunrise', data.restricted.sunrise),
                          gap,
                          buildRange('Noon', data.restricted.noon),
                          gap,
                          buildRange('Sunset', data.restricted.sunset),
                        ],
                      ),*/
                    ],
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            prayerTimes = calc();
          });
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
