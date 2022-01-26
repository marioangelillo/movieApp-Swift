//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 28/12/2021.
//

import Foundation
import UIKit

class MovieListViewModel {

    let model: MovieListModel = MovieListModel()
    var refreshData = { () -> () in }
    
    var popularMovies: [Movie] = [Movie]() {
        didSet {
            refreshData()
        }
    }
    
    func getPopularMovies() {
        model.getMoviesData { movies in
            self.popularMovies = movies
        } errorHandler: { errorMessage in
            print("Error: \(errorMessage)")
        }
    }
    
    func addToFavorites(movie: Movie) {
        Helper().getFavoriteMovies { movies in
            var favoriteMovies: [Movie] = movies
            favoriteMovies.append(movie)
            Helper().saveFavoriteMovies(movies: favoriteMovies)
        }
    }
    
}

