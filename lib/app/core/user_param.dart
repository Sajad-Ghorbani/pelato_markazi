class UserParams {
  String name;
  String familyName;
  String? groupName;
  String? instagramPageAddress;
  String? email;

  UserParams({
    required this.name,
    required this.familyName,
    this.groupName,
    this.instagramPageAddress,
    this.email,
  });
}
