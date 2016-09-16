//
//  FirstViewController.swift
//  Circle
//
//  Created by Zulwiyoza Putra on 9/15/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func addGroupButton(_ sender: AnyObject) {
        addGroup()
    }
    @IBOutlet weak var groupTableView: UITableView!
    
    var groupName: [String] = [
        "Group 1",
        "Group 2",
        "Group 3",
        "Group 4",
        "Group 5"]
    
    func addGroup() -> Void {
        let alert = UIAlertController(title: "Add Group", message: "Please add the name of your group", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField { (groupNameTextField) in
            groupNameTextField.placeholder = "Add Group Name"
        }
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alert.addAction(cancel)
        let ok = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (saveName) -> Void in
            if let newGroupName = alert.textFields?.first {
                self.groupName.insert(newGroupName.text!, at: 0)
                print(self.groupName)
                self.refresh()
            }
        })
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group = groupTableView.dequeueReusableCell(withIdentifier: "Group")
        group?.textLabel?.text = groupName[indexPath.row]
        group?.detailTextLabel?.text = "Last Chat summary \nLast Chat summary"
        group?.imageView?.image = #imageLiteral(resourceName: "group")
        return group!
    }
    
    func refresh(){
        self.groupTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

