//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Mario Angelillo on 26/12/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitleCell: UILabel!
    @IBOutlet weak var labelDescriptionCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    static private var cellIdentifier: String { "MovieTableViewCell" }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(_ tableView: UITableView, indexPath: IndexPath, for objMovie: Movie) -> MovieTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellIdentifier, for: indexPath) as? MovieTableViewCell 
        
        cell?.labelTitleCell.text = objMovie.title
        cell?.labelDescriptionCell.text = objMovie.overview
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(objMovie.posterPath)") {
            cell?.imageCell.load(url: imageUrl)
        }
        
        return cell ?? MovieTableViewCell()
    }
}

