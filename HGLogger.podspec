Pod::Spec.new do |s|
  s.name             = 'HGLogger'
  s.version          = '0.11'
  s.summary          = 'A sample logger with additional information'
 
  s.description      = <<-DESC
    A sample logger with the more debug information in the console.
                       DESC
 
  s.homepage         = 'https://github.com/HardikDG/HGLogger'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hardik DG' => 'hardikdg.sa@gmail.com' }
  s.source           = { :git => 'https://github.com/HardikDG/HGLogger.git',
    :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'HGLogger/HGLogger.swift'
 
end