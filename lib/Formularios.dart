// ignore: file_names
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validadores/validadores.dart';

class Formularios extends StatefulWidget {
  const Formularios({Key? key}) : super(key: key);

  @override
  _FormulariosState createState() => _FormulariosState();
}

class _FormulariosState extends State<Formularios> {
  final _formKey = GlobalKey<FormState>();
  String _mensagem = "";
  String _nome = "";
  String _idade = "";
  String _cpf = "";
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    hintText: "Digite seu nome",
                  ),
                  onSaved: (valor) {
                    _nome = valor!;
                  },
                  validator: (valor) {
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                        .minLength(5, msg: "minimo 5 caracteres")
                        .maxLength(50)
                        .valido(valor);
                  },
                ),
                TextFormField(
                  controller: _idadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Digite sua idade",
                  ),
                  onSaved: (valor) {
                    _idade = valor!;
                  },
                  validator: (valor) {
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                        .valido(valor);
                  },
                ),
                TextFormField(
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    hintText: "Digite seu CPF",
                  ),
                  onSaved: (valor) {
                    _cpf = valor!;
                  },
                  validator: (valor) {
                    return Validador()
                        .add(Validar.OBRIGATORIO, msg: "Campo Obrigatório")
                        .add(Validar.CPF, msg: "CPF inválido!")
                        .valido(valor);
                  },
                ),
                ElevatedButton(
                  child: const Text("Salvar"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        _mensagem = "Nome: $_nome idade: $_idade CPF: $_cpf";
                      });
                    }
                  },
                ),
                Text(
                  _mensagem,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
