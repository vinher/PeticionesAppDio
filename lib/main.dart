import 'package:flutter/material.dart';
import 'package:peticiones_dio_app/peticiones/answer_data.dart';
import 'package:peticiones_dio_app/peticiones/answer_model.dart';

void main() => runApp(const MyApp());
final dataUser = GetDataUsers();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child:Text('Dio APP')),
          ),
          body: FutureBuilder<dynamic>(
            future: dataUser.getAnsWerData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error al cargar los datos'));
              } else {
                List<Datum> users = snapshot.data!;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    Datum user = users[index];
                    return ListTile(
                      title: Text(user.email),
                      subtitle: Text(user.firstName),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    );
                  },
                );
              }
            },
          )),
    );
  
  }
}
