Feature: Funcionalidad del Carrito de Compras
  Como usuario de la tienda Sauce Demo
  Quiero gestionar mi carrito de compras
  Para poder revisar mis productos antes de pagar

  Background:
    Given Yo estoy logueado en la pagina principal de "Sauce Demo"
    And Yo agrego el producto "Sauce Labs Backpack" al carrito
    And Yo agrego el producto "Sauce Labs Bike Light" al carrito
    And Yo navego a la pagina del carrito

  Scenario: Verificar que los productos agregados estan en el carrito
    Then Yo veo que el producto "Sauce Labs Backpack" esta en la lista del carrito
    And Yo veo que el producto "Sauce Labs Bike Light" esta en la lista del carrito
    And Yo veo que el carrito tiene "2" items

  Scenario: Remover un producto del carrito
    When Yo hago click en el boton remover del producto "Sauce Labs Backpack"
    Then Yo veo que el producto "Sauce Labs Backpack" ya no esta en la lista del carrito
    And Yo veo que el carrito tiene "1" item

  Scenario: Continuar comprando regresa al inventario
    When Yo hago click en el boton "Continue Shopping"
    Then Yo soy redirigido a la pagina de inventario "Products"

  Scenario: Proceder al checkout
    When Yo hago click en el boton "Checkout"
    Then Yo soy redirigido a la pagina de informacion "Checkout: Your Information"
