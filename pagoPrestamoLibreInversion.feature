Feature: yo
         como cliente activo del banco
         Quiero poder simular un credito con pagos fijos de manera online
         para evitar filas en el banco

  Scenario Outline: calcular cuota fija de prestamo
    Given el banco ofrece una tasa de <interes> % de interes anual
    When el cliente solicita un prestamo por $<monto> 
    And quiere pagarlo a <cuotas> cuotas mensules
    Then el cliente debera pagar $<pago_mensual> pesos mesuales
    Examples:
      | monto   | interes | cuotas | pago_mensual |
      | 5000000 | 10      | 12     | 439579.44    |
      | 5000000 | 10      | 24     | 230724.63    |
      | 2500000 | 10      | 16     | 167547.26    |


  Scenario Outline: refinanciar prestamo
    Given el cliente tiene un pestamo por $ <monto_inicial>, a <periodos> cuotas mensuales con interes de <interes>%
    And  ha pagado <cuotas_pagadas>
    When el cliente quiera refinanciar su prestamo
    And pida al banco reficanciar la deuda a <plazo_nuevo> cuotas menuales
    Then el banco le otorgara <periodos_gracia> meses de gracia
    And el cliente tendra que pagar $<cuota_refinanciada> mensuales por <plazo_nuevo> meses
    Examples:
      | monto_inicial | periodos | interes | cuotas_pagadas | plazo_nuevo | periodos_gracia | cuota_refinanciada |
      | 5000000       | 12       | 10      | 6              | 12          | 3               | 230939.14          |
      | 5000000       | 24       | 10      | 12             | 20          | 2               | 145395.52          |
      | 2500000       | 16       | 10      | 8              | 18          | 1               | 78208.80           |
