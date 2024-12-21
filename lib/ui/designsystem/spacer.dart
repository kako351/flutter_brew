import 'package:flutter/cupertino.dart';

class SpacerDefinition {
  const SpacerDefinition();

  static const double sizeS = 8.0;
  static const double sizeM = 16.0;
  static const double sizeL = 24.0;
  static const double sizeXL = 32.0;
}

abstract class _BaseSpacerWidget extends StatelessWidget {
  final double size;
  const _BaseSpacerWidget(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size);
  }
}

class SpacerS extends _BaseSpacerWidget {
  const SpacerS({super.key}): super(SpacerDefinition.sizeS);
}

class SpacerM extends _BaseSpacerWidget {
  const SpacerM({super.key}): super(SpacerDefinition.sizeM);
}

class SpacerL extends _BaseSpacerWidget {
  const SpacerL({super.key}): super(SpacerDefinition.sizeL);
}

class SpacerXL extends _BaseSpacerWidget {
  const SpacerXL({super.key}): super(SpacerDefinition.sizeXL);
}
