require "spec_helper"

module Filterable
  describe "has default styles defined" do
    it ".btn_classes" do
      expect(Filterable.btn_classes).to eq("btn border flex p-0 text-gray-700 border-gray-300 bg-white shadow-sm focus:ring-gray-500")
    end

    it ".btn_active_classes" do
      expect(Filterable.btn_active_classes).to eq("bg-zinc-50 font-semibold")
    end
  end

  describe "class_methods allow us to generate filters" do
    it ".filterable" do
      expect(User.filterable).to be_a(Filterable::Base)
      expect(User.filterable.all.sort).to eq(User.all.sort)
    end

    it ".filter" do
      user = User.create(name: "myfakeuser")
      User.create(name: "auselessuser")

      expect(User.filter({})).to eq(User.all)
      expect(User.filter({}, base_relation: User.where(name: "myfakeuser"))).to eq([user])
      expect(User.filter({filters: [{column_name: "name", operator: "equal", value: "myfakeuser"}]})).to eq([user])
    end
  end
end
