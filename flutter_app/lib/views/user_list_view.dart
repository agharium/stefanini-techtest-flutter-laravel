import 'package:flutter/material.dart';
import 'package:flutter_app/views/user_detail_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/widgets/list_cell_widget.dart';
import 'package:flutter_app/services/user_provider.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  void initState() {
    super.initState();
    
    Provider.of<UserProvider>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final users = userProvider.users;
    final loading = userProvider.loading;
    final error = userProvider.error;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Builder(
        builder: (context) {
          if (loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (error != null) {
            return Center(child: Text(error));
          } else if (users.isEmpty) {
            return const Center(
              child: Text(
                'Lista de usuários vazia.',
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) =>
                ListCellWidget(
                  item: users[index],
                  onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailView(
                          userId: users[index].id!
                        ),
                      ),
                    )
                ),
            );
          }
        },
      ),
    );
  }
}
