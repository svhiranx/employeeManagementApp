class Task {
  String taskTitle;
  int taskNo;
  String completeDate;
  String taskDetails;
  bool isComplete = false;
  Task(
      {required this.taskTitle,
      required this.taskNo,
      required this.completeDate,
      required this.taskDetails});
}
