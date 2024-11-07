import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/edit_user_bloc/edit_user_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/edit_user_bloc/edit_user_state.dart';

import '../../domain/entities/user.dart';

class UpdateInfoWidget extends StatelessWidget {
  const UpdateInfoWidget(
      {super.key, required this.user, required this.editUserBloc});
  final User user;
  final EditUserBloc editUserBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditUserBloc, EditUserState>(
      builder: (context, state) {
        return Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: user.avatar,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          size: 100.r,
                          color: Colors.red,
                        ),
                        width: 200.r,
                        height: 200.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  _buildTextField(
                    controller: editUserBloc.firstNameController,
                    label: 'First Name',
                  ),
                  SizedBox(height: 16.h),
                  _buildTextField(
                    controller: editUserBloc.lastNameController,
                    label: 'Last Name',
                  ),
                  SizedBox(height: 16.h),
                  _buildTextField(
                    controller: editUserBloc.emailController,
                    label: 'Email',
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<EditUserBloc>()
                              .add(UpdateUserInfoEvent(id: user.id));
                        },
                        icon: Icon(Icons.save, size: 20.sp),
                        label: Text(
                          'Save',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.cancel, size: 20.sp),
                        label: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 12.h),
                          side: BorderSide(color: Colors.grey.shade400),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
