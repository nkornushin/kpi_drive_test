// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_api_client.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _TasksApiClient implements TasksApiClient {
  _TasksApiClient(this._dio, {this.baseUrl, this.errorLogger});

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponseDto<PaginatedListDto<TaskDto>>> getMoIndicators({
    required String authUserId,
    required String behaviourKey,
    required String periodStart,
    required String periodEnd,
    required String periodKey,
    required String requestedMoId,
    required String withResult,
    required String responseFields,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('auth_user_id', authUserId));
    _data.fields.add(MapEntry('behaviour_key', behaviourKey));
    _data.fields.add(MapEntry('period_start', periodStart));
    _data.fields.add(MapEntry('period_end', periodEnd));
    _data.fields.add(MapEntry('period_key', periodKey));
    _data.fields.add(MapEntry('requested_mo_id', requestedMoId));
    _data.fields.add(MapEntry('with_result', withResult));
    _data.fields.add(MapEntry('response_fields', responseFields));
    final _options = _setStreamType<ApiResponseDto<PaginatedListDto<TaskDto>>>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/indicators/get_mo_indicators',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponseDto<PaginatedListDto<TaskDto>> _value;
    try {
      _value = ApiResponseDto<PaginatedListDto<TaskDto>>.fromJson(
        _result.data!,
        (json) => PaginatedListDto<TaskDto>.fromJson(
          json as Map<String, dynamic>,
          (json) => TaskDto.fromJson(json as Map<String, dynamic>),
        ),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<void> saveIndicatorInstanceField({
    required String periodStart,
    required String periodEnd,
    required String periodKey,
    required String indicatorToMoId,
    required List<String> fieldNames,
    required List<String> fieldValues,
    required String authUserId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('period_start', periodStart));
    _data.fields.add(MapEntry('period_end', periodEnd));
    _data.fields.add(MapEntry('period_key', periodKey));
    _data.fields.add(MapEntry('indicator_to_mo_id', indicatorToMoId));
    for (var i in fieldNames) {
      _data.fields.add(MapEntry('field_name', i));
    }
    for (var i in fieldValues) {
      _data.fields.add(MapEntry('field_value', i));
    }
    _data.fields.add(MapEntry('auth_user_id', authUserId));
    final _options = _setStreamType<void>(
      Options(
            method: 'POST',
            headers: _headers,
            extra: _extra,
            contentType: 'multipart/form-data',
          )
          .compose(
            _dio.options,
            '/indicators/save_indicator_instance_field',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    await _dio.fetch<void>(_options);
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
