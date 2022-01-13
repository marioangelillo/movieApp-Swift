//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 08/01/2022.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    
    private let model: MovieDetailModel = MovieDetailModel()
    var bindMovieDetailsResult = { (_ movieDetails: MovieDetails) -> () in }
    
    var result: MovieDetails! {
        didSet {
            self.bindMovieDetailsResult(self.result)
        }
    }
    
    func getMovieDetails(id: String) {
        model.getMovieData(id: id) { movieDetails in
            self.result = movieDetails
        } errorHandler: { errorMessage in
            print("Error: \(errorMessage)")
        }

    }
    
}
