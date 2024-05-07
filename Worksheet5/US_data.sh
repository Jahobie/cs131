#!/bin/bash

# Navigate to the directory where the script is located
cd "$(dirname "$0")"

# Create directories if they don't exist
mkdir -p "United States"

# Define the list of categories to process
categories=("Music" "Entertainment" "Gaming" "Comedy")

# Loop through the categories and process each one
for category in "${categories[@]}"; do
    # Process each entry in the CSV file and write to respective category files
    while IFS=, read -r rank youtuber subscribers video_views cat title uploads country abbreviation channel_type video_views_rank country_rank channel_type_rank video_views_for_the_last_30_days lowest_monthly_earnings highest_monthly_earnings lowest_yearly_earnings highest_yearly_earnings subscribers_for_last_30_days created_year created_month created_date gross_tertiary_education_enrollment population unemployment_rate urban_population latitude longitude; do
        if [ "$country" == "United States" ] && [ "$cat" == "$category" ]; then
            echo "$youtuber" >> "United States/$category.txt"
        fi
    done < 'Global Youtube Statistics.csv'
done

# Count the number of entries in each category file and save to ws5.txt
wc -l "United States/Music.txt" "United States/Entertainment.txt" "United States/Gaming.txt" "United States/Comedy.txt" > ws5.txt

