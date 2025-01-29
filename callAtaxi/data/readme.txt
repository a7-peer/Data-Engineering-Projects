<TaxiDataSchema>
    <Field>
        <Name>VendorID</Name>
        <Description>A code indicating the TPEP provider that provided the record. 1= Creative Mobile Technologies, LLC; 2= VeriFone Inc.</Description>
    </Field>
    <Field>
        <Name>tpep_pickup_datetime</Name>
        <Description>The date and time when the meter was engaged.</Description>
    </Field>
    <Field>
        <Name>tpep_dropoff_datetime</Name>
        <Description>The date and time when the meter was disengaged.</Description>
    </Field>
    <Field>
        <Name>Passenger_count</Name>
        <Description>The number of passengers in the vehicle. This is a driver-entered value.</Description>
    </Field>
    <Field>
        <Name>Trip_distance</Name>
        <Description>The elapsed trip distance in miles reported by the taximeter.</Description>
    </Field>
    <Field>
        <Name>PULocationID</Name>
        <Description>TLC Taxi Zone in which the taximeter was engaged.</Description>
    </Field>
    <Field>
        <Name>DOLocationID</Name>
        <Description>TLC Taxi Zone in which the taximeter was disengaged.</Description>
    </Field>
    <Field>
        <Name>RateCodeID</Name>
        <Description>The final rate code in effect at the end of the trip. 1= Standard rate 2=JFK 3=Newark 4=Nassau or Westchester 5=Negotiated fare 6=Group ride</Description>
    </Field>
    <Field>
        <Name>Store_and_fwd_flag</Name>
        <Description>This flag indicates whether the trip record was held in vehicle memory before sending to the vendor, aka “store and forward,” because the vehicle did not have a connection to the server. Y= store and forward trip N= not a store and forward trip</Description>
    </Field>
    <Field>
        <Name>Payment_type</Name>
        <Description>A numeric code signifying how the passenger paid for the trip. 1= Credit card 2= Cash 3= No charge 4= Dispute 5= Unknown 6= Voided trip</Description>
    </Field>
    <Field>
        <Name>Fare_amount</Name>
        <Description>The time-and-distance fare calculated by the meter.</Description>
    </Field>
    <Field>
        <Name>Extra</Name>
        <Description>Miscellaneous extras and surcharges. Currently, this only includes the $0.50 and $1 rush hour and overnight charges.</Description>
    </Field>
    <Field>
        <Name>MTA_tax</Name>
        <Description>$0.50 MTA tax that is automatically triggered based on the metered rate in use.</Description>
    </Field>
    <Field>
        <Name>Improvement_surcharge</Name>
        <Description>$0.30 improvement surcharge assessed trips at the flag drop. The improvement surcharge began being levied in 2015.</Description>
    </Field>
    <Field>
        <Name>Tip_amount</Name>
        <Description>Tip amount – This field is automatically populated for credit card tips. Cash tips are not included.</Description>
    </Field>
    <Field>
        <Name>Tolls_amount</Name>
        <Description>Total amount of all tolls paid in trip.</Description>
    </Field>
    <Field>
        <Name>Total_amount</Name>
        <Description>The total amount charged to passengers. Does not include cash tips.</Description>
    </Field>
    <Field>
        <Name>Congestion_Surcharge</Name>
        <Description>Total amount collected in trip for NYS congestion surcharge.</Description>
    </Field>
    <Field>
        <Name>Airport_fee</Name>
        <Description>$1.25 for pick up only at LaGuardia and John F. Kennedy Airports.</Description>
    </Field>
</TaxiDataSchema>
