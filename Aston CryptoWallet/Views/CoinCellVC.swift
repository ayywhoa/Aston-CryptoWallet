//
//  CoinCellVC.swift
//  Aston CryptoWallet
//
//  Created by Semyon Semyonov on 3/28/23.
//

import UIKit

final class CoinCellVC: UITableViewCell {
    
    //MARK: - UI Setting
    
    let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let coinView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let marketCapLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let percentageChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView() {
        contentView.backgroundColor = .black
        
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(40)
        }
        
        contentView.addSubview(coinView)
        coinView.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(10)
            make.top.equalTo(contentView.snp.top).offset(15)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15)
            make.width.equalTo(coinView.snp.height)
        }
        
        contentView.addSubview(symbolLabel)
        symbolLabel.snp.makeConstraints { make in
            make.leading.equalTo(coinView.snp.trailing).offset(10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        
        contentView.addSubview(marketCapLabel)
        marketCapLabel.snp.makeConstraints { make in
            make.leading.equalTo(coinView.snp.trailing).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
        
        contentView.addSubview(percentageChangeLabel)
        percentageChangeLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.height.equalTo(30)
            make.width.equalTo(60)
            make.centerY.equalTo(contentView.snp.centerY)
        }
        
        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(percentageChangeLabel.snp.leading).offset(-20)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    //MARK: - UI Logic
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
