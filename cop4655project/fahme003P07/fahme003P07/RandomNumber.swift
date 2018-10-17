//
//  RandomNumber.swift
//  fahme003P07
//
//  Created by sergio e diaz on 10/15/18.
//  Copyright © 2018 fahme003P03. All rights reserved.
//

import Foundation
import UIKit

final class RandomNumber {
    
    static let sharedInstance = RandomNumber ()
    
    var numberTable = [Int]()
    
    private init () {
        
    }
    
    func  MakeRandomNumbers() -> Int
    {
        let randomNum:UInt32 = arc4random_uniform(100)
        let number: Int = Int(randomNum)
        return number
    }
    
    func createTable()
    {
        //let randomNumber = MakeRandomNumbers()
        
        for _ in 1...10 {
            numberTable.append(MakeRandomNumbers())
        }
    }
    
    @discardableResult func createNumber() -> Int {
        let newNumber = MakeRandomNumbers()
        
        numberTable.append(newNumber)
        
        return newNumber
    }
    
    func removeItem(_ number: Int)
    {
        if let index = numberTable.index(of: number)
        {
            numberTable.remove(at: index)
        }
    }
}
