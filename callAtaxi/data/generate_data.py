import csv
import random
from faker import Faker
from datetime import datetime, timedelta
from google.cloud import storage

# Initialize Faker
data_generator = Faker()

# Number of rows to generate
num_rows = 1000

# Local output file
output_file = "taxi_data.csv"

# GCS bucket and file details
gcs_bucket_name = "mytaxi_data"  # Replace with your GCS bucket name
gcs_file_path = "data/taxi_data.csv"  # Path within the bucket

# Function to generate random datetime in a range
def random_datetime(start, end):
    delta = end - start
    random_seconds = random.randint(0, int(delta.total_seconds()))  # Convert to integer
    return start + timedelta(seconds=random_seconds)

# Set datetime range for pickup
pickup_start = datetime(2023, 1, 1)
pickup_end = datetime(2023, 12, 31)

# Latitude and longitude ranges for pickup and dropoff
pickup_lat_range = (40.5, 40.9)
pickup_long_range = (-74.3, -73.7)
dropoff_lat_range = (40.5, 40.9)
dropoff_long_range = (-74.3, -73.7)

# Generate data and write to CSV
with open(output_file, mode="w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)

    # Write header
    writer.writerow([
        "VendorID", "tpep_pickup_datetime", "tpep_dropoff_datetime", "passenger_count",
        "trip_distance", "pickup_longitude", "pickup_latitude", "RatecodeID",
        "store_and_fwd_flag", "dropoff_longitude", "dropoff_latitude", "payment_type",
        "fare_amount", "extra", "mta_tax", "tip_amount", "tolls_amount",
        "improvement_surcharge", "total_amount"
    ])

    # Generate rows
    for _ in range(num_rows):
        VendorID = random.randint(1, 2)
        tpep_pickup_datetime = random_datetime(pickup_start, pickup_end).strftime("%Y-%m-%d %H:%M:%S")
        tpep_dropoff_datetime = (datetime.strptime(tpep_pickup_datetime, "%Y-%m-%d %H:%M:%S") + timedelta(minutes=random.randint(5, 60))).strftime("%Y-%m-%d %H:%M:%S")
        passenger_count = random.randint(1, 6)
        trip_distance = round(random.uniform(0.5, 50.0), 2)
        pickup_longitude = round(random.uniform(*pickup_long_range), 6)
        pickup_latitude = round(random.uniform(*pickup_lat_range), 6)
        RatecodeID = random.randint(1, 6)
        store_and_fwd_flag = random.choice(['Y', 'N'])
        dropoff_longitude = round(random.uniform(*dropoff_long_range), 6)
        dropoff_latitude = round(random.uniform(*dropoff_lat_range), 6)
        payment_type = random.randint(1, 4)
        fare_amount = round(random.uniform(2.5, 100.0), 2)
        extra = round(random.uniform(0.0, 5.0), 2)
        mta_tax = 0.5
        tip_amount = round(random.uniform(0.0, 20.0), 2)
        tolls_amount = round(random.uniform(0.0, 10.0), 2)
        improvement_surcharge = 0.3
        total_amount = round(
            fare_amount + extra + mta_tax + tip_amount + tolls_amount + improvement_surcharge, 2
        )

        # Write row
        writer.writerow([
            VendorID, tpep_pickup_datetime, tpep_dropoff_datetime, passenger_count,
            trip_distance, pickup_longitude, pickup_latitude, RatecodeID,
            store_and_fwd_flag, dropoff_longitude, dropoff_latitude, payment_type,
            fare_amount, extra, mta_tax, tip_amount, tolls_amount,
            improvement_surcharge, total_amount
        ])

print(f"{num_rows} rows of fake taxi data have been generated and saved to {output_file}.")

# Function to upload file to GCS
def upload_to_gcs(local_file_path, bucket_name, destination_blob_name):
    """Uploads a file to the Google Cloud Storage bucket."""
    try:
        # Initialize GCS client
        client = storage.Client()
        bucket = client.bucket(bucket_name)
        blob = bucket.blob(destination_blob_name)

        # Upload the file
        blob.upload_from_filename(local_file_path)
        print(f"File {local_file_path} uploaded to gs://{bucket_name}/{destination_blob_name}.")
    except Exception as e:
        print(f"An error occurred while uploading to GCS: {e}")

# Upload the generated CSV to GCS
upload_to_gcs(output_file, gcs_bucket_name, gcs_file_path)
