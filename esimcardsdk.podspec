Pod::Spec.new do |s|
  s.name             = 'esimcardsdk'
  s.version          = '0.1.2'
  s.summary          = 'short discription'
  s.homepage         = 'https://github.com/Codiea/ios_esimcard_sdk.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ejaz' => 'ejaz@codiea.io' }
  s.source           = { :git => 'https://github.com/Codiea/ios_esimcard_sdk.git', :tag => s.version.to_s }
  s.ios.deployment_target = '15.0'
  s.source_files     = 'Sources/**/*.swift'
end
