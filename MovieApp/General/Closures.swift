//
//  Closures.swift
//  MovieApp
//
//  Created by Mario Angelillo on 30/12/2021.
//

import Foundation

typealias ResultMoviesHandler = (_ pageMovie: PageMovieDTO) -> Void
typealias MoviesHandler = (_ movies: [Movie]) -> Void

typealias ResultDetailsMovieHandler = (_ movieDetailsDTO: MovieDetailsDTO) -> Void
typealias DetailMovieHandler = (_ MovieDetails: MovieDetails) -> Void

typealias ErrorHandler = (_ errorMessage: String) -> Void


