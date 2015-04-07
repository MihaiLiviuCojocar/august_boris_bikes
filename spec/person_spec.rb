require 'person'

describe Person do
  let(:person)           { Person.new             }
  let(:person_with_bike) { Person.new(bike: bike) }
  let(:bike)             { double :bike           }
  let(:old_street)       { double :station        }

  it 'has no bike' do
    expect(person.has_bike?).to be false
  end

  it 'can have a bike' do
   person = Person.new(:bike => :banana)
   expect(person).to have_bike
  end

  it 'can rent a bike from a station' do
    expect(old_street).to receive(:release_a_bike).and_return(bike)

    person.rent_bike_from old_street	
  end

  it 'has a bike after renting one' do
    allow(old_street).to receive(:release_a_bike).and_return(bike)

    person.rent_bike_from old_street	

    expect(person).to have_bike		
  end

  it 'can return a bike to a station' do
    expect(old_street).to receive(:dock).with(bike)

    person_with_bike.return_bike_to old_street
  end

  it 'has no bike after returning it' do
    allow(old_street).to receive(:dock).with(bike)	

    person_with_bike.return_bike_to old_street

    expect(person_with_bike).not_to have_bike
  end

  it 'can break a bike' do
    expect(bike).to receive(:break!)

    person_with_bike.have_accident!
  end
end
