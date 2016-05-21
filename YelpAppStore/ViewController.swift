//
//  ViewController.swift
//  YelpAppStore
//
//  Created by student on 5/20/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     var restros = [restaurant]()
    var result = [restaurant]()

    
    @IBOutlet weak var showResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func removeRecord(sender: UIButton) {
        
        //restros.removeAtIndex(3)
        restros.removeAll()
        restros = (NSKeyedUnarchiver.unarchiveObjectWithFile(restaurant.ArchiveURL.path!) as? [restaurant])!
        restros.removeFirst()
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(restros, toFile: restaurant.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
        
        showResult.text = String(restros.count)

    }
    @IBAction func saveData(sender: UIButton) {
        
        var res1 = restaurant(restaurantName: "dosa1 ",restaurantAddress: "san jose1", restaurantRating: 1)!
        var res2 = restaurant(restaurantName: "dosa2 ",restaurantAddress: "san jose2", restaurantRating: 2)!
        var res3 = restaurant(restaurantName: "dosa3 ",restaurantAddress: "san jose3", restaurantRating: 3)!
        var res4 = restaurant(restaurantName: "dosa4 ",restaurantAddress: "san jose4", restaurantRating: 4)!
        var res5 = restaurant(restaurantName: "dosa5 ",restaurantAddress: "san jose5", restaurantRating: 5)!
        var res6 = restaurant(restaurantName: "dosa6 ",restaurantAddress: "san jose6", restaurantRating: 6)!
        
        restros.append(res1)
        restros.append(res2)
        restros.append(res3)
        restros.append(res4)
        restros.append(res5)
        restros.append(res6)
        
        
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(restros, toFile: restaurant.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }

    }

    @IBAction func displayRecord(sender: UIButton) {
       
        result = (NSKeyedUnarchiver.unarchiveObjectWithFile(restaurant.ArchiveURL.path!) as? [restaurant])!
        showResult.text = String(result.count)
        }
    
    
    
    
}

