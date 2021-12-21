class NonFieldError {
  final List<String>? nonFieldErrors;

  NonFieldError({
    this.nonFieldErrors,
  });

  NonFieldError.fromJson(Map<String, dynamic> json)
      : nonFieldErrors = (json['non_field_errors'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'non_field_errors' : nonFieldErrors
  };
}