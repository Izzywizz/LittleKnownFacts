//
//  FactModel.swift
//  LittleKnownFacts
//
//  Created by Isfandyar Ali on 24/08/2016.
//  Copyright © 2016 Isfandyar Ali. All rights reserved.
//

import GameKit

struct FactModel {
    
    let facts = FactModel.linesFromResource("Facts.txt")
    
    /** 
    A Method that returns a random fact from our data model array
    - returns: String
    */
    func getRandomFact() -> String  {
        let randomNumber = GKRandomSource.sharedRandom().nextIntWithUpperBound(facts.count)
        return facts[randomNumber]
    }
    
    /**
     Reading information from a text a text file and returning it as a String array, each entry within the array has the indivudal fact.
     The information within the text file is separated by new line '\n'.
     - parameter filename: String representation of file with extension included, example "Facts.txt"
     - returns: A new array with all the data from a text file
     */
    static func linesFromResource(fileName: String) -> [String] {
        guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: nil) else {
            fatalError("Resource file for \(fileName) not found.")
        }
        do {
            let content = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return content.componentsSeparatedByString("\n")
        } catch let error {
            fatalError("Could not load strings from \(path): \(error).")
        }
    }
}