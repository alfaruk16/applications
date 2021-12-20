class Applications {
  final String? message;
  final int? status;
  final List<Data>? data;

  Applications({
    this.message,
    this.status,
    this.data,
  });

  Applications.fromJson(Map<String, dynamic> json)
      : message = json['message'] as String?,
        status = json['status'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'message' : message,
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final int? id;
  final String? applicantName;
  final String? weblink;
  final String? linkType;
  final String? linkTypeName;
  final String? packageName;
  final String? applicationType;
  final String? applicationTypeName;
  final String? paymentType;
  final String? paymentTypeName;
  final String? serveType;
  final String? serviceTypeName;
  final String? logoImg;
  final String? introduction;
  final String? createdBy;
  final String? createdUserName;
  final String? createdAt;

  Data({
    this.id,
    this.applicantName,
    this.weblink,
    this.linkType,
    this.linkTypeName,
    this.packageName,
    this.applicationType,
    this.applicationTypeName,
    this.paymentType,
    this.paymentTypeName,
    this.serveType,
    this.serviceTypeName,
    this.logoImg,
    this.introduction,
    this.createdBy,
    this.createdUserName,
    this.createdAt,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        applicantName = json['applicant_name'] as String?,
        weblink = json['weblink'] as String?,
        linkType = json['link_type'] as String?,
        linkTypeName = json['link_type_name'] as String?,
        packageName = json['package_name'] as String?,
        applicationType = json['application_type'] as String?,
        applicationTypeName = json['application_type_name'] as String?,
        paymentType = json['payment_type'] as String?,
        paymentTypeName = json['payment_type_name'] as String?,
        serveType = json['serve_type'] as String?,
        serviceTypeName = json['service_type_name'] as String?,
        logoImg = json['logo_img'] as String?,
        introduction = json['introduction'] as String?,
        createdBy = json['created_by'] as String?,
        createdUserName = json['created_user_name'] as String?,
        createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'applicant_name' : applicantName,
    'weblink' : weblink,
    'link_type' : linkType,
    'link_type_name' : linkTypeName,
    'package_name' : packageName,
    'application_type' : applicationType,
    'application_type_name' : applicationTypeName,
    'payment_type' : paymentType,
    'payment_type_name' : paymentTypeName,
    'serve_type' : serveType,
    'service_type_name' : serviceTypeName,
    'logo_img' : logoImg,
    'introduction' : introduction,
    'created_by' : createdBy,
    'created_user_name' : createdUserName,
    'created_at' : createdAt
  };
}