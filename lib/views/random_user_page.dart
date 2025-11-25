import 'package:flutter/material.dart';
import '../services/ random_user_api_service.dart';
import '../models/random_user.dart';
import 'widgets/random_user_card.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({super.key});

  @override
  State<RandomUserPage> createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {

  late final RandomUserApiService _service;

  late Future<FernaFlooCarajo> _futureUser;

  @override
  void initState() {
    super.initState();
    _service = RandomUserApiService();

    _futureUser = _service.fetchRandomUser(
      nationality: 'in',
      gender: 'male',
    );
  }

  void _loadNewUser() {
    setState(() {
      _futureUser = _service.fetchRandomUser(
          nationality: 'in',
          gender: 'male',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbuelitasUwu.com'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<FernaFlooCarajo>(
          future: _futureUser,
          builder: (BuildContext context, AsyncSnapshot<FernaFlooCarajo> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 40,
                  ),
                  const SizedBox(height: 8),
                  const Text('Ocurrió un error al cargar el usuario.'),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.error.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadNewUser,
                    child: const Text('Reintentar'),
                  ),
                ],
              );
            }

            if (snapshot.hasData) {
              final FernaFlooCarajo user = snapshot.data!;

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RandomUserCard(user: user),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _loadNewUser,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Nuevo usuario'),
                  ),
                ],
              );
            }

            return const Text('No hay datos para mostrar.');
          },
        ),
      ),
    );
  }
}
