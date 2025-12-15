Feature: Proceso de Checkout
  Como usuario que quiere finalizar su compra
  Quiero completar el proceso de checkout
  Para recibir mis productos

  Background:
    Given Yo estoy logueado en la pagina principal de "Sauce Demo"
    And Yo agrego el producto "Sauce Labs Backpack" al carrito
    And Yo navego a la pagina del carrito
    And Yo hago click en el boton "Checkout"

  Scenario Outline: Validar campos requeridos en el Checkout Step One
    When Yo ingreso el nombre "<nombre>"
    And Yo ingreso el apellido "<apellido>"
    And Yo ingreso el codigo postal "<zip>"
    And Yo hago click en el boton "Continue"
    Then Yo veo un mensaje de error "<mensaje_error>"

    Examples:
      | nombre | apellido | zip   | mensaje_error                  |
      |        | Doe      | 12345 | Error: First Name is required  |
      | John   |          | 12345 | Error: Last Name is required   |
      | John   | Doe      |       | Error: Postal Code is required |

  Scenario: Completar Checkout Step One exitosamente
    When Yo ingreso mis datos validos: Nombre "John", Apellido "Doe", Zip "12345"
    And Yo hago click en el boton "Continue"
    Then Yo soy redirigido a la pagina de revision "Checkout: Overview"

  Scenario: Verificar items y finalizar compra en Checkout Step Two
    Given Yo ingreso mis datos validos: Nombre "John", Apellido "Doe", Zip "12345"
    And Yo hago click en el boton "Continue"
    When Yo veo que el producto "Sauce Labs Backpack" esta en la lista del checkout
    And Yo veo el resumen de pago con Item total "29.99"
    And Yo hago click en el boton "Finish"
    Then Yo veo el mensaje de orden completada "Thank you for your order!"
    And Yo hago click en el boton "Back Home"
    And Yo soy redirigido a la pagina de inventario "Products"
