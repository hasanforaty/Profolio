import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profolio/blocs/local_bloc.dart';

class SelectLocalWidget extends StatelessWidget {
  const SelectLocalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLocalBloc, SupportedLocal>(
        builder: (context, local) {
      return Row(
        children: [
          SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                context.read<CurrentLocalBloc>().changeLocal(SupportedLocal.en);
              },
              child: SvgPicture.asset(
                "logos/english.svg",
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              context.read<CurrentLocalBloc>().changeLocal(SupportedLocal.fa);
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset(
                "logos/iran.svg",
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      );
    });
  }
}
