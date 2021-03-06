require 'test_helper'

describe Mixtape::RandomSongs do
  let(:first_page_songs) do [
    "Cakes Da Killa - Serve It Up",
    "Jamie xx - Gosh",
    "Prurient - Dragonflies to Sew You Up",
    "Jamie xx - Loud Places ft Romy",
    "Galcher Lustwerk - Parlay"
  ] end

  let(:second_page_songs) do [
    "Ziq - XT",
    "Earl Sweatshirt - Grief",
    "Kendrick Lamar - King Kunta",
    "Death Grips - On GP",
    "Lower Dens - Ondine"
  ] end

  let(:third_page_songs) do [
    "Radiohed - fake plastic trees",
    "The Beatles - Julis",
    "The cardigans - My favorite game",
    "The Rolling Stones - Paint in Black",
    "The verve - Lucky Man"
  ] end

  let(:random_songs) do
    sliced_songs = [first_page_songs, second_page_songs, third_page_songs]
    Mixtape::RandomSongs.new(sliced_songs)
  end

  describe "#pick_by" do
    let(:picked_songs) { random_songs.pick_by 2 }

    it "picks 6 songs from the entire list" do
      picked_songs.length.must_equal 6
    end

    it "picks 2 songs from the first section" do
      intersection = picked_songs & first_page_songs
      intersection.length.must_equal 2
    end

    it "picks 2 songs from the second section" do
      intersection = picked_songs & second_page_songs
      intersection.length.must_equal 2
    end

    it "picks 2 songs from the third section" do
      intersection = picked_songs & third_page_songs
      intersection.length.must_equal 2
    end
  end
end
