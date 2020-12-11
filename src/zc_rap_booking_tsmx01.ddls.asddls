@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forBooking'
@Search.searchable: true
define view entity ZC_RAP_BOOKING_TSMX01
  as projection on ZI_RAP_BOOKING_TSMX01
{
      @Search.defaultSearchElement: true
  key BookingUUID,

      TravelUUID,
      @Search.defaultSearchElement: true
      BookingID,

      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      CarrierID,
      _Carrier.Name      as CarrierName,
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                           additionalBinding: [ { localElement: 'CarrierId',    element: 'AirlineID' },
                                                                { localElement: 'FlightDate',   element: 'FlightDate',   usage: #RESULT },
                                                                { localElement: 'FlightPrice',  element: 'Price',        usage: #RESULT },
                                                                { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }
                                                              ] }
                                        ]
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,

      _Travel : redirected to parent ZC_RAP_TRAVEL_TSMX01,
      _Customer,
      _Carrier,
      _Connection,
      _Flight
}
