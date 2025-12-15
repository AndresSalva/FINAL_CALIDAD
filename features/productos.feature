Feature: Catálogo de productos en SauceDemo
  Como usuario logueado
  Quiero validar y gestionar productos del catálogo
  Para asegurar que la información sea correcta y el ordenamiento funcione

  Background:
    Given estoy logueado en SauceDemo

  Scenario: Ver que el catálogo carga
    Then debería ver el título "Products"
    And debería ver el producto "Sauce Labs Backpack"

  Scenario Outline: Validar información del producto en el catálogo
    Then el producto "<producto>" debería mostrar el precio "<precio>"
    And el producto "<producto>" debería mostrar la descripción "<descripcion>"

    Examples:
      | producto                         | precio | descripcion |
      | Sauce Labs Backpack               | $29.99 | carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection. |
      | Sauce Labs Bike Light             | $9.99  | A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included. |
      | Sauce Labs Bolt T-Shirt           | $15.99 | Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt. |
      | Sauce Labs Fleece Jacket          | $49.99 | It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office. |
      | Sauce Labs Onesie                 | $7.99  | Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel. |
      | Test.allTheThings() T-Shirt (Red) | $15.99 | This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton. |

  Scenario: Ordenar productos por nombre de A a Z
    When ordeno el catálogo por "Name (A to Z)"
    Then el primer producto debería ser "Sauce Labs Backpack"

  Scenario: Ordenar productos por nombre de Z a A
    When ordeno el catálogo por "Name (Z to A)"
    Then el primer producto debería ser "Test.allTheThings() T-Shirt (Red)"
