//
// MathOrPalindrome.swift
//
// Created by Noah Smith
// Created on 2025-03-06
// Version 1.0
// Copyright (c) 2025 Noah Smith. All rights reserved.
//

// The MathOrPalindrome.swift is 2 programs in one.
// The user can choose the one they want to try.
// The first program evaluates arithmetic expressions.
// In the MathInput.txt file, there are various arithmetic expressions.
// The math program will read the file and evaluate the expressions.
// The program will display the result of each expression to MathOutput.txt.
// The second program checks if words are palindromes.
// In the PalindromeInput.txt file, there are various words.
// The palindrome program finds if each of those words are palindromes.
// The program will display whether or not each word is a palindrome
// to PalindromeOutput.txt.
// The program will keep looping until the user presses 'q' to quit.

import Foundation

// Function to calculate sum
func calcSum(_ numA: Double, _ numB: Double) -> Double {

    // calculate and return the sum
    return numA + numB
}

// Function to calculate difference
func calcDifference(_ numA: Double, _ numB: Double) -> Double {

    // Calculate and return the difference
    return numA - numB
}

// Function to calculate product
func calcProduct(_ numA: Double, _ numB: Double) -> Double {

    // Calculate and return the product
    return numA * numB
}

// Function to calculate quotient
func calcQuotient(_ numA: Double, _ numB: Double) -> Double {

    // Check if numB is zero to avoid division by zero
    // If numB is zero, return NaN
    if numB == 0 {
        return Double.nan
    } else {
        // Otherwise, calculate and return the quotient
        return numA / numB
    }
}

// Function to find palindromes
func findPalindromes(_ arrayWords: [String]) -> String {

    // initialize an empty string to store the palindrome message
    var palindromeMessage = ""

    // Pass through each word in the array
    for word in arrayWords {

        // Initialize an empty string to store the reversed word
        var reversedWord = ""

        // Reverse the word by iterating through each character
        for char in word {
            reversedWord = String(char) + reversedWord
        }

        // if the original word is equal to the reversed word
        if word == reversedWord {

            // then it is a palindrome
            palindromeMessage += "\(word) is a palindrome.\n"
        } else {

            // otherwise, it is not a palindrome
            palindromeMessage += "\(word) is not a palindrome.\n"
        }
    }

    // Return the palindrome message as a string
    return palindromeMessage
}

// Greeting
print("Welcome!")

// Initialize program and user choice
var programChoice = ""
var userChoice = ""

// Loop to allow user to choose until they quit
repeat {
    print("Enter 1 to use the arithmetic expressions program.")
    print("Enter 2 to use the palindrome program.")
    print("If you are done playing, enter 'q' to quit:")

    // Get user's choice
    programChoice = readLine() ?? ""  // Directly use programChoice

    if programChoice == "1" {
        do {
            // Open the input file for reading
            let input = try String(contentsOfFile: "./MathInput.txt")

            // Split the input file into lines
            let lines = input.components(separatedBy: .newlines)

            // Initialize the output string
            var output = ""

            // Loop through each line in the input file
            for line in lines {
                if line.contains(" + ") {
                    // Split the line into two numbers
                    // Source: https://developer.apple.com/documentation/...
                    // ...foundation/nsstring/components(separatedby:)-238fy
                    let arrayNumStr = line.components(separatedBy: " + ")

                    // Convert the strings to doubles
                    let numA = Double(arrayNumStr[0]) ?? 0.0
                    let numB = Double(arrayNumStr[1]) ?? 0.0

                    // Call sum function
                    let result = calcSum(numA, numB)

                    // Add the result to the output string
                    output += "\(line) = \(String(format: "%.2f", result))\n"

                } else if line.contains(" - ") {

                    // Split the line into two numbers
                    let arrayNumStr = line.components(separatedBy: " - ")

                    // Convert the strings to doubles
                    let numA = Double(arrayNumStr[0]) ?? 0.0
                    let numB = Double(arrayNumStr[1]) ?? 0.0

                    // Call difference function
                    let result = calcDifference(numA, numB)

                    // Add the result to the output string
                    output += "\(line) = \(String(format: "%.2f", result))\n"

                } else if line.contains(" * ") {

                    // Split the line into two numbers
                    let arrayNumStr = line.components(separatedBy: " * ")

                    // Convert the strings to doubles
                    let numA = Double(arrayNumStr[0]) ?? 0.0
                    let numB = Double(arrayNumStr[1]) ?? 0.0

                    // Call product function
                    let result = calcProduct(numA, numB)

                    // Add the result to the output string
                    output += "\(line) = \(String(format: "%.2f", result))\n"

                } else if line.contains(" / ") {

                    // Split the line into two numbers
                    let arrayNumStr = line.components(separatedBy: " / ")

                    // Convert the strings to doubles
                    let numA = Double(arrayNumStr[0]) ?? 0.0
                    let numB = Double(arrayNumStr[1]) ?? 0.0

                    // call quotient function
                    let result = calcQuotient(numA, numB)

                    // Add the result to the output string
                    output += "\(line) = \(String(format: "%.2f", result))\n"

                } else {
                    // Display error message for invalid expression
                    output += "\(line) is an invalid expression.\n"
                }
            }

            // Write the output to the output file
            try output.write(toFile: "./MathOutput.txt", atomically: true, encoding: .utf8)
            print("Successfully wrote to 'MathOutput.txt'")

        } catch {
            print("Unable to read the file.")
        }

    } else if programChoice == "2" {
        print("You have chosen the palindrome program.")

        // Try to read the input file
        do {
            // Open the input file for reading
            let input = try String(contentsOfFile: "./PalindromeInput.txt")

            // Split the input file into lines
            let arrayWords = input.components(separatedBy: .newlines)

            // Call palindrome function
            let palindromeMessage = findPalindromes(arrayWords)

            // Write the palindrome message to the palindrome output file
            try palindromeMessage.write(toFile: "./PalindromeOutput.txt", atomically: true, encoding: .utf8)

            // Display the success message
            print("Successfully wrote to 'PalindromeOutput.txt'")

        // Catch any file errors
        } catch {
            print("Unable to read the file.")
        }

    } else if programChoice == "q" {
        // Display goodbye message
        print("Thanks for playing!")

    } else {
        // Display error message
        print("Invalid choice. Try again.")
    }

// Keep looping until the user enters 'q'
} while programChoice != "q"
