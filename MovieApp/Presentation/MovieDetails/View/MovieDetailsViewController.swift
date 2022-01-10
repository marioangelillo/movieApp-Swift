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
    
    var id = 0
    let movieDetailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    var movieWithDetails: MovieDetails!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadViewController()
    }
    
}

extension MovieDetailsViewController {
    func loadViewController() {
        self.movieDetailsViewModel.fetchMovieDetails(id: String(self.id)) { movieDetails in
            self.movieWithDetails = movieDetails
        
            DispatchQueue.main.async {
                if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(self.movieWithDetails.posterPath)") {
                    self.movieImage.load(url: imageUrl)
                }
                
                self.movieTitleLabel.text = self.movieWithDetails.title
                self.movieOverviewLabel.text = self.movieWithDetails.overview
                self.movieGenresLabel.text = self.movieWithDetails.genres.map { genre in genre.name }.joined(separator: ", ")
                self.movieAdultLabel.text = self.movieWithDetails.adult ? "Only +18" : "Suitable for all ages"
                self.movieReleaseDateLabel.text = "Release date: \(self.movieWithDetails.releaseDate)"
                self.moviePopularityLabel.text = "Popularity: \(String(self.movieWithDetails.popularity))"
                self.movieBudgetLabel.text = "Budget: $\(String(self.movieWithDetails.budget))"
            }
        }
    }
}
