import 'package:flutter/material.dart';

import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: const CustomShape(),
              child: Container(
                width: double.maxFinite,
                height: 250,
                color: const Color(0xff1171D8),
                child: Center(
                  child: SizedBox(
                    height: 200,
                    // width: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 140,
                          child: Image.asset('images/logo-f_detect.png',
                              fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Une Référence Internationale',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Créer un compte',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomFormField(
                    title: 'Nom',
                    hint: 'Entrer votre nom',
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    title: 'Prénom',
                    hint: 'Entrer votre prénom',
                    prefixIcon: const Icon(Icons.person_outline_rounded),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    title: 'Adresse électronique',
                    hint: 'Entrer votre adresse électronique',
                    prefixIcon: const Icon(Icons.email_outlined),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    title: 'Profession',
                    hint: 'Entrer votre profession',
                    prefixIcon: const Icon(Icons.badge_outlined),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    title: 'Numéro de téléphone',
                    hint: 'Entrer votre numéro de téléphone',
                    prefixIcon: const Icon(Icons.phone_outlined),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 10),
                  CustomFormField(
                    title: 'Mot de passe',
                    hint: 'Entrer Mot de passe',
                    prefixIcon: const Icon(Icons.lock_outline),
                    hasSuffix: true,
                    suffixIcon: isObscured
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onChanged: (value) {},
                    isObscured: isObscured,
                    onTap: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  AutButton(
                    isSignIn: false,
                    onRequest: () {
                      Navigator.of(context).pushReplacementNamed('/dashboard');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
