class UserModal
{
  late int id;
  late String name,work;

  UserModal(this.id,this.name,this.work);

  factory UserModal.fromMap(Map m1)
  {
    return UserModal(m1['id'], m1['name'], m1['work']);
  }
}