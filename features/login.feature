Feature: Login en SauceDemo
  Como usuario de SauceDemo
  Quiero iniciar sesión
  Para acceder al catálogo de productos

  Background: 
    Given estoy en la página de login de SauceDemo

  Scenario: Login exitoso
    When inicio sesión con usuario "standard_user" y contraseña "secret_sauce"
    Then debería ver el título "Products"

  Scenario: Login fallido por contraseña incorrecta
    When inicio sesión con usuario "standard_user" y contraseña "mal_password"
    Then debería ver un mensaje de error que contenga "Epic sadface: Username and password do not match any user in this service"

  Scenario: Login fallido de la cuenta locked_out_user
    When inicio sesión con usuario "locked_out_user" y contraseña "secret_sauce"
    Then debería ver un mensaje de error que contenga "Epic sadface: Sorry, this user has been locked out."

  Scenario Outline: Login con diferentes usuarios
    When inicio sesión con usuario "<usuario>" y contraseña "<contraseña>"
    Then debería ver el título "<titulo>"

    Examples:
      | usuario           | contraseña   | titulo     |
      | standard_user     | secret_sauce | Products   |
      | problem_user      | secret_sauce | Products   |
      | visual_user  | secret_sauce | Products   |

