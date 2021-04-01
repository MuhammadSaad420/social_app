class UserProfile {
  int id;
  String email;
  String firstName;
  String lastName;
  String createdAt;
  String updatedAt;
  String phone;
  Null gender;
  Null address;
  String apiToken;
  String profileImg;
  String coverImg;
  Null dob;
  int trial;
  Null trialStartOn;

  UserProfile(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.createdAt,
      this.updatedAt,
      this.phone,
      this.gender,
      this.address,
      this.apiToken,
      this.profileImg,
      this.coverImg,
      this.dob,
      this.trial,
      this.trialStartOn});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    apiToken = json['api_token'];
    profileImg = json['profile_img'];
    coverImg = json['cover_img'];
    dob = json['dob'];
    trial = json['trial'];
    trialStartOn = json['trial_start_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['api_token'] = this.apiToken;
    data['profile_img'] = this.profileImg;
    data['cover_img'] = this.coverImg;
    data['dob'] = this.dob;
    data['trial'] = this.trial;
    data['trial_start_on'] = this.trialStartOn;
    return data;
  }
}
