package ps6;
import java.util.Arrays;

public class Duplicates {
public static void main(String[] args){
    int[] arr = {2, 5, 5, 5, 10, 12, 12};
    int ret = removeDups(arr);
    System.out.println(Arrays.toString(arr));
    System.out.println(ret);
}

private static int removeDups(int[] arr) {
    for (int i = 0; i < arr.length - 1; i++){
        if (arr[i] == arr[i + 1]) {
            arr[i] = 0;
        }
    }
    int count = 0,zeros = 0;
    for (int i = 0; i < arr.length; i++)
        if (arr[i] != 0)
            arr[count++] = arr[i];
        else
            zeros++;
        while (count < arr.length)
            arr[count++] = 0;
    return arr.length-zeros;
}
}
