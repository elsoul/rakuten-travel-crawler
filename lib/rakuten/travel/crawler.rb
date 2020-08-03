require "rakuten/travel/crawler/version"
require "rakuten/travel/crawler/api"
require "rakuten/travel/crawler/console"
require "rakuten/travel/crawler/web"
require "selenium-webdriver"
require "net/http"

module Rakuten
  module Travel
    module Crawler
      class Error < StandardError; end

      def self.get_selenium_driver mode: :chrome
        case mode
        when :firefox_remote_capabilities
          firefox_capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
          Selenium::WebDriver.for(:remote, url: "http://hub:4444/wd/hub", desired_capabilities: firefox_capabilities)
        when :firefox
          Selenium::WebDriver.for :firefox
        else
          options = Selenium::WebDriver::Chrome::Options.new
          options.add_argument("--ignore-certificate-errors")
          options.add_argument("--disable-popup-blocking")
          options.add_argument("--disable-translate")
          options.add_argument("-headless")
          Selenium::WebDriver.for :chrome, options: options
        end
      end
    end
  end
end
