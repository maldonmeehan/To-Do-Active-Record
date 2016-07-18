require('spec_helper.rb')

describe(List) do
  describe(".all") do
    it "starts off empty" do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus Stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
      end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe('.find') do
    it "returns a list id " do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list1.save()
      expect(List.find(list1.id())).to(eq(list1))
    end
  end

  describe("#tasks") do
    it("returns an array of tasks for that list") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      task1 = Task.new({:description => "Learn SQL", :list_id => test_list.id()})
      task1.save()
      task2 = Task.new({:description => "Review Ruby", :list_id => test_list.id()})
      task2.save()
      expect(test_list.tasks()).to(eq([task1, task2]))
    end
  end
end
