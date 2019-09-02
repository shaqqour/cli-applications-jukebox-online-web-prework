#to check if a string is a numeric or not
class String
  def numeric?
    Float(self) != nil rescue false
  end
end

songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index { |song, idx| puts "#{idx+1}. #{song}" }
end

def play(songs)
  puts "Please enter a song name or number: "
  input = gets.strip

  songs_list = {}
  songs.each_with_index { |song, idx| songs_list[idx+1] = song }

  if input.numeric?
    song_number = input.to_i
    if (1..songs.length).include?(song_number)
      puts "Playing #{songs_list[song_number]}"
    else
      puts "Invalid input, please try again"
    end
  else
    if songs.include?(input)
      puts "Playing #{input}"
    else
      puts "Invalid input, please try again"
    end
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  puts "Please enter a command:"
  input = ""
  until input == "exit"
  input = gets.strip
    case input
    when "help"
      help
    when "list"
      list(songs)
    when "play"
      play(songs)
    when "exit"
      exit_jukebox
    else
      puts "Invalid Command"
    end
  end
  exit_jukebox
end