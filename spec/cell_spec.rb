require 'rspec'
require './lib/cell'
describe "Cell" do
  let (:cell) do
    Cell.new
  end

  describe "#initialize" do

    it 'accepts state' do
      cell = Cell.new(state: :live)
      expect( cell.state ).to eq( :live )
    end

    it 'defaults state to :dead' do
      expect( cell.state ).to eq( :dead )
    end
  end

  describe "#next_state" do
    context "state is :dead" do
      before { expect( cell.state ).to eq( :dead ) }
      context "passed surrounding cell count of 3" do
        it "returns :live" do
          expect( cell.next_state(3) ).to eq( :live )
        end
        it "sets state to :live" do
          cell.next_state(3)
          expect( cell.state ).to eq( :live )
        end
      end
      context "state is :live" do
        before { cell.state = :live }
        context "0-1 ive neighbours" do
          it "returns :dead" do
            1.times do |i|
              expect( cell.next_state(i) ).to eq( :dead )
            end
          end
          it "sets state to :dead" do
            1.times do |i|
              cell.next_state(i)
              expect( cell.state ).to eq( :dead )
            end
          end
        end
        context "2 live neighbours" do
          it "returns :live" do
            expect( cell.next_state(2) ).to eq( :live )
          end
          it "state remains :live" do
            cell.next_state(2)
            expect( cell.state ).to eq( :live )
          end
        end
      end
    end
  end

  describe "#alive?" do
    context "state is :live" do
      before { cell.state = :live }
      it "is true" do
        expect(cell.alive?).to eq(true)
      end
    end

    context "state is :dead" do
      before { cell.state = :dead }
      it "is false" do
        expect(cell.alive?).to eq(false)
      end
    end
  end
end
