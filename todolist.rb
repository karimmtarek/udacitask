class User
  attr_reader :username

  def initialize(username)
    @username = username
  end
end

class TodoList
  attr_reader :user, :title, :items
  attr_writer :title

  def initialize(user, title)
    @user = user
    @title = title
    @items = []
  end

  def add_item(item)
    items << item
  end

  def delete_item(item_id)
    if item_id <= items.size
      items.delete_at(item_id - 1)
    else
      puts "\nPlease enter a valid item number to delete!"
      puts ""
    end
  end

  def complete_item(item_id)
    if item_id <= items.size
      items[item_id - 1].mark
    else
      puts "\nPlease enter a valid item number to update!"
      puts ""
    end
  end

  def update(title:)
    self.title = title
  end

  def print
    puts title_with_username
    puts underline(title_with_username)
    puts display_items
    puts spacer
  end

  def save(file_name: default_file_name)
    File.open(file_name, 'w') do |file|
      file.puts title_with_username
      file.puts underline(title_with_username)
      file.puts display_items
    end
  end

  private

  def display_items
    return "No items found, start adding items to the list..." if items.empty?
    items.each_with_index.map do |item, index|
      "#{index + 1}. #{item}"
    end
  end

  def title_with_username
    "#{user.username}'s #{title}:"
  end

  def underline(title_to_print)
    '-' * title_to_print.length
  end

  def default_file_name
    "#{user.username.downcase}_#{title.downcase.gsub(' ', '_')}.txt"
  end

  def spacer
    ""
  end
end

class Item
  attr_accessor :description, :completed, :created_at, :completed_at

  CHECKMARK = "\u2713".encode('utf-8')
  XMARK = "\u0078".encode('utf-8')

  def initialize(description)
    @description = description
    @completed = false
    @created_at = Time.now
    @completed_at = nil
  end

  def mark
    return not_done if completed?
    done
  end

  def to_s
    "#{description} [#{sign}]#{print_completed_at}"
  end

  private

  def completed?
    completed
  end

  def done
    self.completed = true
    self.completed_at = Time.now
  end

  def not_done
    self.completed = false
    self.completed_at = nil unless completed_at.nil?
  end

  def sign
    return CHECKMARK if completed?
    XMARK
  end

  def print_completed_at
    return if completed_at.nil?
    "(completed at: #{completed_at.strftime("%e %b %Y %H:%M:%S%p")})"
  end
end
