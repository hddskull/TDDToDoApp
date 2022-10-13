//
//  TaskCell.swift
//  TDDToDoApp
//
//  Created by Maxim Gladkov on 27.09.2022.
//

import UIKit

class TaskCell: UITableViewCell {    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter
    }
    
    func configure(with task: Task, done: Bool = false) {
        
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [.strikethroughStyle : NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dateLabel = nil
            locationLabel = nil
        } else {
            let date = task.date!
            let dateString = dateFormatter.string(from: date)
            dateLabel.text = dateString
            
            titleLabel.text = task.title
            locationLabel.text = task.location?.name
        }
    }

}
