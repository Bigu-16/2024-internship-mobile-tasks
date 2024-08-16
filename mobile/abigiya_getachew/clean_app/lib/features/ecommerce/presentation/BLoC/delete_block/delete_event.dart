class DeleteEvent{}

class DeleteData extends DeleteEvent{
  late final String id;
  DeleteData(this.id);
}