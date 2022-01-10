//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 08/01/2022.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    
    let movieServices: MovieServices = MovieServices()
    
    func fetchMovieDetails(id: String, completionHandler: @escaping (MovieDetails) -> Void) {
        movieServices.getMovieDetails(id: id) { movieDetails in
            completionHandler(MovieDetails(dto: movieDetails))
        } errorHandler: { errorMessage in
            print(errorMessage)
        }
    }
    
}
