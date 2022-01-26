//
//  FavoriteMoviesViewModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 18/01/2022.
//

import Foundation

class FavoriteMoviesViewModel {

    var refreshData = { () -> () in }
    
    var favoriteMovies: [Movie] = [Movie]() {
        didSet {
            print("antes refrsh VM")
            refreshData()
            print("dsp refrsh VM")
        }
    }
    
    func getFavMovies() {
        print("getFavMovies VM")
        Helper().getFavoriteMovies { movies in
            print("getFavMovies1 VM")
            self.favoriteMovies = movies
        }
        print("getFavMovies2 VM")
    }
    
    func removeMovie(index: Int) {
        Helper().getFavoriteMovies { movies in
            var favoriteMovies: [Movie] = movies
            favoriteMovies.remove(at: index)
            Helper().saveFavoriteMovies(movies: favoriteMovies)
            self.favoriteMovies = favoriteMovies
        }
    }

}
