//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBAction func SearchButton(_ sender: Any) {
        print(input)
        movies.fetchMovies(query: input)
    }
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var MovieListTableView: UITableView!
    
    var input: String {
        return SearchBar.text ?? ""
    }
    
    
    var movies: MoviesViewModel = MoviesViewModel()
    
    override func viewDidLoad() {
                
        configureTableView()
        configureVM()
    }
    
    func configureTableView() {
        MovieListTableView.dataSource = self
        MovieListTableView.delegate = self
        
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        
        
        MovieListTableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    
    func configureVM() {
        let completion = {
            self.reloadTable()
        }
        
        movies.bind(completion: completion)
    }
    
    func reloadTable() {
        MovieListTableView.reloadData()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { fatalError() }
        
        cell.movie = movies.movies[indexPath.row]
        
        cell.updateLabels()
        
        return cell
    }
    
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        guard let movieDetailsVC = storyboard?.instantiateViewController(identifier: "MovieDetailViewController") as? MovieDetailViewController else {
            return
        }
        
        let movie = movies.movies[indexPath.row]
        let detailsVM = DetailsViewModel(movie: movie)
        movieDetailsVC.detailsVM = detailsVM
        
        navigationController?.pushViewController(movieDetailsVC, animated: true)
    }
}


