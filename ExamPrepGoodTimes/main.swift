import Foundation

/*
 
 ORGANIZING YOUR SOLUTION
 
 A good way to orgaize your code is to separate your code into the three sections - input, process, output – as much as possible.
 
 The start of a solution is implemented below. Consider all the possible inputs. Can you finish the solution?
 
 */

/*
 
 INPUT
 
 Be sure that your implementation of this section discards all the possible bad inputs the user could provide.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
var ottawaTime : Int = -1   // Purposely set value to something that is not valid

// Set message to show if problems
let errorMessage = "Provide an integer value between 0 and 2359 inclusive."

// Loop until valid input received
repeat {
    
    // OK, try to get input from the user
    
    // Get the user's input
    var input : String?
    input = readLine()
    
    // Use optional binding to see if the string can be unwrapped (to see if it is not nil)
    if let notNilInput = input {
        
        // We have some kind of string, is it an integer?
        if let inputAsInteger = Int(notNilInput) {
            
            // NOTE: Two tests for valid input...
            // 1. valid input time is an integer between between 0 and 2359
            // 2. last two digits being between 00 and 59
            // Now check to see if the integer is in the desired range AND last two digits are between 00 and 59
            if inputAsInteger >= 0 && inputAsInteger <= 2359 && inputAsInteger % 100 < 60 {
                
                // Whew! We have a valid input value. So, assign it to our variable.
                ottawaTime = inputAsInteger
                
            } else {
                // Print the error message
                print(errorMessage)
            }
            
        } else {
            
            // Could not convert to an integer, show the error message
            print(errorMessage)
        }
        
    }
    
} while ottawaTime == -1    // Keep looping until ottawaTime set to something valid

/*
 
 PROCESS
 
 Here is where you implement the logic that solves the problem at hand.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */

// Victoria
var victoriaTime : Int = ottawaTime - 300
// Handle cases with negative time (times in the day before)
if victoriaTime < 0 {
    victoriaTime = 2400 + victoriaTime
}
// Handle cases with time in next day
if victoriaTime > 2359 {
    victoriaTime = victoriaTime - 2400
}

// Edmonton
var edmontonTime : Int = ottawaTime - 200
// Handle cases with negative time (times in the day before)
if edmontonTime < 0 {
    edmontonTime = 2400 + edmontonTime
}
// Handle cases with time in next day
if edmontonTime > 2359 {
    edmontonTime = edmontonTime - 2400
}

// Winnipeg
var winnipegTime : Int = ottawaTime - 100
// Handle cases with negative time (times in the day before)
if winnipegTime < 0 {
    winnipegTime = 2400 + winnipegTime
}
// Handle cases with time in next day
if winnipegTime > 2359 {
    winnipegTime = winnipegTime - 2400
}

// Halifax
var halifaxTime : Int = ottawaTime + 100
// Handle cases with negative time (times in the day before)
if halifaxTime < 0 {
    halifaxTime = 2400 + halifaxTime
}
// Handle cases with time in next day
if halifaxTime > 2359 {
    halifaxTime = halifaxTime - 2400
}

// St. John's
var stJohnsTime : Int = ottawaTime + 130
// Handle cases with negative time (times in the day before)
if stJohnsTime < 0 {
    stJohnsTime = 2400 + stJohnsTime
}
// Handle cases with time in next day
if stJohnsTime > 2359 {
    stJohnsTime = stJohnsTime - 2400
}
// Handle cases where time value goes past 59 minutes
// e.g.: Ottawa time is 0059, 00:59 AM
//       Then St. John's time is 2:29 AM and shown as 0189 but should be 0229
if (stJohnsTime % 100 >= 60) {
    var properHours = stJohnsTime / 100 * 100
    var extraMinutes = stJohnsTime % 100
    var shortHours = extraMinutes / 60 * 100
    var danglingMinutes = extraMinutes % 60
    var fixedTime = properHours + shortHours + danglingMinutes
    stJohnsTime = fixedTime
}

/*
 
 OUTPUT
 
 Here is where you report the results of the 'process' section above.
 
 Make use of your test plan and algorithm to ensure your code is complete.
 
 */
print("\(ottawaTime) in Ottawa")
print("\(victoriaTime) in Victoria")
print("\(edmontonTime) in Edmonton")
print("\(winnipegTime) in Winnipeg")
print("\(ottawaTime) in Toronto") // Toronto always the same as Ottawa
print("\(halifaxTime) in Halifax")
print("\(stJohnsTime) in St. John's")
