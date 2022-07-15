//
//  ViewController.swift
//  VK Service
//
//  Created by SergeyK on 14.07.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    let services = Service().getService()
    var images: [UIImage?] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = true
        
        guard services != nil && services?.count ?? 0 >= 1 else{ return }
        for service in services!{
            images.append(UIImage(data: try! Data(contentsOf: URL(string: service.icon_url)!)))
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        services?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TableViewCell
        cell.accessoryView = UIImageView(image: UIImage(named: "icons8-right-24"))
        cell.nameLabel.text = services![indexPath.row].name
        cell.detailTextDescriptionLabel.text = services![indexPath.row].description
        cell.posterImageView.image = images[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: services![indexPath.row].link)!
        UIApplication.shared.open(url)
    }
    
}
