package ps6;

public class PairFinder {

    public static void findPairSums(int k,int[] arr){
        for(int i=0;i<arr.length;i++){
            for(int j=i+1;j<arr.length;j++){
                if((arr[i]+arr[j])==k){
                    System.out.println(arr[i] + " + " + arr[j] + " = " + k);
                }
            }
        }
    }
 
    public static void findPairSumsFaster(int k,int[] arr){
        Sort.mergeSort(arr);
        int left = 0, right = arr.length-1;
   
        while (left < right) {
            if(arr[left] + arr[right] == k){
                System.out.println(arr[left] + " + " + arr[right] + " = " + k);
                left++;
            }else if(arr[left] + arr[right] < k){
                left++;
            }else{
                right--;
            }
        }
    }
 
    public static void main(String[] args) {
        int[] arr = {0,1,4,3};
        int k = 4;
        findPairSums(k, arr);
        findPairSumsFaster(k,arr);
    }
}
