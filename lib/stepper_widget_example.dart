import 'package:flutter/material.dart';

class StepperWidgetExample extends StatefulWidget {
  const StepperWidgetExample({super.key});

  @override
  State<StepperWidgetExample> createState() => _StepperWidgetExampleState();
}

int _bulundugumAdim = 0;

class _StepperWidgetExampleState extends State<StepperWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stepper(
      //! Stepper yatay mı olsun dikey mi
      physics: const ScrollPhysics(),
      currentStep: _bulundugumAdim,
      onStepTapped: (step) => yeniBulundugumAdim(step),
      controlsBuilder: (context, _) {
        return Row(
          children: [
            //! kullanıcı 2'nci indexte ise ileri butonunu gösterme
            _bulundugumAdim == 2
                ? const SizedBox()
                : TextButton(
                    onPressed: () {
                      _bulundugumAdim < 2
                          ? setState(() => _bulundugumAdim += 1)
                          : null;
                    },
                    child: const Text('İleri'),
                  ),

            //! kullanıcı ilk indexte ise geri butonunu gösterme
            _bulundugumAdim == 0
                ? const SizedBox()
                : TextButton(
                    onPressed: () {
                      _bulundugumAdim > 0
                          ? setState(() => _bulundugumAdim -= 1)
                          : null;
                    },
                    child: const Text('Geri'),
                  ),
          ],
        );
      },
      steps: [
        Step(
          title: const Text('Hoş Geldiniz'),
          content: const Column(
            children: [
              Text("Stepper Widget Öğreniyorum"),
              Text("Stepper Widget Örneği"),
            ],
          ),
          isActive: _bulundugumAdim >= 0,
          state: _bulundugumAdim >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('Giriş Yap'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Eposta giriniz'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Şifre giriniz'),
              ),
            ],
          ),
          isActive: _bulundugumAdim >= 1,
          state: _bulundugumAdim >= 0 ? StepState.complete : StepState.disabled,
        ),
        Step(
          title: const Text('İşlem Tamam'),
          content: const Column(
            children: [
              Text("Stepper Widget Kullanımını Öğrendim"),
            ],
          ),
          isActive: _bulundugumAdim >= 2,
          state: _bulundugumAdim >= 0 ? StepState.complete : StepState.disabled,
        ),
      ],
    ));
  }

  yeniBulundugumAdim(int step) {
    setState(() => _bulundugumAdim = step);
  }
}
