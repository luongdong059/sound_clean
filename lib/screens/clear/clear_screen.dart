import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sound_clean/blocs/clear_bloc/clear_bloc.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../blocs/blocs_export.dart';
import '../../themes/theme.dart';

class ClearScreen extends StatelessWidget {
  const ClearScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(),
          BlocBuilder<ClearBloc, ClearState>(
            builder: (context, state) {
              return WidgetCircularAnimator(
                innerColor: AppColors.black03,
                outerColor: AppColors.black03,
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<ClearBloc>(context).add(
                      PressSoundEvent(
                        isPress:
                            state is SoundOffState ? state.isPlaying : false,
                      ),
                    );
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                      child: Neumorphic(
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.convex,
                          boxShape: NeumorphicBoxShape.circle(),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Image.asset(
                              AppAssets.press,
                              width: 50,
                            ),
                          ),
                        ),
                      )),
                ),
              );
            },
          ),
          const Spacer(),
        ],
      )

          // child: Center(
          //   child: WidgetCircularAnimator(
          //     child: Container(
          //       decoration: BoxDecoration(
          //           shape: BoxShape.circle, color: Colors.grey[200]),
          //       child: Icon(
          //         Icons.person_outline,
          //         color: Colors.deepOrange[200],
          //         size: 60,
          //       ),
          //     ),
          //   ),
          // ),
          ),
    );
  }
}
