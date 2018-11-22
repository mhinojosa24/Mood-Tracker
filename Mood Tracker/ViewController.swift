//
//  ViewController.swift
//  Mood Tracker
//
//  Created by Maximo Hinojosa on 11/20/18.
//  Copyright © 2018 Maximo Hinojosa. All rights reserved.
//

import UIKit
import UIKit.UIColor


class ViewController: UIViewController {
    // a list of mood
    var entries: [MoodEntry] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry]
        tableView.reloadData()
    }
}

    
    // every mood entry has a different type of mood
    struct MoodEntry {
        var mood: Mood
        var date: Date
        
        enum Mood: Int {
            case none
            case amazing
            case good
            case neutral
            case bad
            case terrible
            
            var stringValue: String {
                switch self {
                case .none:
                    return ""
                case .amazing:
                    return "Amazing"
                case .good:
                    return "Good"
                case .neutral:
                    return "Neutral"
                case .bad:
                    return "Bad"
                case .terrible:
                    return "Terrible"
                }
            }
            
            var colorValue: UIColor {
                switch self {
                case .none:
                    return .clear
                case .amazing:
                    return .green
                case .good:
                    return .blue
                case .neutral:
                    return .gray
                case .bad:
                    return .orange
                case .terrible:
                    return .red
                }
            }
        }
        
}
    
    
    
    


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood entry cell", for: indexPath) as! MoodEntryTableViewCell
        
        let entry = entries[indexPath.row]
        cell.labelMoodTitle.text = entry.mood.stringValue
        cell.imageViewMoodColor.backgroundColor = entry.mood.colorValue
        cell.detailTextLabel?.text = String(describing: entry.date)
        
        return cell
        
    }
    
}
