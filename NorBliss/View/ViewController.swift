//
//  ViewController.swift
//  NorBliss
//
//  Created by MacBook on 6/8/19.
//  Copyright © 2019 DOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MovieTableViewCell {
            cell.aMovieModel = AMovieViewModel(with: viewModel.movies[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController()
        detail.cardDetails = AMovieViewModel(with: self.viewModel.movies[indexPath.row])
        self.navigationController?.pushViewController(detail, animated: true)
    }

    var viewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        viewModel.fetchMoviesList {
            DispatchQueue.main.sync(execute: {
//                self.viewModel.movies = self.viewModel.searchMovies("Hulk")
                self.tableView.reloadData()
            })
        }
    }
}

