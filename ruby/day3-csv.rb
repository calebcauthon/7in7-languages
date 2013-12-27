#---
# Excerpted from "Seven Languages in Seven Weeks",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end

    def each
      @csv_contents.collect do |this_row|
        csv_row = CsvRow.new(this_row, @headers)
      end.each do |this_csv_row|
        yield this_csv_row
      end
    end

  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  def initialize(row, headers)
    @row = row
    @headers = headers
  end

  def get_header_index_of header 
    @headers.each_with_index do |this_header, index|
      return index if this_header == header
    end
  end

  def method_missing method, *arguments, &block
    if @headers.include? method.to_s
      return @row[get_header_index_of(method.to_s)]
    end
    super
  end
end

csv = RubyCsv.new
csv.each {|row| puts row.one}


