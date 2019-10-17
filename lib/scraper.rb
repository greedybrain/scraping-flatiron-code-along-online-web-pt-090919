require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page
    html = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    html
  end
  
  def get_courses
    courses = get_page.css('article.post') # avoid the empty ones
    courses
    # binding.pry
  end
  
  def make_courses
    course_instances = get_courses.collect do |course| 
      @title = course.css('h2').text
      # @schedule = course.css('em.date').text
      # @description = course.css('p').text
      # binding.pry
    end
  end
  
end





















