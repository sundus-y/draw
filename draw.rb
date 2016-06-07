require 'colorize'

pen = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten

obj = [[3,5,1],
       [3,5,1],
       [3,4,5,1],
       [9,4,2,1,4],
       [4,5,6,1],
       [4,6,2,2],
       [4,6,2,2],
       [4,6,2,2],
       [6,3,2,1,6],
       [2,2,6,4],
       [2,2,6,4],
       [3,4,6,1],
       [6,2,7,2],
       [8,2,8,2],
       [3,7,3,7],
       [7,3,7,3],
       [2,7,2,8],
       [8,2,7,3],
       [2,2,2,2,2],
       [2,2,3,5,7]]

render = ''

obj.each do |row|
  blank = false;
  row.each do |col|
    buffer = ''
    if blank
      col.times{buffer<<' '}
      render << buffer
    else
      col.times{buffer<<pen[rand(pen.length)]}
      render << buffer.white
    end
    blank = !blank
  end
  remaining = 20 - row.reduce(:+)
  if remaining > 0
    remaining.times{render<<pen[rand(pen.length)].white}
  end
  render << "\n"
end

puts render