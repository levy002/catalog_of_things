require 'json'
require_relative 'data'
require_relative 'label'

class LabelController
  def initialize
    @labels = read_labels
    all_labels = File.read('./book/json_files/label.json')
    File.write('./book/json_files/label.json', []) if all_labels.empty?
  end

  def add_label
    puts 'Please fill the following information:'
    puts ''
    puts 'Title:'
    title = gets.chomp

    puts 'Color:'
    color = gets.chomp
    new_label = Label.new(title, color)
    write_labels(new_label)
    @labels << new_label
    puts 'Label created successfully'
  end

  def labels_list
    if @labels.empty?
      puts 'No labels available!'
    else
      puts
      puts 'The labels list: '
      puts
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: #{label.title} | Color: #{label.color}"
      end
    end
  end
end
