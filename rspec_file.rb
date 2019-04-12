require 'rspec'
require_relative "../jsonParsh/simple.rb"

describe Parser do
	let(:parser) { Parser.top_headlines('us') }

=begin
	shared_examples "exist file"  do 
		it 'should exist JSON file' do
			expect(File.exist? 'responseFile.json').to eq(true)
		end
	end
=end
 # don't work

	it 'should be instance of Parser class' do
		expect(parser).to be_a(Parser) 
	end

	describe '#top_headlines' do
			it 'should save response to api_response var' do
			expect(parser.api_response).not_to be_nil
		end
	end

	describe '#write_file' do
		it 'should write to file' do
			parser.write_file
			expect(File.exist? 'responseFile.json').to eq(true)
			# it_behaves_like "exist File"
		end
	end

	describe '#read_file' do
			it 'should read from file' do
			parser.read_file
			expect(File.exist? 'responseFile.json').to eq(true)
		end
	end
end
