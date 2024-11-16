// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// UserState _$UserStateFromJson(Map<String, dynamic> json) => UserState(
//       users: (json['users'] as List<dynamic>)
//           .map((e) => User.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       loading: json['loading'] as bool,
//       error: json['error'] as bool,
//       errorMessage: json['errorMessage'] as String,
//     );


Map<String, dynamic> _$UserStateToJson(UserState instance) => <String, dynamic>{
      'users': instance.users,
      'loading': instance.loading,
      'error': instance.error,
      'errorMessage': instance.errorMessage,
    };

_$UserStateImpl _$$UserStateImplFromJson(Map<String, dynamic> json) =>
    _$UserStateImpl(
      users: (json['users'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String? ?? '',
    );

Map<String, dynamic> _$$UserStateImplToJson(_$UserStateImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
      'loading': instance.loading,
      'error': instance.error,
      'errorMessage': instance.errorMessage,
    };
