

Pod::Spec.new do |s|
  
  s.name         = "ZXCycleBannerView"
  s.version      = "1.0.1"
  s.summary      = "无限循环banner(可自定义banner内容)控件"
  s.platform     = :ios, "8.0"

  s.homepage     = "https://github.com/anphen/ZXCycleBannerView"

  s.license      = "MIT"

  s.author       = { "anphen" => "zxlx276@163.com" }

  s.source       = { :git => "https://github.com/anphen/ZXCycleBannerView.git", :tag => "#{s.version}" }

  s.source_files  =  "ZXCycleBannerView/*"

  s.resources = "ZXCycleBannerView/*.png"

  s.dependency "Masonry", "~> 1.1.0"

  s.dependency "YYKit", "~> 1.0.9"

end
