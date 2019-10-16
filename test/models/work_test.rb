require "test_helper"

describe Work do

  describe 'validations' do 
    it 'is valid when all fields are present' do
      work = works(:cats)
      result = work.valid?
      expect(result).must_equal true
    end

    it 'is invalid without a title' do
      work = works(:cats)
      work.title = nil
      result = work.valid?
      expect(result).must_equal false
    end

    it 'is invalid without a creator' do
      work = works(:cats)
      work.creator = nil
      result = work.valid?
      expect(result).must_equal false
    end

    it 'is invalid if title is not unique' do
      work = works(:cats)
      work.title = "Fiddler on the Roof"
      result = work.valid?
      expect(result).must_equal false
    end


  end

  describe 'relations' do
    
  end

  describe 'custom methods' do

    describe 'top_ten' do
      it 'returns ten books' do #later will return top ten books
        test_list = Work.top_ten("album")
        expect(test_list.count).must_equal 10
      end

      it 'returns all items if there are less than ten in the database' do 
        test_list = Work.top_ten("book")
        expect(test_list.count).must_equal 2
      end

      it "returns an empty array if there are no works in that category" do 
        test_list = Work.top_ten("movie")
        expect(test_list).must_equal []
      end

    end
  end
  

end
