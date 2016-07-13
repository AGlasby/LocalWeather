//
//  CityTVC.swift
//  LocalWeather
//
//  Created by Alan on 13/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import UIKit

class CityTVC: UITableViewCell {

    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func configureCell(cityName: String, distance: String) {
        cityNameLbl.text = cityName
        distanceLbl.text = distance
    }
    

}
