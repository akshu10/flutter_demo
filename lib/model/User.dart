class User {
  final String id;
  final String organizationId;
  final String organizationUuid;
  final String organizationName;
  final String email;
  final String username;
  final String name;
  final List<String> roles;
  final List<String> permissions;
  final List<String> organizationIds;

  User({
    required this.id,
    required this.organizationId,
    required this.organizationUuid,
    required this.organizationName,
    required this.email,
    required this.username,
    required this.name,
    required this.roles,
    required this.permissions,
    required this.organizationIds,
  });

  factory User.fromJson(Map<String, dynamic> user) {
    return User(
        id: user['id'],
        organizationId: user['organizationId'],
        organizationUuid: user['organizationUuid'],
        organizationName: user['organizationName'],
        email: user['email'],
        username: user['username'],
        name: user['name'],
        roles: user['roles'],
        permissions: user['permissions'],
        organizationIds: user['organizationIds']);
  }
}
