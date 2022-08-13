//
//  RestaurantDiffableDataSource.swift
//  HelloWorldTest
//
//  Created by Ajin on 13/08/22.
//

import UIKit

enum Section{
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    //MARK: - For delete action
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            if let restaurent = self.itemIdentifier(for: indexPath){
                var snapShot = self.snapshot()
                snapShot.deleteItems([restaurent])
                self.apply(snapShot, animatingDifferences: false, completion: nil)
            }
        }
    }
}
