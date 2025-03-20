import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario en Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FormularioScreen(),
    );
  }
}

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario Flutter')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su correo';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Ingrese un correo válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(), 
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(
                  labelText: 'Telefono',
                  border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su número de teléfono';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              
              TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(
                  labelText: 'Direccion',
                  border: OutlineInputBorder(), 
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su dirección';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulario válido')),
                    );
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
