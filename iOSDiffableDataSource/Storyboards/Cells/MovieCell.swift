//
//  MovieCell.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 10/1/2021.
//

import UIKit

class MovieCell: UITableViewCell
{

    var movie: Result!
    {
        didSet
        {
            setupData()
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func setupData()
    {
        
    }
}
