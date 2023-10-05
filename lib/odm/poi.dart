class POI {
  final String? groupId;
  final int? id;

  POI({
    this.groupId,
    this.id,
  });

  factory POI.fromJson(Map<String, dynamic> json) => POI(
        groupId: json['groupId'],
        id: json['id'],
      );
}