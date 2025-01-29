
<TaxiDataSchema>
    <Table>
        <Row>
            <FieldName>VendorID</FieldName>
            <Description>A code indicating the TPEP provider that provided the record. 1= Creative Mobile Technologies, LLC; 2= VeriFone Inc.</Description>
        </Row>
        <Row>
            <FieldName>tpep_pickup_datetime</FieldName>
            <Description>The date and time when the meter was engaged.</Description>
        </Row>
        <Row>
            <FieldName>tpep_dropoff_datetime</FieldName>
            <Description>The date and time when the meter was disengaged.</Description>
        </Row>
        <Row>
            <FieldName>Passenger_count</FieldName>
            <Description>The number of passengers in the vehicle. This is a driver-entered value.</Description>
        </Row>
        <Row>
            <FieldName>Trip_distance</FieldName>
            <Description>The elapsed trip distance in miles reported by the taximeter.</Description>
        </Row>
        <Row>
            <FieldName>PULocationID</FieldName>
            <Description>TLC Taxi Zone in which the taximeter was engaged.</Description>
        </Row>
        <Row>
            <FieldName>DOLocationID</FieldName>
            <Description>TLC Taxi Zone in which the taximeter was disengaged.</Description>
        </Row>
        <Row>
            <FieldName>RateCodeID</FieldName>
            <Description>The final rate code in effect at the end of the trip. 1= Standard rate 2=JFK 3=Newark 4=Nassau or Westchester 5=Negotiated fare 6=Group ride</Description>
        </Row>
        <Row>
            <FieldName>Store_and_fwd_flag</FieldName>
            <Description>This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka "store and forward," because the vehicle did not have a connection to the server. Y= store and forward trip N= not a store and forward trip</Description>
        </Row>
        <Row>
            <FieldName>Payment_type</FieldName>
            <Description>A numeric code signifying how the passenger paid for the trip. 1= Credit card 2= Cash 3= No charge 4= Dispute 5= Unknown 6= Voided trip</Description>
        </Row>
        <Row>
            <FieldName>Fare_amount</FieldName>
            <Description>The time-and-distance fare calculated by the meter.</Description>
        </Row>
        <Row>
            <FieldName>Extra</FieldName>
            <Description>Miscellaneous extras and surcharges. Currently, this only includes the $0.50 and $1 rush hour and overnight charges.</Description>
        </Row>
        <Row>
            <FieldName>MTA_tax</FieldName>
            <Description>$0.50 MTA tax that is automatically triggered based on the metered rate in use.</Description>
        </Row>
        <Row>
            <FieldName>Improvement_surcharge</FieldName>
            <Description>$0.30 improvement surcharge assessed trips at the flag drop. The improvement surcharge began being levied in 2015.</Description>
        </Row>
        <Row>
            <FieldName>Tip_amount</FieldName>
            <Description>Tip amount – This field is automatically populated for credit card tips. Cash tips are not included.</Description>
        </Row>
        <Row>
            <FieldName>Tolls_amount</FieldName>
            <Description>Total amount of all tolls paid in trip.</Description>
        </Row>
        <Row>
            <FieldName>Total_amount</FieldName>
            <Description>The total amount charged to passengers. Does not include cash tips.</Description>
        </Row>
        <Row>
            <FieldName>Congestion_Surcharge</FieldName>
            <Description>Total amount collected in trip for NYS congestion surcharge.</Description>
        </Row>
        <Row>
            <FieldName>Airport_fee</FieldName>
            <Description>$1.25 for pick up only at LaGuardia and John F. Kennedy Airports.</Description>
        </Row>
    </Table>
</TaxiDataSchema>
