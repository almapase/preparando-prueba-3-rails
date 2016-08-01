require 'test_helper'

class SightingsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @sighting = sightings(:one)
    @pokemon = pokemons(:ratata)
  end

  test "should get index" do
    get :index, pokemon_id: @pokemon
    assert_response :success
    assert_not_nil assigns(:sightings)
  end

  test "should get new" do
    get :new, pokemon_id: @pokemon
    assert_response :success
  end

  test "should create sighting" do
    assert_difference('Sighting.count') do
      post :create, pokemon_id: @pokemon, sighting: { information: @sighting.information, picture: @sighting.picture, pokemon_id: @sighting.pokemon_id }
    end

    assert_redirected_to pokemon_sighting_path(assigns(:sighting))
  end

  test "should show sighting" do
    get :show, pokemon_id: @pokemon, id: @sighting
    assert_response :success
  end

  test "should get edit" do
    get :edit, pokemon_id: @pokemon, id: @sighting
    assert_response :success
  end

  test "should update sighting" do
    patch :update, [@pokemon, @sighting], sighting: { information: @sighting.information, picture: @sighting.picture, pokemon_id: @sighting.pokemon_id }
    assert_redirected_to sighting_path(assigns(:sighting))
  end

  test "should destroy sighting" do
    assert_difference('Sighting.count', -1) do
      delete :destroy, pokemon_id: @pokemon, id: @sighting
    end

    assert_redirected_to pokemons_path
  end
end
