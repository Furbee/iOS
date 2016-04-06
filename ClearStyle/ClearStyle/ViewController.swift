//
//  ViewController.swift
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
                            
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems = [ToDoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.separatorStyle = .None
        tableView.rowHeight = 50.0
        
        if toDoItems.count > 0 {
            return
        }
        toDoItems.append(ToDoItem(text: "Korv med bröd"))
    }
    
    //Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }

    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> TableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
                as! TableViewCell
            cell.textLabel?.backgroundColor = UIColor.clearColor()
            //let item = toDoItems[indexPath.row]
            //cell.textLabel?.text = item.text
            return cell
    }

    //Table view delegate
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = toDoItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                   forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }

}

