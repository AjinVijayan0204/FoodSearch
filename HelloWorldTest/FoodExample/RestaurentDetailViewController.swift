//
//  RestaurentDetailViewController.swift
//  HelloWorldTest
//
//  Created by Ajin on 13/08/22.
//

import UIKit

class RestaurentDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    

    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurentDetailHeaderView!
    
    
    var restaurent: Restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //restaurentImageView.image = UIImage(named: restaurentImageName)
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        headerView.nameLabel.text = restaurent.name
        headerView.typeLabel.text = restaurent.type
        headerView.headerImageView.image = UIImage(named: restaurent.image)
        
        let heartImage = restaurent.isFavorite ? "heart.fill" : "heart"
        headerView.heartButton.setImage(UIImage(systemName: heartImage), for: .normal)
        
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RestaurentDetailViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurentDetailsTextCell") as! RestaurentDetailTextCell
            cell.descriptionLabel.text = restaurent.description
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurentDetailTwoCell") as! RestaurentDetailTwoCell
            cell.column1TitleLabel.text = "Address"
            cell.column1TextLabel.text = restaurent.location
            cell.column2TitleLabel.text = "Phone Number"
            cell.column2textLabel.text = restaurent.phone
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurentDetailMapCell") as! RestaurentDetaillMapCell
            cell.configure(location: restaurent.location)
            cell.selectionStyle = .none
            return cell
            
        default:
            fatalError("Cell error")
        }
    }
    
}
