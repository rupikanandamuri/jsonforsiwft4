//
//  MovieCell.swift
//  Movie
//
//  Created by Rupika on 2019-12-27.
//  Copyright © 2019 Rupika. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var movieTitle : UILabel!
    @IBOutlet var movieRating : UILabel!
    @IBOutlet var releaseDate : UILabel!
    @IBOutlet var gener : UILabel!
    @IBOutlet var movieImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
