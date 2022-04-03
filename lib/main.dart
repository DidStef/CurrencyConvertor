import 'package:flutter/material.dart';

void main() {
  runApp(const CurrencyContainer());
}

class CurrencyContainer extends StatelessWidget {
  const CurrencyContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Currency Convertor"),
          centerTitle: true,
        ),
        body: Column(
          children:<Widget>[
            Image.network("https://cdn.romania-insider.com/cdn/ff/BSJCHwOpAfCIF2e_KqLl6JQcyTS4cc0-cHI4r8Sfqds/1627904263/public/styles/article_large_image/public/2020-09/currency_exchange_money_businness_ron_eur_by_henning_marquardt_dreamstime.com_.jpg"),
            Container(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Enter the amount in EUR",
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (String? value){
                  if (value == null || value.isEmpty) {
                    return "Please enter a number";
                  }
                  final double? res = double.parse(value);
                  if (res == null) {
                    return "Please enter a number";
                  }
                  return null;
                },
              ),
              padding: const EdgeInsets.all(16),
            ),
            Builder(
              builder: (context) {
                return ElevatedButton(
                    onPressed: (){
                      final bool? valid = Form.of(context)?.validate();
                      if (valid != null && valid) {
                        final double res = double.parse(_controller.text);
                        final double temp = res * 5;
                        setState(() {
                          _result = "${temp.toStringAsFixed(2)} RON";
                        });
                      }
                    },
                    child: const Text("Convert!")
                );
              },
            ),
            Text(_result)
          ],
        ),
      ),
    );
  }
}

