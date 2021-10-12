// ignore_for_file: file_names
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _moedaController = TextEditingController();

  String _valorRecuperado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Máscaras e validações"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // CPF
            TextField(
              controller: _cpfController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter(),
              ],
              decoration: const InputDecoration(
                hintText: "Digite o CPF",
              ),
            ),

            // CNPJ
            TextField(
              controller: _cnpjController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CnpjInputFormatter(),
              ],
              decoration: const InputDecoration(
                hintText: "Digite o CNPJ",
              ),
            ),

            // CEP
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              decoration: const InputDecoration(
                hintText: "Digite o CEP",
              ),
            ),

            // Telefone
            TextField(
              controller: _telefoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                TelefoneInputFormatter(),
              ],
              decoration: const InputDecoration(
                hintText: "Digite o telefone",
              ),
            ),

            // Data
            TextField(
              controller: _dataController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ],
              decoration: const InputDecoration(
                hintText: "Digite uma Data",
              ),
            ),

            // Moeda
            TextField(
              controller: _moedaController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                RealInputFormatter(centavos: true),
              ],
              decoration: const InputDecoration(
                hintText: "Digite um valor em Reais",
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  //_valorRecuperado = _cpfController.text.toString();
                  //_valorRecuperado = _cnpjController.text.toString();
                  //_valorRecuperado = _cepController.text.toString();
                  //_valorRecuperado = _telefoneController.text.toString();
                  //_valorRecuperado = _dataController.text.toString();
                  //_valorRecuperado = _moedaController.text.toString();

                  // caso queira salvar o valor de moeda em um banco
                  // caso queira fazer calculos com o valor, passar para double
                  String moedaBD = _moedaController.text.toString();
                  moedaBD = moedaBD.replaceAll(".", "");
                  moedaBD = moedaBD.replaceAll(",", ".");
                  double valorDouble = double.parse(moedaBD);
                  //_valorRecuperado = moedaBD;

                  // Para passar o valor para um formato de moeda novamente
                  var formatador = NumberFormat("#,##0.00", "pt-BR");
                  var resultado = formatador.format(valorDouble);
                  _valorRecuperado = resultado;
                });
              },
              child: const Text("Recuperar valor"),
            ),

            Text(
              "Valor: $_valorRecuperado",
              style: const TextStyle(
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
