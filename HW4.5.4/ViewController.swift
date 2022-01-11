//
//  ViewController.swift
//  HW4.5.4
//
//  Created by Azamat Sarinzhiev on 11/1/22.
//

import UIKit
import SnapKit
import Kingfisher
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var news: [NewsletterModel] = []
    var articles: [Articles] = []
    

    private lazy var tableView1 : UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    struct Cells{
        static let customCell = "CustomCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView1)
        tableView1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        setupViews()
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView1.dequeueReusableCell(withIdentifier: Cells.customCell) as! CustomCell
        let model = articles[indexPath.row]
        cell.label1.text = model.title!
        cell.label2.text = model.description!
        
        let url = URL(string: model.urlToImage ?? "")
        
        cell.imageView1.kf.setImage(with: url!)
        return cell
    }
    func downloadJSon(comleted: @escaping([Articles]) -> ()) {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?language=ru&apiKey=37c24cd29815413593bb9c9c942cd59f")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                    var response = try JSONDecoder().decode(NewsletterModel.self, from: data!)
                    DispatchQueue.main.async {
                        comleted(response.list)
                    }
                } catch {
                    print("JSon Error")
                }
            }
        } .resume()
    }
    
    private func setupViews(){
        tableView1.register(CustomCell.self, forCellReuseIdentifier: Cells.customCell)
        
        downloadJSon { data in
            self.articles = data
            self.tableView1.reloadData()
        }
    }
    
}

