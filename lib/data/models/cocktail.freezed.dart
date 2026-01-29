// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocktail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cocktail _$CocktailFromJson(Map<String, dynamic> json) {
  return _Cocktail.fromJson(json);
}

/// @nodoc
mixin _$Cocktail {
  String get idDrink => throw _privateConstructorUsedError;
  String get strDrink => throw _privateConstructorUsedError;
  String get strDrinkThumb => throw _privateConstructorUsedError;
  String? get strInstructions => throw _privateConstructorUsedError;
  String? get strCategory =>
      throw _privateConstructorUsedError; // Ингредиенты (API отдает их по отдельности, возьмем основные 5)
  String? get strIngredient1 => throw _privateConstructorUsedError;
  String? get strIngredient2 => throw _privateConstructorUsedError;
  String? get strIngredient3 => throw _privateConstructorUsedError;
  String? get strIngredient4 => throw _privateConstructorUsedError;
  String? get strIngredient5 => throw _privateConstructorUsedError;
  String? get strMeasure1 => throw _privateConstructorUsedError;
  String? get strMeasure2 => throw _privateConstructorUsedError;
  String? get strMeasure3 => throw _privateConstructorUsedError;
  String? get strMeasure4 => throw _privateConstructorUsedError;
  String? get strMeasure5 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocktailCopyWith<Cocktail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocktailCopyWith<$Res> {
  factory $CocktailCopyWith(Cocktail value, $Res Function(Cocktail) then) =
      _$CocktailCopyWithImpl<$Res, Cocktail>;
  @useResult
  $Res call(
      {String idDrink,
      String strDrink,
      String strDrinkThumb,
      String? strInstructions,
      String? strCategory,
      String? strIngredient1,
      String? strIngredient2,
      String? strIngredient3,
      String? strIngredient4,
      String? strIngredient5,
      String? strMeasure1,
      String? strMeasure2,
      String? strMeasure3,
      String? strMeasure4,
      String? strMeasure5});
}

/// @nodoc
class _$CocktailCopyWithImpl<$Res, $Val extends Cocktail>
    implements $CocktailCopyWith<$Res> {
  _$CocktailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDrink = null,
    Object? strDrink = null,
    Object? strDrinkThumb = null,
    Object? strInstructions = freezed,
    Object? strCategory = freezed,
    Object? strIngredient1 = freezed,
    Object? strIngredient2 = freezed,
    Object? strIngredient3 = freezed,
    Object? strIngredient4 = freezed,
    Object? strIngredient5 = freezed,
    Object? strMeasure1 = freezed,
    Object? strMeasure2 = freezed,
    Object? strMeasure3 = freezed,
    Object? strMeasure4 = freezed,
    Object? strMeasure5 = freezed,
  }) {
    return _then(_value.copyWith(
      idDrink: null == idDrink
          ? _value.idDrink
          : idDrink // ignore: cast_nullable_to_non_nullable
              as String,
      strDrink: null == strDrink
          ? _value.strDrink
          : strDrink // ignore: cast_nullable_to_non_nullable
              as String,
      strDrinkThumb: null == strDrinkThumb
          ? _value.strDrinkThumb
          : strDrinkThumb // ignore: cast_nullable_to_non_nullable
              as String,
      strInstructions: freezed == strInstructions
          ? _value.strInstructions
          : strInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      strCategory: freezed == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient1: freezed == strIngredient1
          ? _value.strIngredient1
          : strIngredient1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient2: freezed == strIngredient2
          ? _value.strIngredient2
          : strIngredient2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient3: freezed == strIngredient3
          ? _value.strIngredient3
          : strIngredient3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient4: freezed == strIngredient4
          ? _value.strIngredient4
          : strIngredient4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient5: freezed == strIngredient5
          ? _value.strIngredient5
          : strIngredient5 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure1: freezed == strMeasure1
          ? _value.strMeasure1
          : strMeasure1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure2: freezed == strMeasure2
          ? _value.strMeasure2
          : strMeasure2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure3: freezed == strMeasure3
          ? _value.strMeasure3
          : strMeasure3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure4: freezed == strMeasure4
          ? _value.strMeasure4
          : strMeasure4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure5: freezed == strMeasure5
          ? _value.strMeasure5
          : strMeasure5 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CocktailImplCopyWith<$Res>
    implements $CocktailCopyWith<$Res> {
  factory _$$CocktailImplCopyWith(
          _$CocktailImpl value, $Res Function(_$CocktailImpl) then) =
      __$$CocktailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idDrink,
      String strDrink,
      String strDrinkThumb,
      String? strInstructions,
      String? strCategory,
      String? strIngredient1,
      String? strIngredient2,
      String? strIngredient3,
      String? strIngredient4,
      String? strIngredient5,
      String? strMeasure1,
      String? strMeasure2,
      String? strMeasure3,
      String? strMeasure4,
      String? strMeasure5});
}

/// @nodoc
class __$$CocktailImplCopyWithImpl<$Res>
    extends _$CocktailCopyWithImpl<$Res, _$CocktailImpl>
    implements _$$CocktailImplCopyWith<$Res> {
  __$$CocktailImplCopyWithImpl(
      _$CocktailImpl _value, $Res Function(_$CocktailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDrink = null,
    Object? strDrink = null,
    Object? strDrinkThumb = null,
    Object? strInstructions = freezed,
    Object? strCategory = freezed,
    Object? strIngredient1 = freezed,
    Object? strIngredient2 = freezed,
    Object? strIngredient3 = freezed,
    Object? strIngredient4 = freezed,
    Object? strIngredient5 = freezed,
    Object? strMeasure1 = freezed,
    Object? strMeasure2 = freezed,
    Object? strMeasure3 = freezed,
    Object? strMeasure4 = freezed,
    Object? strMeasure5 = freezed,
  }) {
    return _then(_$CocktailImpl(
      idDrink: null == idDrink
          ? _value.idDrink
          : idDrink // ignore: cast_nullable_to_non_nullable
              as String,
      strDrink: null == strDrink
          ? _value.strDrink
          : strDrink // ignore: cast_nullable_to_non_nullable
              as String,
      strDrinkThumb: null == strDrinkThumb
          ? _value.strDrinkThumb
          : strDrinkThumb // ignore: cast_nullable_to_non_nullable
              as String,
      strInstructions: freezed == strInstructions
          ? _value.strInstructions
          : strInstructions // ignore: cast_nullable_to_non_nullable
              as String?,
      strCategory: freezed == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient1: freezed == strIngredient1
          ? _value.strIngredient1
          : strIngredient1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient2: freezed == strIngredient2
          ? _value.strIngredient2
          : strIngredient2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient3: freezed == strIngredient3
          ? _value.strIngredient3
          : strIngredient3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient4: freezed == strIngredient4
          ? _value.strIngredient4
          : strIngredient4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strIngredient5: freezed == strIngredient5
          ? _value.strIngredient5
          : strIngredient5 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure1: freezed == strMeasure1
          ? _value.strMeasure1
          : strMeasure1 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure2: freezed == strMeasure2
          ? _value.strMeasure2
          : strMeasure2 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure3: freezed == strMeasure3
          ? _value.strMeasure3
          : strMeasure3 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure4: freezed == strMeasure4
          ? _value.strMeasure4
          : strMeasure4 // ignore: cast_nullable_to_non_nullable
              as String?,
      strMeasure5: freezed == strMeasure5
          ? _value.strMeasure5
          : strMeasure5 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CocktailImpl extends _Cocktail {
  const _$CocktailImpl(
      {required this.idDrink,
      required this.strDrink,
      required this.strDrinkThumb,
      required this.strInstructions,
      required this.strCategory,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5})
      : super._();

  factory _$CocktailImpl.fromJson(Map<String, dynamic> json) =>
      _$$CocktailImplFromJson(json);

  @override
  final String idDrink;
  @override
  final String strDrink;
  @override
  final String strDrinkThumb;
  @override
  final String? strInstructions;
  @override
  final String? strCategory;
// Ингредиенты (API отдает их по отдельности, возьмем основные 5)
  @override
  final String? strIngredient1;
  @override
  final String? strIngredient2;
  @override
  final String? strIngredient3;
  @override
  final String? strIngredient4;
  @override
  final String? strIngredient5;
  @override
  final String? strMeasure1;
  @override
  final String? strMeasure2;
  @override
  final String? strMeasure3;
  @override
  final String? strMeasure4;
  @override
  final String? strMeasure5;

  @override
  String toString() {
    return 'Cocktail(idDrink: $idDrink, strDrink: $strDrink, strDrinkThumb: $strDrinkThumb, strInstructions: $strInstructions, strCategory: $strCategory, strIngredient1: $strIngredient1, strIngredient2: $strIngredient2, strIngredient3: $strIngredient3, strIngredient4: $strIngredient4, strIngredient5: $strIngredient5, strMeasure1: $strMeasure1, strMeasure2: $strMeasure2, strMeasure3: $strMeasure3, strMeasure4: $strMeasure4, strMeasure5: $strMeasure5)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CocktailImpl &&
            (identical(other.idDrink, idDrink) || other.idDrink == idDrink) &&
            (identical(other.strDrink, strDrink) ||
                other.strDrink == strDrink) &&
            (identical(other.strDrinkThumb, strDrinkThumb) ||
                other.strDrinkThumb == strDrinkThumb) &&
            (identical(other.strInstructions, strInstructions) ||
                other.strInstructions == strInstructions) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strIngredient1, strIngredient1) ||
                other.strIngredient1 == strIngredient1) &&
            (identical(other.strIngredient2, strIngredient2) ||
                other.strIngredient2 == strIngredient2) &&
            (identical(other.strIngredient3, strIngredient3) ||
                other.strIngredient3 == strIngredient3) &&
            (identical(other.strIngredient4, strIngredient4) ||
                other.strIngredient4 == strIngredient4) &&
            (identical(other.strIngredient5, strIngredient5) ||
                other.strIngredient5 == strIngredient5) &&
            (identical(other.strMeasure1, strMeasure1) ||
                other.strMeasure1 == strMeasure1) &&
            (identical(other.strMeasure2, strMeasure2) ||
                other.strMeasure2 == strMeasure2) &&
            (identical(other.strMeasure3, strMeasure3) ||
                other.strMeasure3 == strMeasure3) &&
            (identical(other.strMeasure4, strMeasure4) ||
                other.strMeasure4 == strMeasure4) &&
            (identical(other.strMeasure5, strMeasure5) ||
                other.strMeasure5 == strMeasure5));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idDrink,
      strDrink,
      strDrinkThumb,
      strInstructions,
      strCategory,
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5,
      strMeasure1,
      strMeasure2,
      strMeasure3,
      strMeasure4,
      strMeasure5);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CocktailImplCopyWith<_$CocktailImpl> get copyWith =>
      __$$CocktailImplCopyWithImpl<_$CocktailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CocktailImplToJson(
      this,
    );
  }
}

abstract class _Cocktail extends Cocktail {
  const factory _Cocktail(
      {required final String idDrink,
      required final String strDrink,
      required final String strDrinkThumb,
      required final String? strInstructions,
      required final String? strCategory,
      final String? strIngredient1,
      final String? strIngredient2,
      final String? strIngredient3,
      final String? strIngredient4,
      final String? strIngredient5,
      final String? strMeasure1,
      final String? strMeasure2,
      final String? strMeasure3,
      final String? strMeasure4,
      final String? strMeasure5}) = _$CocktailImpl;
  const _Cocktail._() : super._();

  factory _Cocktail.fromJson(Map<String, dynamic> json) =
      _$CocktailImpl.fromJson;

  @override
  String get idDrink;
  @override
  String get strDrink;
  @override
  String get strDrinkThumb;
  @override
  String? get strInstructions;
  @override
  String? get strCategory;
  @override // Ингредиенты (API отдает их по отдельности, возьмем основные 5)
  String? get strIngredient1;
  @override
  String? get strIngredient2;
  @override
  String? get strIngredient3;
  @override
  String? get strIngredient4;
  @override
  String? get strIngredient5;
  @override
  String? get strMeasure1;
  @override
  String? get strMeasure2;
  @override
  String? get strMeasure3;
  @override
  String? get strMeasure4;
  @override
  String? get strMeasure5;
  @override
  @JsonKey(ignore: true)
  _$$CocktailImplCopyWith<_$CocktailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
