Pod::Spec.new do |s|

s.name             = "DHPopupController"
s.version          = "0.1.3"
s.summary          = "弹出框 "
s.description      = <<-DESC
一个弹出框,需要自定义popupView,使用DHPopupController弹出
DESC
s.homepage         = "https://github.com/duanHuing/DHPopupController.git"
s.license          = 'MIT'

s.author           = { "duan" => "duanbhu@163.com" }
s.source           = { :git => "https://github.com/duanHuing/DHPopupController.git", :tag => s.version  }
s.platform     = :ios, '8.0'
s.source_files = 'DHPopupController/**/*.{h,m}'

end

