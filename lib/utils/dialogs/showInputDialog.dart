import 'package:bloc_flutter_ejercicio/data/models/user_model.dart';
import 'package:flutter/material.dart';

Future<UserModel?> showInputDialog(BuildContext context) async {
  // Crear controladores de texto para los dos campos
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();

  // Usar una clave global para el formulario y validarlo
  final _formKey = GlobalKey<FormState>();

  return showDialog<UserModel?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Ingresa tu información"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Campo de texto para el nombre con validación
              TextFormField(
                autofocus: true,
                controller: _nameController,
                focusNode: _nameFocusNode,
                decoration: const InputDecoration(
                  hintText: "Escribe tu nombre",
                  labelText: "Nombre",
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(fontSize: 12, color: Colors.red),
                ),
                // Validación del campo vacío para el nombre
                validator: (value) {
                  value = value?.trim() ?? "";
                  if (value.isEmpty) {
                    return 'El nombre no puede estar vacío';
                  }
                  if (value.length < 3) {
                    return "El nombre no puede ser tan corto";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
              ),

              const SizedBox(height: 16), // Espacio entre los campos

              // Campo de texto para el email con validación
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: const InputDecoration(
                  hintText: "Escribe tu correo electrónico",
                  labelText: "Correo electrónico",
                  border: OutlineInputBorder(),
                  errorStyle: TextStyle(fontSize: 12, color: Colors.red),
                ),
                // Validación del campo vacío y formato del email
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo electrónico no puede estar vacío';
                  }
                  // Validación simple de formato de email
                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Por favor, ingresa un correo válido';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // Botón de Cancelar
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Cerrar el diálogo sin retornar valor
            },
            child: const Text("Cancelar"),
          ),

          // Botón de Aceptar
          FilledButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                String name = _nameController.text;
                String email = _emailController.text;

                UserModel newUser = UserModel(name: name, email: email);

                Navigator.of(context)
                    .pop(newUser); // Retorna el objeto UserModel
              }
            },
            child: const Text("Aceptar"),
          ),
        ],
      );
    },
  );
}
