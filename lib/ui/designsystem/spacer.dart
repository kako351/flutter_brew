import 'package:flutter/cupertino.dart';

class SpacerDefinition {
  const SpacerDefinition();

  static const double sizeS = 8.0;
  static const double sizeM = 16.0;
  static const double sizeL = 24.0;
  static const double sizeXL = 32.0;
}

class SpacerS extends StatelessWidget {
  const SpacerS({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SpacerDefinition.sizeS,
      width: SpacerDefinition.sizeS,
    );
  }
}

class SpacerM extends StatelessWidget {
  const SpacerM({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SpacerDefinition.sizeM,
      width: SpacerDefinition.sizeM,
    );
  }
}

class SpacerL extends StatelessWidget {
  const SpacerL({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SpacerDefinition.sizeL,
      width: SpacerDefinition.sizeL,
    );
  }
}

class SpacerXL extends StatelessWidget {
  const SpacerXL({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SpacerDefinition.sizeXL,
      width: SpacerDefinition.sizeXL,
    );
  }
}
