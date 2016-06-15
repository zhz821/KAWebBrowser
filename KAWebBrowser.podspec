#
# Be sure to run `pod lib lint KAWebBrowser.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KAWebBrowser'
  s.version          = '0.1.1'
  s.summary          = 'WKWebView with a progressBar'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  KAWebBrowser is a web browser module written in Swift.
  It contains a WKWebView and a progressBar.
                       DESC

  s.homepage         = 'https://github.com/zhz821/KAWebBrowser'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhihuazhang' => 'zhangzhihua.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/zhz821/KAWebBrowser.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/zhz821'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KAWebBrowser/Classes/**/*'

  # s.resource_bundles = {
  #   'KAWebBrowser' => ['KAWebBrowser/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'WebKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
