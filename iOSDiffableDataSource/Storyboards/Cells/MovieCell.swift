//
//  MovieCell.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 10/1/2021.
//

import UIKit
import SDWebImage

class MovieCell: UITableViewCell
{

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDetailsLabel: UILabel!
    
    var movieObject: Result!
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
        guard let unwrappedMovieName = movieObject.title, let unwrappedMovieDetails = movieObject.resultDescription else { return }
        
        movieNameLabel.text = unwrappedMovieName
        movieDetailsLabel.text = unwrappedMovieDetails
        
        if let unwrappedMovieImage = movieObject.image, let imageURL = URL(string: unwrappedMovieImage)
        {
            movieImageView.activateSdWebImageLoader()
            movieImageView.sd_setImage(with: imageURL, completed: nil)
        }
        else
        {
            movieImageView.image = UIImage(named: "placeholder-image")
        }
    }
}
