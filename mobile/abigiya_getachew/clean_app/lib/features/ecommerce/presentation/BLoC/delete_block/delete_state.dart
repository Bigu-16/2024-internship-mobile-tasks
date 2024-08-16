abstract class DeleteState{}

class DeleteLoading extends DeleteState{}

class DeleteSuccess extends DeleteState{
  late final String message;
  DeleteSuccess(this.message);
}

class DeleteFailure extends DeleteState{
  late final String message;
  DeleteFailure(this.message); 
}
