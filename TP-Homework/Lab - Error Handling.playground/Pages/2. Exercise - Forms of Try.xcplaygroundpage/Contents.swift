/*:
## Exercise - Forms of Try
 
 The throwing function below produces an error if the user attempts to divide by zero. Call the function using `try` in a `do`/`catch` statement, printing the error to the console. Test using valid and invalid inputs to see the result.
 */

 enum MathError: Error {
    case divideByZero
 }

func divide(_ numerator: Double, by denominator: Double) throws -> Double {
    guard denominator != 0 else { throw MathError.divideByZero }
    return numerator / denominator
}
 
do {
    let example = try divide(0, by: 0)
    print(example)
} catch {
    print("Error: \(error)")
}
//:  Now call the function using `try?`. Since errors are not handled when using `try?`, you do not need a `do`/`catch` statement. Test using valid and invalid inputs, printing the result.


    try? divide(10, by: 10)

//:  Finally, call the function using `try!` and test it with an invalid input. What happens if the input is invalid? Write a comment explaining your answer, then set a valid input.
try! divide(0, by: 0)
//when i put in invalid input it gives me a error __lldb_expr_290/2. Exercise - Forms of Try.xcplaygroundpage:28: Fatal error: 'try!' expression unexpectedly raised an error: __lldb_expr_290.MathError.divideByZero
// when i put a valid imput i get nothing back.
/*:
[Previous](@previous)  |  page 2 of 4  |  [Next: Exercise - Associated Values](@next)
 */
