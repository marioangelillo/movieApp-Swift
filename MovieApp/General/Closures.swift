//
//  Closures.swift
//  MovieApp
//
//  Created by Mario Angelillo on 30/12/2021.
//

import Foundation

typealias ResultMoviesHandler = (_ pageMovie: PageMovieDTO?) -> Void
typealias ResultDetailsMovieHandler = (_ movieDetails: MovieDetailsDTO) -> Void
typealias ErrorHandler = (_ errorMessage: String) -> Void
