#
# Be sure to run `pod lib lint EAModularity.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EABluetooth'
  s.version          = '1.1.15.2'
  s.summary          = 'A short description of EABluetooth.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/EastApex/EASDKTool_iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aye' => 'aye.zhang@qq.com' }
  s.source           = { :git => 'https://github.com/EastApex/EASDKTool_iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'EABluetooth/EABluetooth/Classes/**/*'
  
  s.dependency 'ZipArchive'
  s.dependency 'Protobuf'
  s.dependency 'YYKit'
  s.dependency 'BGFMDB' 
  s.dependency 'SAMKeychain'
  s.dependency 'SVGKit'
  

   s.resource_bundles = {'EAWatchFace' => ['EABluetooth/EAWatchFace.bundle/*']}
  s.ios.vendored_frameworks = 'EABluetooth/EABluetooth.framework'




  
end
