def solution(s)

  #Split input string and create hash for each photo
  photos = s.lines.map do |line|
    attributes = line.strip.split(', ')
    {
      name: attributes[0].split('.').first,
      extension: attributes[0].split('.').last,
      city: attributes[1],
      date_time: attributes[2]
    }
  end

  #Group photos by city

  grouped_photos = photos.group_by { |photo| photo[:city] }

  #Sort and assign numbers to photos within each group

  grouped_photos.each do |_city, group|
    group.sort_by! { |photo| photo[:date_time] }
    num_photos = group.size
    num_digits = numH_photos.to_s.length
    group.each_with_index do |photo, index|
      photo[:new_name] = "#{photo[:city]}#{(index + 1).to_s.rjust(num_digits, '0')}.#{photo[:extension]}"
    end
  end

  #Output
  result = photos.map { |photo| photo[:new_name] }.join("\n")
  result
end


string = "photo.jpg, Krakow, 2013-09-05 14:08:15
Mike.png, London, 2015-06-20 15:13:22
myFriends.png, Krakow, 2013-09-05 14:07:13
Eiffel.jpg, Florianopolis, 2015-07-23 08:03:02
pisatower.jpg, Florianopolis, 2015-07-22 23:59:59
BOB.jpg, London, 2015-08-05 00:02:03
notredame.png, Florianopolis, 2015-09-01 12:00:00
me.jpg, Krakow, 2013-09-06 15:40:22
a.png, Krakow, 2016-02-13 13:33:50
b.jpg, Krakow, 2016-01-02 15:12:22
c.jpg, Krakow, 2016-01-02 14:34:30
d.jpg, Krakow, 2016-01-02 15:15:01
e.png, Krakow, 2016-01-02 09:49:09
f.png, Krakow, 2016-01-02 10:55:32
g.jpg, Krakow, 2016-02-29 22:13:11"

puts solution(string)
