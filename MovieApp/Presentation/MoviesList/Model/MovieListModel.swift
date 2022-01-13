//
//  MovieListModel.swift
//  MovieApp
//
//  Created by Mario Angelillo on 13/01/2022.
//

import Foundation

class MovieListModel {
    
    private let service: MovieServices = MovieServices()
    
    func getMoviesData(completionHandler: @escaping MoviesHandler, errorHandler: @escaping ErrorHandler) {
        service.getPopularMovies { pageMovie in
            let moviesData = pageMovie.results.map { dto in Movie(dto: dto) }
            completionHandler(moviesData)
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }

    }
}
