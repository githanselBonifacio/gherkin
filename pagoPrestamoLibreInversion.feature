Feature: yo
         como clinte activo del banco y con un credito de libre inversion
         Quiero  pagar mi cuota de manera online para evitar filas en el banco

  Background: ingreso a ventanilla virtual de pagos
    Given el cliente se ha autenticado en la aplicacion web
    And el cliente ha entrado a la ventanilla virtual de pagos
    When el cliente seleccione el prestamo en la lista de productos
    Then se debe abrir el formulario de pago virtual

  Scenario: pagar cuota sin abono a capital
    When el cliente ingrese el monto a pagar y el metodo de pago
    And el cliente deje en blanco el checkbox "abono a capital"
    And  el cliente presione el boton "pagar"
    Then se deberá mostrar en pantalla "pago exitoso"

  Scenario: pagar cuota con abono a capital
    When el cliente ingrese el monto a pagar y el metodo de pago
    And el cliente seleccione el checkbox "abono a capital"
    And el cliente ingrese el monto de abono a capital
    And  el cliente presione el boton "pagar"
    Then se deberá mostrar en pantalla "pago exitoso con abono"
