//
//  ViewController.swift
//  LittleKnownFacts
//
//  Created by Isfandyar Ali on 20/08/2016.
//  Copyright © 2016 Isfandyar Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var awesomeFactLabel: UILabel!
    @IBOutlet weak var awesomeFactButton: UIButton!
    let factModel = FactModel()
    
    
    //MARK: UIView Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        awesomeFactLabel.text = factModel.getRandomFact()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //MARK: Actions
    @IBAction func showAwesomeFact() {
        let randomColour = ColourModel().getRandomColour()
        view.backgroundColor = randomColour
        awesomeFactButton.tintColor = randomColour
        awesomeFactLabel.text = factModel.getRandomFact()
    }
    
    //MARK: Helper Methods
    func takeScreenshot() -> UIImage   {
        
        let bounds = UIScreen.mainScreen().bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    @IBAction func shareButtonPressed(sender: UIBarButtonItem) {
        
        let textToShare = "Little Known Facts\n"
        if let itunesURL = NSURL(string: "https://itunes.apple.com/us/app/little-known-facts/id1146166221?mt=8") {
            let screenshotOfFact = takeScreenshot()
            let activityViewController = UIActivityViewController(activityItems: [textToShare, itunesURL, screenshotOfFact], applicationActivities: nil)
            self.presentViewController(activityViewController, animated: true, completion: nil)
            
        }
    }
    
}

