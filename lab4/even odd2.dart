import 'dart:io';
void even(List<int> a){
  int counteven=0;
  int countodd=0;
  for(int i=0;i<a.length;i++){
    if(a[i]%2==0){
      counteven++;
    }else{
      countodd++;
    }
  }
  print('even num :$counteven');
  print('odd num :$countodd');
}
void main(){
  List<int> nums=[];
  for(int i=0;i<5;i++){
    nums.add(int.parse(stdin.readLineSync()!));
  }
  even(nums);
}