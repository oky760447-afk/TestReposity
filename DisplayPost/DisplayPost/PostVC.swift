//
//  ViewController.swift
//  DisplayPost
//
//  Created by macOS15 on 14/12/25.
//

import UIKit

class PostVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as? PostCell else {return UITableViewCell()}
        cell.setUpView(post: posts[indexPath.row])
        return cell
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    var posts : [Post] = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isHidden = true
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        
        getPost()
      
    }
    //https://jsonplaceholder.typicode.com/posts
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let postData = try? JSONDecoder().decode([Post].self, from: data) {
                    print("JSON DATA",postData)
                    self.posts = postData
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.activityIndicatorView.stopAnimating()
                        self.tableView.isHidden = false
                    }
                }
                
            }
        }.resume()
        
        
        
    }
}

extension PostVC : UITableViewDelegate , UITableViewDataSource{
    func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
        <#code#>
    }
}
