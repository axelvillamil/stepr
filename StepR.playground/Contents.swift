//: StepR is used to measure spaces with your feet when no measuring tape is accessible
//: Applies for barefeet or in socks...need to figure out outter size of sneakers
//: All shoe size data is from www.shoesizingcharts.com
//: Currently the Euro sizing is not completed due to odd sizing ex: 38 = 23.8 or 24.1 and 39 = 24.6 or 25.1
//: By Axel Villamil

import UIKit

//: Dictionaries containing the shoe sizes of women and men in US and UK sizing

var mUS:[Float:Float] = [6:23.5, 6.5:24.1, 7:24.4, 7.5:24.8, 8:25.4, 8.5:25.7, 9:26, 9.5:26.7, 10:27, 10.5:27.3, 11:27.9, 11.5:28.3, 12:28.6, 13:29.4, 14:30.2, 15:31, 16:31.8]

var mUK:[Float:Float] = [5.5:23.5, 6:24.1, 6.5:24.4, 7:24.8, 7.5:25.4, 8:25.7, 8.5:26, 9:26.7, 9.5:27, 10:27.3, 10.5:27.9, 11:28.3, 11.5:28.6, 12.5:29.4, 13.5:30.2, 14.5:31, 15.5:31.8]

var wUS:[Float:Float] = [4:20.8, 4.5:21.3, 5:21.6, 5.5:22.2, 6:22.5, 6.5:23, 7:23.5, 7.5:23.8, 8:24.1, 8.5:24.6, 9:25.1, 9.5:25.4, 10:25.9, 10.5:26.2, 11:26.7, 11.5:27.1, 12:27.6]

var wUK:[Float:Float] = [2:20.8, 2.5:21.3, 3:21.6, 3.5:22.2, 4:22.5, 4.5:23, 5:23.5, 5.5:23.8, 6:24.1, 6.5:24.6, 7:25.1, 7.5:25.4, 8:25.9, 8.5:26.2, 9:26.7, 9.5:27.1, 10:27.6]

/**
 Converts values feet to cm
 */
func feetTocm(feet: Float) -> Float {
    var convertedToCm: Float = 0.0
    let cmPerFeet: Float = 30.48
    convertedToCm = feet * cmPerFeet
    
    return convertedToCm
}

/**
Converts sizes of spaces in feet (ex: 24.5 ft) to footsteps. This provides an approximate measurement for people without tape measures. Not that the users must remove their shoes for the most approximate measurement.
 
 Returns: The number of steps wide and long that someone needs to walk to give them an approximate measurement (converted from a Float to an Int)
*/
func stepCalc(gender: String, sizeType: String, shoeSize: Float, spaceWidth: Float, spaceHeight: Float) -> String  {
    //: **Change back to (Int,Int) for just values
    var stepsWidth:Float = 0
    var stepsHeight:Float = 0
    
    if gender == "M" && sizeType == "US" { //: Uses US sizing for males
        stepsWidth = feetTocm(spaceWidth)/mUS[shoeSize]! //: Uses feetTocm() to convert variable spaceHeight (which is in feet) to cm so it can be calculated with the shoe size
        stepsHeight = feetTocm(spaceHeight)/mUS[shoeSize]!
    } else if gender == "M" && sizeType == "UK" { //: Uses UK sizing for males
        stepsWidth = feetTocm(spaceWidth)/mUK[shoeSize]!
        stepsHeight = feetTocm(spaceHeight)/mUK[shoeSize]!
    } else if gender == "F" && sizeType == "US" { //: Uses US sizing for women
        stepsWidth = feetTocm(spaceWidth)/wUS[shoeSize]!
        stepsHeight = feetTocm(spaceHeight)/wUS[shoeSize]!
    } else if gender == "F" && sizeType == "UK" { //: Uses UK sizing for women
        stepsWidth = feetTocm(spaceWidth)/wUK[shoeSize]!
        stepsHeight = feetTocm(spaceHeight)/wUK[shoeSize]!
    }
    let aproxStepsWidth = Int(stepsWidth)
    let aproxStepsHeight = Int(stepsHeight)
    //:  ** return (aproxStepsWidth, aproxStepsHeight)
    return "You need to walk \(aproxStepsWidth) steps wide and \(aproxStepsHeight) steps long."
}

//: test cases

stepCalc("M", sizeType: "US", shoeSize: 10.5, spaceWidth: 10, spaceHeight: 20)
stepCalc("F", sizeType: "US", shoeSize: 4, spaceWidth: 10.5, spaceHeight: 20)
stepCalc("M", sizeType: "UK", shoeSize: 6, spaceWidth: 10, spaceHeight: 25.5)
stepCalc("F", sizeType: "UK", shoeSize: 8.5, spaceWidth: 100.6, spaceHeight: 22.5)


