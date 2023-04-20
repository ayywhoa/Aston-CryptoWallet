//
//  CoinDetailVC.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/19/23.
//

import UIKit

final class CoinDetailVC: UIViewController {
    
    //MARK: - UI Setting
    
    let coinView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let percentageChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.layer.cornerRadius = 25/2
        label.layer.masksToBounds = true
        label.textColor = .green
        label.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        return label
    }()
    
    private let volumeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = .gray
        label.text = Constants.volumeLabel
        return label
    }()
    
    let volumeValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = .gray
        label.text = Constants.rankLabel
        return label
    }()
    
    let rankValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private let dominanceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.dominanceLabel
        return label
    }()
    
    let dominanceValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let allTimeHighLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.allTimeHighLabel
        return label
    }()
    
    let allTimeHighValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let cycleLowLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.cycleLowLabel
        return label
    }()
    
    let cycleLowValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let verticalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let marketcapLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.marketcapLabel
        return label
    }()
    
    let marketcapValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let circulatingSupplyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.supplyLabel
        return label
    }()
    
    let circulatingSupplyValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let projectedMarketcapLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.projectedMarketcapLabel
        return label
    }()
    
    let projectedMarketcapValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let projectedSupplyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.projectedSupplyLabel
        return label
    }()
    
    let projectedSupplyValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let projectedIssueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .gray
        label.textAlignment = .left
        label.text = Constants.projectedIssueLabel
        return label
    }()
    
    let projectedIssueValue: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private func setupView() {
        view.backgroundColor = .black
        
        view.addSubview(coinView)
        coinView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalTo(coinView.snp.trailing).offset(15)
            make.height.equalTo(30)
        }
        
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameLabel.snp.leading)
            make.height.equalTo(25)
        }
        
        view.addSubview(percentageChangeLabel)
        percentageChangeLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.leading.equalTo(priceLabel.snp.leading)
            make.height.equalTo(25)
            make.width.equalTo(100)
        }
        
        view.addSubview(volumeLabel)
        volumeLabel.snp.makeConstraints { make in
            make.top.equalTo(coinView.snp.bottom).offset(35)
            make.leading.equalTo(coinView.snp.leading)
            make.trailing.equalToSuperview().offset(-1 * UIScreen.main.bounds.width / 2 - 20)
            make.height.equalTo(25)
        }
        
        view.addSubview(volumeValue)
        volumeValue.snp.makeConstraints { make in
            make.top.equalTo(volumeLabel.snp.bottom).offset(5)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(rankLabel)
        rankLabel.snp.makeConstraints { make in
            make.top.equalTo(volumeValue.snp.bottom).offset(15)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(rankValue)
        rankValue.snp.makeConstraints { make in
            make.top.equalTo(rankLabel.snp.bottom).offset(5)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(dominanceLabel)
        dominanceLabel.snp.makeConstraints { make in
            make.top.equalTo(rankValue.snp.bottom).offset(15)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(dominanceValue)
        dominanceValue.snp.makeConstraints { make in
            make.top.equalTo(dominanceLabel.snp.bottom).offset(5)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(allTimeHighLabel)
        allTimeHighLabel.snp.makeConstraints { make in
            make.top.equalTo(dominanceValue.snp.bottom).offset(15)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(allTimeHighValue)
        allTimeHighValue.snp.makeConstraints { make in
            make.top.equalTo(allTimeHighLabel.snp.bottom).offset(5)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(cycleLowLabel)
        cycleLowLabel.snp.makeConstraints { make in
            make.top.equalTo(allTimeHighValue.snp.bottom).offset(15)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(cycleLowValue)
        cycleLowValue.snp.makeConstraints { make in
            make.top.equalTo(cycleLowLabel.snp.bottom).offset(5)
            make.leading.equalTo(volumeLabel.snp.leading)
            make.trailing.equalTo(volumeLabel.snp.trailing)
            make.height.equalTo(25)
        }
        
        view.addSubview(verticalLine)
        verticalLine.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.top.equalTo(coinView.snp.bottom).offset(35)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(cycleLowValue.snp.bottom)
        }
        
        view.addSubview(marketcapLabel)
        marketcapLabel.snp.makeConstraints { make in
            make.top.equalTo(coinView.snp.bottom).offset(35)
            make.leading.equalTo(verticalLine.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(15)
            make.height.equalTo(25)
        }
        
        view.addSubview(marketcapValue)
        marketcapValue.snp.makeConstraints { make in
            make.top.equalTo(marketcapLabel.snp.bottom).offset(5)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(circulatingSupplyLabel)
        circulatingSupplyLabel.snp.makeConstraints { make in
            make.top.equalTo(marketcapValue.snp.bottom).offset(15)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(circulatingSupplyValue)
        circulatingSupplyValue.snp.makeConstraints { make in
            make.top.equalTo(circulatingSupplyLabel.snp.bottom).offset(5)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(projectedMarketcapLabel)
        projectedMarketcapLabel.snp.makeConstraints { make in
            make.top.equalTo(circulatingSupplyValue.snp.bottom).offset(15)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(projectedMarketcapValue)
        projectedMarketcapValue.snp.makeConstraints { make in
            make.top.equalTo(projectedMarketcapLabel.snp.bottom).offset(5)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(projectedSupplyLabel)
        projectedSupplyLabel.snp.makeConstraints { make in
            make.top.equalTo(projectedMarketcapValue.snp.bottom).offset(15)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(projectedSupplyValue)
        projectedSupplyValue.snp.makeConstraints { make in
            make.top.equalTo(projectedSupplyLabel.snp.bottom).offset(5)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(projectedIssueLabel)
        projectedIssueLabel.snp.makeConstraints { make in
            make.top.equalTo(projectedSupplyValue.snp.bottom).offset(15)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
        
        view.addSubview(projectedIssueValue)
        projectedIssueValue.snp.makeConstraints { make in
            make.top.equalTo(projectedIssueLabel.snp.bottom).offset(5)
            make.leading.equalTo(marketcapLabel.snp.leading)
            make.trailing.equalToSuperview().offset(20)
            make.height.equalTo(25)
        }
    }
    
    //MARK: - UI Logic
    
    override func viewDidLoad() {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.backButton),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItem?.tintColor = .white
        setupView()
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}
