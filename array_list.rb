require_relative '../data-structures-fixed-array-challenge/fixed_array'
require 'benchmark'

class RArrayList
	attr_reader :list

	BLOCK_SIZE = 10

	def initialize(size)
		@size = size
		@mem_block_size = (1 + @size / BLOCK_SIZE).to_i * BLOCK_SIZE
		@mem_block = FixedArray.new(@mem_block_size)
		@list = @mem_block.array
	end

	def add(element)
		if @size % BLOCK_SIZE == 0
			new_mem_block = FixedArray.new(@size + BLOCK_SIZE)
			new_mem_block = front_fill(@mem_block, new_mem_block)
			@mem_block = new_mem_block
		end
		@size += 1
		self.set(self.length - 1, element)
	end

	def get(index)
		if index < @size
			@mem_block.get(index)
		else
			raise ArgumentError.new("Index out of bounds")
		end
	end

	def set(index, element)
		if index < @size
			set_value = @mem_block.set(index, element)
			@list = @mem_block.array
			set_value
		else
			raise ArgumentError.new("Index out of bounds")
		end
	end

	def length
		@size
	end

	def insert(index, element)
		if index > -1 && index < self.length
			self.add(self.get(self.length - 1))

			i = self.length - 1
			until i <= index
				i -= 1
				self.set(i+1, self.get(i))
			end
			self.set(index, element)
			self.get(index)
		else
			raise ArgumentError.new("Index out of bounds")
		end
	end

private


	# Receives two FixedArrays and returns a single FixedArray
	def front_fill(source, target)
		source.array.each_with_index do |element, index|
			target.set(index, element)
		end
		target
	end

end

#---------------------------------------


class ArrayList
	attr_reader :list

	def initialize(size)
		# @size = (size / 10).to_i * 10
		@mem_block = FixedArray.new(size)
		@list = @mem_block.array
	end

	def add(element)
		# if @size 
		new_mem_block = FixedArray.new(self.length + 1)
		new_mem_block = front_fill(@mem_block, new_mem_block)
		@mem_block = new_mem_block
		self.set(self.length - 1, element)
	end

	def get(index)
		@mem_block.get(index)
	end

	def set(index, element)
		set_value = @mem_block.set(index, element)
		@list = @mem_block.array
		set_value
	end

	def length
		@mem_block.array.length
	end

	def insert(index, element)
		if index > -1 && index < self.length
			self.add(self.get(self.length - 1))

			i = self.length - 1
			until i <= index
				i -= 1
				self.set(i+1, self.get(i))
			end
			self.set(index, element)
			self.get(index)
		else
			raise ArgumentError.new("Index out of bounds")
		end
	end

private


	# Receives two FixedArrays and returns a single FixedArray
	def front_fill(source, target)
		source.array.each_with_index do |element, index|
			target.set(index, element)
		end
		target
	end

end

#------------------------------------------------------------


n = 9999999

Benchmark.bm do |x|
	x.report { al = ArrayList.new(n); al.add(99) }
	x.report { ral = RArrayList.new(n); ral.add(99) }
end
