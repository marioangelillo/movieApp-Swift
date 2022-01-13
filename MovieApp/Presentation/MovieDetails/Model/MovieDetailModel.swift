//
//  MovieDetailModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 13/01/2022.
//

import Foundation

class MovieDetailModel {
    
    private let service = MovieServices()
    
    func getMovieData(id: String, completionHandler: @escaping DetailMovieHandler, errorHandler: @escaping ErrorHandler) {
        service.getMovieDetails(id: id) { movieDetailsDTO in
            let movieData = MovieDetails(dto: movieDetailsDTO)
            completionHandler(movieData)
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
    
}
