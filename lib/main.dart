import 'package:flutter/material.dart';
import 'package:flutter_course/state_lessons/home_work_proverd/homework_provider.dart';
import 'package:flutter_course/state_lessons/home_work_proverd/model/model.dart';
import 'package:provider/provider.dart';

import 'entity/offices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        child: const HomeWorkProvider(),
        create: (_) => HomeWorkProviderModel(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Networking',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: FutureBuilder<OfficesList>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final image = snapshot.data!.officesList[index].image;
                final name = snapshot.data!.officesList[index].name;
                final address = snapshot.data!.officesList[index].address;
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text(name),
                        leading: Image.network(image),
                        subtitle: Text(address),
                      ),
                    )
                    //Image.network(image), Text(name), Text(address)
                  ],
                );
              },
              itemCount: snapshot.data?.officesList.length ?? 0,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.green,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}
