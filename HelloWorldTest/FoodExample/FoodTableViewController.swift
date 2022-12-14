//
//  FoodTableViewController.swift
//  HelloWorldTest
//
//  Created by Ajin on 12/08/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    
    
    var restaurent = RestaurantData()
                           
    
    
        
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = dataSource
        var snapShot = NSDiffableDataSourceSnapshot<Section, Restaurant>()
        snapShot.appendSections([.all])
        snapShot.appendItems(restaurent.restaurants, toSection:.all)
        dataSource.apply(snapShot, animatingDifferences: false, completion: nil)
        
        
        // no lines between the row
        //tableView.separatorStyle = .none
        
        //large Title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }

    // MARK: - Table view data source

    func configureDataSource() -> UITableViewDiffableDataSource<Section, Restaurant>{
        
        let identifier = "foodCell"
        let identifier2 = "favCell"
        let dataSource = RestaurantDiffableDataSource(tableView: tableView, cellProvider: { tableView,indexPath,restaurants in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FoodTableViewCell
            cell.nameLabel.text = restaurants.name
            cell.thumbnailImageView.image = UIImage(named: restaurants.image)
            cell.locationLabel.text = restaurants.location
            cell.typeLabel.text = restaurants.type
            cell.favouriteImageView.isHidden = restaurants.isFavorite
            //print(restaurants.isFavorite)
            return cell
        })
        
        return dataSource
        
    }
    
    //MARK: - elements in swipe action
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard let restuarent = self.dataSource.itemIdentifier(for: indexPath)
        else{
            return UISwipeActionsConfiguration()
        }
        
        //deleting the row
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completion) in
            var snapShot = self.dataSource.snapshot()
            snapShot.deleteItems([restuarent])
            self.dataSource.apply(snapShot, animatingDifferences: false, completion: nil)
            
            completion(true)
        }
        
        //sharing the item
        //MARK: - activity controller for sharing and all
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completion) in
            let defaultText = "Selected text name " + restuarent.name
            
            var activityAlertController : UIActivityViewController
            
            //add the data so that it can be shared or copied to clipboard etc..
            if let image = UIImage(named: restuarent.image){
                activityAlertController = UIActivityViewController(activityItems: [defaultText,image], applicationActivities: nil)
            }else{
                activityAlertController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
           
            //MARK: - alerts in iPAD, popover controller
            //pop over controler is required in ipad
            // need to anchor the popover at a place
            if let popoverController = activityAlertController.popoverPresentationController{
                if let cell = self.tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityAlertController, animated: true, completion: nil)
            
        }
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        deleteAction.image = UIImage(systemName: "trash")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [shareAction,deleteAction])
        return swipeConfiguration
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        restaurent.restaurants[indexPath.row].isFavorite = !restaurent.restaurants[indexPath.row].isFavorite
        var cell = tableView.cellForRow(at: indexPath) as! FoodTableViewCell
        cell.favouriteImageView.isHidden = !cell.favouriteImageView.isHidden
        //tableView.reloadData()
    }
     */
     
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    */
    
    
    /*
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
     */
     
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toDetailScreen"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationVC = segue.destination as! RestaurentDetailViewController
                destinationVC.restaurent = self.restaurent.restaurants[indexPath.row]
            }
        }
        
    }
    

}
