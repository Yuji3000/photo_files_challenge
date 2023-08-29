def split_input(s)
  s.split("\n").map do |line|
    line.split(", ")
  end
end

def check_empty(photo)
  photo.any? do |section|
    section.strip.empty?
  end
end

def sort_by_datetime(city_hash)
  city_hash.each do |city, photo_array|
    photo_array.sort_by! { |photo| photo[:datetime] }
  end
end

def set_new_names(city_hash)
  names_array = []
  
  city_hash.each do |city_name, city_photos|
    max_digits = city_photos.length.to_s.length
    
    city_photos.each_with_index do |photo, index|
      photo_num = (index + 1).to_s.rjust(max_digits, "0")
      extension = photo[:name].split(".").last
      position = photo[:position]
      new_name = "#{city_name}#{photo_num}.#{extension},#{position}"
      names_array << new_name
    end
  end
  return names_array
end

def add_position(names_array)
  photo_names_w_position = []
  names_array.each do |name|
    photo_name, position = name
    photo_names_w_position << name
  end
  return photo_names_w_position
end


def solution(m)
  photo_array = split_input(m)

  city_hash = Hash.new { |hash, key| hash[key] = [] }
  
  photo_array.each_with_index do |photo, index|
    photo_name, city_name, datetime = photo
    check_empty = check_empty(photo)
    if check_empty == true
      return "photo information is incomplete"
    else
      city_hash[city_name] << { name: photo_name, datetime: datetime, position: index }
    end
  end

  sort_by_datetime(city_hash)
  names_array = set_new_names(city_hash)
  photo_names_w_position = add_position(names_array)

  sorted_array = photo_names_w_position.sort_by! do |element|
    number = element.split(",")[1].to_i
    number
  end

  final_name_array = sorted_array.map do |photo|
    photo_name = photo.split(",")[0]
    photo_name
  end

  final_name_array.join("\n")
end
