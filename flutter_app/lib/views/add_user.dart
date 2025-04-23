import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/user_model.dart';
import 'package:flutter_app/services/user_provider.dart';
import 'package:flutter_app/widgets/minimal_text_input.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController positionController = TextEditingController();

  bool isSaving = false;

  void _saveUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isSaving = true);

    final user = UserModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );

    try {
      await Provider.of<UserProvider>(context, listen: false).createUser(user);
      Navigator.pop(context, true); // Retorna true para indicar sucesso
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao salvar usuário')),
      );
    } finally {
      setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar usuário'),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  MinimalTextInput(
                    label: "Nome",
                    controller: nameController,
                    // validator: (value) =>
                    //     value == null || value.isEmpty ? 'Informe o nome' : null,
                  ),
                  MinimalTextInput(
                    label: "E-mail",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) =>
                    //     value == null || !value.contains('@') ? 'E-mail inválido' : null,
                  ),
                  MinimalTextInput(
                    label: "Telefone",
                    controller: phoneController,
                    keyboardType: TextInputType.phone
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isSaving ? null : _saveUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // fundo preto
                    foregroundColor: Colors.white, // texto branco
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // opcional, borda arredondada
                    ),
                  ),
                  child: isSaving
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text("Salvar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
