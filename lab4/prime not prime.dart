void prime(int a){
  int sum=0;
  for(int i=1;i<=a;i++){
    if(a%i==0){
      sum++;
    }
  }
  if(sum==2){
    print('prime');
  }
  else{
    print('not_prime');
  }
}
void main(){
  prime(4);
}
