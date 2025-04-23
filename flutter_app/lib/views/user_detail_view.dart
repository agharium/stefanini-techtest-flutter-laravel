import 'package:flutter/material.dart';
import 'package:flutter_app/services/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/user_model.dart';

class UserDetailView extends StatefulWidget {
  final int userId;

  const UserDetailView({super.key, required this.userId});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  UserModel? user;
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<UserProvider>(context, listen: false);

    _loadUser(provider);
  }

  Future<void> _loadUser(UserProvider provider) async {
    try {
      final provider = Provider.of<UserProvider>(context, listen: false);
      final result = await provider.getUser(widget.userId);
      setState(() {
        user = result;
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Usuário'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : error != null
                ? Center(child: Text('Erro: $error'))
                : user == null
                    ? const Center(child: Text('Usuário não encontrado'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _DetailItem(label: 'Nome', value: user!.name!),
                          _DetailItem(label: 'E-mail', value: user!.email!),
                          _DetailItem(label: 'Telefone', value: user!.phone!),
                        ],
                      ),
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
