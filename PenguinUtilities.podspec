Pod::Spec.new do |s|
  s.name             = 'PenguinUtilities'
  s.version          = '1.0.0-dev'
  s.summary          = 'A short description of PenguinCore.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/resie001/PenguinCore'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ade Resie' => 'chevalier@resie.id' }
  s.source           = { :git => 'https://github.com/resie001/PenguinCore.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.swift_version         = '5.0'
  
  s.source_files = 'PenguinCore/Classes/PenguinUtilities/Sources/**/*.{swift}'
  
  s.subspec 'Assets' do |sp|
    sp.source_files = [
      'PenguinCore/Classes/PenguinUtilities/Assets/**/*',
      'PenguinCore/Classes/PenguinUtilities/Assets/**/*.swift'
    ]
    
    sp.resources = 'PenguinCore/Classes/PenguinUtilities/Sources/**/*.{json,xcassets,png,jpg,jpeg,ttf}'
    
    sp.resource_bundles = {
      'PenguinFontResource' => ['PenguinCore/Classes/PenguinUtilities/Sources/Assets/Poppins/**/*.{ttf}']
    }
  end
end
