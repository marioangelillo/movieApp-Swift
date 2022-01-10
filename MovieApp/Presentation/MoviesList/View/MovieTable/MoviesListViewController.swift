//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Mario Angelillo on 26/12/2021.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let movieListViewModel: MovieListViewModel = MovieListViewModel()
    let movieDetailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.isHidden = true

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.blue

        movieListViewModel.fetchPopularMovies()
        
        print("resultado77 \(self.movieListViewModel.popularMovies)")
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async() {
            self.tableView.reloadData()
        }
    }

}


extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("resultado78 \(movieListViewModel.popularMovies.count)")
        return movieListViewModel.popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MovieTableViewCell().configureCell(tableView, indexPath: indexPath, for: movieListViewModel.popularMovies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let id = movieListViewModel.popularMovies[indexPath.row].id
//        movieDetailsViewModel.userSelectedItem(id: id, vc: self)
        let movieDetailsVC = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        movieDetailsVC.id = movieListViewModel.popularMovies[indexPath.row].id
        movieDetailsVC.modalPresentationStyle = .fullScreen
        self.present(movieDetailsVC, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        movieListViewModel.animatedCell(cell: cell)
    }
    
    
}
