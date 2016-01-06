#
# Be sure to run `pod lib lint PencilCup.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PencilCup"
  s.version          = "0.1.1"
  s.summary          = "Tools built to help use CoreGraphics more Swiftly"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC

Core Graphics is an amazingly useful library that I work with in every app I build. But I also have spent a lot of time writing lines of code to draw things that are very simple. So I have built a set of tools to add Swift syntax sugar to reduce code footprint and development time.

                       DESC

  s.homepage         = "https://github.com/joalbright/PencilCup"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Jo Albright" => "me@jo2.co" }
  s.source           = { :git => "https://github.com/joalbright/PencilCup.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/joalbright'

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PencilCup' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
