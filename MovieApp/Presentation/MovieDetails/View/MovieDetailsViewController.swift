//
//  ViewController.swift
//  MovieApp
//
//  Created by Mario Angelillo on 03/01/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieAdultLabel: UILabel!
    @IBOutlet weak var movieReleaseDateLabel: UILabel!
    @IBOutlet weak var moviePopularityLabel: UILabel!
    @IBOutlet weak var movieBudgetLabel: UILabel!
    
    var id: String!
    let viewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    var movieWithDetails: MovieDetails!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getMovieDetails(id: id)
        self.bind()
    }
    
    func bind() {
        self.viewModel.bindMovieDetailsResult = { [weak self] movieDetails in
            DispatchQueue.main.async {
                let imageUrl = "https://image.tmdb.org/t/p/w500\(movieDetails.posterPath)"
                
                self?.movieImage.downloadImage(imageUrl, completion: { image in self?.movieImage.image = image })
                self?.movieTitleLabel.text = movieDetails.title
                self?.movieOverviewLabel.text = movieDetails.overview
                self?.movieGenresLabel.text = movieDetails.genres.map { genre in genre.name }.joined(separator: ", ")
                self?.movieAdultLabel.text = movieDetails.adult ? "Only +18" : "Suitable for all ages"
                self?.movieReleaseDateLabel.text = "Release date: \(movieDetails.releaseDate)"
                self?.moviePopularityLabel.text = "Popularity: \(String(movieDetails.popularity))"
                self?.movieBudgetLabel.text = "Budget: $\(String(movieDetails.budget))"
            }
            
        }
    }

}


