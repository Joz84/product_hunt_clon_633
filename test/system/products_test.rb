require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  # vérifier que le user est bien logger
  # cliquer sur un bouton pour arriver sur la page new (changer d'url)
  # Remplir le champ de formulaire name
  # Remplir le champ de formulaire tagline
  # Cliquer sur le bouton valider
  # Etre rediriger sur la page index
  # Vérifier que dans l'index on a bien une card avec la tagline

  test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/products/new"
    # save_and_open_screenshot

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    # save_and_open_screenshot

    click_on 'Create Product'
    # save_and_open_screenshot

    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert_text "Change your life: Learn to code"
  end


end
