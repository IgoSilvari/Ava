enum StatusLoad {
  none,
  success,
  failed,
  executing,
  failedServe,
  cancel,
  authenticationFailure,
  reportedDataError,
  existingUser,
}

StatusLoad verificLoading(int? statusCode) {
  if ((statusCode ?? 0) <= 299 && (statusCode ?? 0) >= 200) {
    return StatusLoad.success;
  } else if (statusCode == 500) {
    return StatusLoad.failedServe;
  } else if (statusCode == 401) {
    return StatusLoad.authenticationFailure;
  } else if (statusCode == 422) {
    return StatusLoad.reportedDataError;
  } else {
    return StatusLoad.failed;
  }
}
