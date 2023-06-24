import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:sound_clean/blocs/clear_bloc/clear_bloc.dart';
import 'package:sound_clean/blocs/localization_bloc/localization_bloc.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../../blocs/blocs_export.dart';
import '../../generated/l10n.dart';
import '../../themes/theme.dart';

class ClearScreen extends StatefulWidget {
  const ClearScreen({super.key});

  @override
  State<ClearScreen> createState() => _ClearScreenState();
}

class _ClearScreenState extends State<ClearScreen> {
  bool isVietNamese = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClearBloc(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            Switch(
                value: isVietNamese,
                onChanged: (value) {
                  setState(() {
                    isVietNamese = value;
                    BlocProvider.of<LocalizationBloc>(context).add(
                      LocalizationChangeEvent(
                        locale: isVietNamese ? Locale('vi') : Locale('en'),
                      ),
                    );
                  });
                }),
            Text(S.of(context).change),
            BlocBuilder<ClearBloc, ClearState>(
              builder: (context, state) {
                return WidgetCircularAnimator(
                  innerColor: AppColors.black03,
                  outerColor: AppColors.black03,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<ClearBloc>(context).add(
                        PressSoundEvent(
                          isPress: state is SoundPlayingState
                              ? state.isPlaying
                              : false,
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
      ),
    );
  }
}
