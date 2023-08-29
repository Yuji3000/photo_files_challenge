require 'rspec'
require './lib/solution'

RSpec.describe 'solution' do
  it 'returns the correct new names for photos' do
    s = "photo.jpg, Krakow, 2013-09-05 14:08:15
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

    expected_output = "Krakow02.jpg\nLondon1.png\nKrakow01.png\nFlorianopolis2.jpg\nFlorianopolis1.jpg\nLondon2.jpg\nFlorianopolis3.png\nKrakow03.jpg\nKrakow09.png\nKrakow07.jpg\nKrakow06.jpg\nKrakow08.jpg\nKrakow04.png\nKrakow05.png\nKrakow10.jpg"

    expect(solution(s)).to eq(expected_output)
  end

  it 'will return a error response if the photo info is empty in one or more sections' do
    photos = "me.jpg,    , 2013-09-06 15:40:22
    a.png, Krakow, 2016-02-13 13:33:50
    b.jpg, Krakow, 2016-01-02 15:12:22"
    expect(solution(photos)).to eq("photo information is incomplete")
   
    photos = " ,    , 2013-09-06 15:40:22
    a.png, Krakow, 2016-02-13 13:33:50
    b.jpg, Krakow, 2016-01-02 15:12:22"
    expect(solution(photos)).to eq("photo information is incomplete")
  end
end
