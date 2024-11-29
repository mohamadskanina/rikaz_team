import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/core/widgets/app_text_button.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_event.dart';
import 'package:rikaz_team/features/users_list/presentation/widgets/Export_To_Excel/excel_bloc_listiner.dart';

class ExportToExcel extends StatelessWidget {
  const ExportToExcel({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          AppTextButton(
            buttonText: "Export To Excel",
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {
              context.read<ExcelBloc>().add(ExcelEvent.exoprtToExcel(users));
            },
            backgroundColor: Colors.green,
          ),
          const ExcelBlocListiner(),
        ],
      ),
    );
  }
}
