#!/bin/bash


cd "$(dirname "$0")"


mkdir -p "United States"

# Loop through the entries in the CSV file and write to respective category files
while IFS=, read -r rank youtuber subscribers video_views category title uploads country abbreviation channel_type video_views_rank country_rank channel_type_rank video_views_for_the_last_30_days lowest_monthly_earnings highest_monthly_earnings lowest_yearly_earnings highest_yearly_earnings subscribers_for_last_30_days created_year created_month created_date gross_tertiary_education_enrollment population unemployment_rate urban_population latitude longitude; do
    if [ "$country" == "United States" ]; then
        case "$category" in
            "Music") echo "$youtuber" >> "United States/Music.txt" ;;
            "Entertainment") echo "$youtuber" >> "United States/Entertainment.txt" ;;
            "Gaming") echo "$youtuber" >> "United States/Gaming.txt" ;;
            "Comedy") echo "$youtuber" >> "United States/Comedy.txt" ;;
        esac
    fi
done < 'Global Youtube Statistics.csv'

# Count the number of entries in each category file and save to ws5.txt
wc -l "United States/Music.txt" "United States/Entertainment.txt" "United States/Gaming.txt" "United States/Comedy.txt" > ws5.txt

