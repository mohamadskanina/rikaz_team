import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rikaz_team/features/export_to_pdf/presentation/controller/cubit/pdf_cubit.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';

class SavePdfDialog extends StatelessWidget {
  const SavePdfDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PdfCubit(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )),
              Expanded(
                  child: Lottie.asset('assets/view_pdf.json',
                      width: 300.w, height: 300.h)),
              Divider(),
              Builder(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<PdfCubit>().printPdfReport();
                        },
                        label:  Text(Lang.of(context).print),
                        icon: Icon(Icons.print_outlined),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<PdfCubit>().savePdfLocalStorage();
                        },
                        label:  Text(Lang.of(context).save),
                        icon: Icon(Icons.save_outlined),
                      )
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
