require_relative 'array_list'

describe RArrayList do

	before do
		# @list = RArrayList.new(4)
		@len = 10
		@list = RArrayList.new(@len)
	end

	describe "#list" do
		it 'initializes to the size requested' do
			expect(@list.list).to eq Array.new((1 + @len / 10).to_i * 10)
		end
	end

	describe "#add" do
		it 'returns the newly added element' do
			expect(@list.add(77)).to eq 77
		end

		it 'adds a new element to the end of the list' do
			@list.add(77)
			expect(@list.get(@list.length - 1)).to eq 77
			expect(@list.length).to eq (@len + 1)
		end
	end

	describe "#set" do
		it 'sets value of an inbounds element' do
			expect(@list.get(1)).to eq nil
			expect(@list.set(1, 99)).to eq 99
			expect(@list.get(1)).to eq 99
		end

		it 'throws an error when the index given is less than zero' do
	  	expect { @list.set(-1, 33) }.to raise_error(ArgumentError, "Index out of bounds")
	  end

	  it 'throws an error when the index given is greater than size' do
	  	expect { @list.set(@list.length, 44) }.to raise_error(ArgumentError, "Index out of bounds")
	  end

	end

	describe "#get" do
		it 'returns value of an inbounds element' do
			expect(@list.get(1)).to eq nil
		end

	  it 'throws an error for an out-of-bounds element' do
	  	expect { @list.get(@list.length) }.to raise_error(ArgumentError, "Index out of bounds")
	  end
	end

	describe "#length" do
		it 'returns the length of the array list' do
			expect(@list.length).to eq @len
		end
	end

	describe "#insert" do

		it 'returns the value of the inserted element' do
			expect(@list.insert(3, 88)).to eq 88
		end

		it 'inserts an element into the list at the given index' do
			@list.insert(3, 88)
			expect(@list.get(2)).to eq nil
			expect(@list.get(3)).to eq 88
			expect(@list.get(4)).to eq nil
			expect(@list.length).to eq (@len + 1)
		end

		it 'throws an out-of-bounds error if there is no item at the given index' do
			expect { @list.insert(@len, 88) }.to raise_error(ArgumentError, "Index out of bounds")
		end
	end

end


describe ArrayList do

	before do
		@list = ArrayList.new(4)
	end

	describe "#list" do
		it 'initializes to the size requested' do
			expect(@list.list).to eq [nil, nil, nil, nil]
		end
	end

	describe "#add" do
		it 'returns the newly added element' do
			expect(@list.add(77)).to eq 77
		end

		it 'adds a new element to the end of the list' do
			@list.add(77)
			expect(@list.list).to eq [nil, nil, nil, nil, 77]
		end
	end

	describe "#set" do
		it 'sets value of an inbounds element' do
			expect(@list.get(1)).to eq nil
			expect(@list.set(1, 99)).to eq 99
			expect(@list.get(1)).to eq 99
		end

		it 'throws an error when the index given is less than zero' do
	  	expect { @list.set(-1, 33) }.to raise_error(ArgumentError, "Index out of bounds")
	  end

	  it 'throws an error when the index given is greater than size' do
	  	expect { @list.set(4, 44) }.to raise_error(ArgumentError, "Index out of bounds")
	  end

	end

	describe "#get" do
		it 'returns value of an inbounds element' do
			expect(@list.get(1)).to eq nil
		end

	  it 'throws an error for an out-of-bounds element' do
	  	expect { @list.get(4) }.to raise_error(ArgumentError, "Index out of bounds")
	  end
	end

	describe "#length" do
		it 'returns the length of the array list' do
			expect(@list.length).to eq 4
		end
	end

	describe "#insert" do

		it 'returns the value of the inserted element' do
			expect(@list.insert(3, 88)).to eq 88
		end

		it 'inserts an element into the list at the given index' do
			@list.insert(3, 88)
			expect(@list.list).to eq [nil, nil, nil, 88, nil]
		end

		it 'throws an out-of-bounds error if there is no item at the given index' do
			expect { @list.insert(4, 88) }.to raise_error(ArgumentError, "Index out of bounds")
		end
	end

end
