package ps9;
/*
 * Palindrome.java
 *
 * Computer Science 112
 *
 * Modifications and additions by:
 *     name:
 *     username:
 */
   
public class Palindrome {
    // Add your definition of isPal here.
    public static boolean isPal(String s) {
        boolean isPal = false;    
        s = s.toLowerCase();

        for(int i = 0;i < s.length(); i++){
            char rep = s.charAt(i);
            if(!Character.isLetter(rep)){
                s = s.replace(rep, (char)32);
            }
        }
        s = s.replaceAll(" ","");
        
        LLStack<Character> reverse = new LLStack<Character>();
        LLQueue<Character> forwards = new LLQueue<Character>();

        for(int i = 0;i < s.length(); i++){
            reverse.push(s.charAt(i));
            forwards.insert(s.charAt(i));
        }

        for(int i = 0;i < s.length(); i++){
            if(reverse.pop()==forwards.remove()){
            isPal = true;
            }else{
            isPal = false;
            break;
            }
        }

        return isPal;
    }
    public static void main(String[] args) {
       
        
        System.out.println("--- Testing method isPal ---");
        System.out.println();

        System.out.println("(0) Testing on \"A man, a plan, a canal, Panama!\"");
        try {
            boolean results = isPal("A man, a plan, a canal, Panama!");
            System.out.println("actual results:");
            System.out.println(results);
            System.out.println("expected results:");
            System.out.println("true");
            System.out.print("MATCHES EXPECTED RESULTS?: ");
            System.out.println(results == true);
        } catch (Exception e) {
            System.out.println("INCORRECTLY THREW AN EXCEPTION: " + e);
        }
        
        System.out.println();    // include a blank line between tests
        
        /*
         * Add five more unit tests that test a variety of different
         * cases. Follow the same format that we have used above.
         */

        System.out.println("(1) Testing on \"No lemon, no melon\"");
        try {
            boolean results = isPal("No lemon, no melon");
            System.out.println("actual results:");
            System.out.println(results);
            System.out.println("expected results:");
            System.out.println("true");
            System.out.print("MATCHES EXPECTED RESULTS?: ");
            System.out.println(results == true);
        } catch (Exception e) {
            System.out.println("INCORRECTLY THREW AN EXCEPTION: " + e);
        }
        
        System.out.println();    // include a blank line between tests
        
        System.out.println("(2) Testing on \"Eva, can I see bees in a cave?\"");
        try {
            boolean results = isPal("Eva, can I see bees in a cave?");
            System.out.println("actual results:");
            System.out.println(results);
            System.out.println("expected results:");
            System.out.println("true");
            System.out.print("MATCHES EXPECTED RESULTS?: ");
            System.out.println(results == true);
        } catch (Exception e) {
            System.out.println("INCORRECTLY THREW AN EXCEPTION: " + e);
        }
        
        System.out.println();    // include a blank line between tests

        System.out.println("(3) Testing on \"Was it a cat I saw?\"");
        try {
            boolean results = isPal("Was it a cat I saw?");
            System.out.println("actual results:");
            System.out.println(results);
            System.out.println("expected results:");
            System.out.println("true");
            System.out.print("MATCHES EXPECTED RESULTS?: ");
            System.out.println(results == true);
        } catch (Exception e) {
            System.out.println("INCORRECTLY THREW AN EXCEPTION: " + e);
        }
        
        System.out.println();    // include a blank line between tests

        System.out.println("(4) Testing on \"Red rum, sir, is murder\"");
        try {
            boolean results = isPal("Red rum, sir, is murder");
            System.out.println("actual results:");
            System.out.println(results);
            System.out.println("expected results:");
            System.out.println("true");
            System.out.print("MATCHES EXPECTED RESULTS?: ");
            System.out.println(results == true);
        } catch (Exception e) {
            System.out.println("INCORRECTLY THREW AN EXCEPTION: " + e);
        }
        
        System.out.println();    // include a blank line between tests

        System.out.println("(5) Testing on \"Java\"");
        try {
            boolean results = isPal("Java");
            System.out.println("actual results:");
            System.out.println(results);
            System.out.println("expected results:");
            System.out.println("false");
            System.out.print("MATCHES EXPECTED RESULTS?: ");
            System.out.println(results == false);
        } catch (Exception e) {
            System.out.println("INCORRECTLY THREW AN EXCEPTION: " + e);
        }
        
        System.out.println();    // include a blank line between tests
    }
}