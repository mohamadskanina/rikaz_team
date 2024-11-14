import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/widgets/show_dialog.dart';
import 'package:rikaz_team/features/export_to_pdf/presentation/widgets/save_pdf_dialog.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_event.dart';
import 'package:rikaz_team/features/users_list/presentation/widgets/Export_To_Excel/excel_bloc_listiner.dart';

import '../../../../core/services/services_locator.dart';
import '../controller/view_user_bloc/user_bloc.dart';
import '../controller/view_user_bloc/user_state.dart';
import '../widgets/user_list_widget.dart';

class ViewUsersList extends StatelessWidget {
  const ViewUsersList({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserBloc>()..add(GetUsersEvent()),
        ),
        BlocProvider(create: (context) => ExcelBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "User management",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: Container(),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.blue[800]),
          actions: [
            BlocBuilder<UserBloc, UserState>(
              builder: (actionsContext, state) {
                return !state.loading
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: IconButton(
                              icon: const Icon(Icons.picture_as_pdf),
                              onPressed: () => ShowDialog(
                                  context: actionsContext,
                                  dialogWidget: const SavePdfDialog()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: IconButton(
                              icon: const Icon(Icons.dataset_outlined),
                              onPressed: () {
                                actionsContext
                                    .read<ExcelBloc>()
                                    .add(ExcelEvent.exoprtToExcel(state.users));
                              },
                            ),
                          ),
                        ],
                      )
                    : Container();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const Expanded(child: UserListWidget()),
              const ExcelBlocListiner(),
            ],
          ),
        ),
      ),
    );
  }
}
