package ps6;

import java.util.Arrays;

public class MergeIntersect {
    
    public static int[] intersect(int[] arr1, int[] arr2){
        int x;
        if (arr1.length>arr2.length){
            x = arr2.length;
        }else{
            x = arr1.length;
        }
        int[] inter = new int[x];   
        Sort.mergeSort(arr1);
        Sort.mergeSort(arr2);

        int arr1st = 0, arr2st = 0;
        int k = 0;
        while(arr1st<arr1.length && arr2st<arr2.length){
            if(arr1[arr1st]==arr2[arr2st]){
                inter[k] = arr1[arr1st];
                arr1st++;
                arr2st++;
                k++;
            }else if(arr1[arr1st]>arr2[arr2st]){
                arr2st++;
            }else{
                arr1st++;
            }
        }
        
        for (int i = 0; i < inter.length - 1; i++){
            if (inter[i] == inter[i + 1]) {
                inter[i] = 0;
                }
        }
    
        return inter;
    }

    public static void main(String[] args){
        int[] a1 = {10, 5, 7, 5, 9, 4};
        int[] a2 = {7, 5, 15, 7, 7, 9, 10};
        int[] result = MergeIntersect.intersect(a1, a2);
        System.out.println( Arrays.toString(result) );
    }
}
