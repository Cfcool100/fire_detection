import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipPath(
              clipper: const CustomShape(),
              child: Container(
                width: double.maxFinite,
                height: 350,
                color: const Color(0xff1171D8),
                child: const Center(
                  child: Logo(),
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
                    'Se Connecter',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 35),
                  CustomFormField(
                    title: 'Numéro de téléphone',
                    hint: 'Entrer votre numéro de téléphone',
                    prefixIcon: const Icon(Icons.phone_outlined),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide.none,
                          shape: const RoundedRectangleBorder(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Mot de passe oublié',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  AutButton(
                    onRequest: () {
                      // Navigator.of(context).pushReplacementNamed('/dashboard');

                      Navigator.pushReplacementNamed(context, '/dashboard');
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

class AutButton extends StatelessWidget {
  const AutButton({
    super.key,
    this.isSignIn = true,
    required this.onRequest,
  });

  final bool isSignIn;
  final void Function()? onRequest;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          onPressed: onRequest,
          color: isSignIn ? const Color(0XFF3b82f6) : Colors.greenAccent[400],
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isSignIn ? 'Connexion' : "S'inscrire",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 5,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              isSignIn
                  ? 'Vous n\'avez pas de compte?'
                  : 'Vous avez déjà un compte?',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide.none,
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 10,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  isSignIn ? '/signUp' : '/signIn',
                );
              },
              child: Text(
                isSignIn ? 'Créez un compte' : 'Se connecter',
                style: TextStyle(
                  color: isSignIn ? Colors.green : const Color(0XFF3B82F6),
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: 150,
            child: Image.asset('images/logo-f_detect.png', fit: BoxFit.contain),
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
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.title,
    required this.hint,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscured = false,
    this.hasSuffix = false,
    this.onTap,
  });

  final String title;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscured;
  final bool hasSuffix;
  final void Function(String value)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              color: Color(0XFF3B82F6),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
        TextField(
          obscureText: isObscured,
          onChanged: onChanged,
          decoration: InputDecoration(
            constraints: const BoxConstraints(
              minHeight: 35,
              maxHeight: 40,
            ),
            prefixIconConstraints: const BoxConstraints(
              // maxWidth: 40,
              minWidth: 40,
            ),
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: prefixIcon,
            ),
            suffixIcon: hasSuffix
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: onTap,
                      child: suffixIcon,
                    ),
                  )
                : null,
            focusColor: Colors.grey,
            border: const UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  const CustomShape();

  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondFirstCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(secondFirstCurve.dx, secondFirstCurve.dy,
        secondLastCurve.dx, secondLastCurve.dy);

    final thirdFirstCurve = Offset(size.width, size.height - 20);
    final thirdLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstCurve.dx, thirdFirstCurve.dy,
        thirdLastCurve.dx, thirdLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
