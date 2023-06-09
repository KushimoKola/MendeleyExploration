WITH flattened_twitter_data AS (
    SELECT
        raw_data:"_id"."$oid"::VARCHAR AS guid,
        raw_data:"id"."$numberLong"::VARCHAR AS long_id,
        raw_data:"id_str"::VARCHAR AS id_str,
        raw_data:"user"."id"::VARCHAR AS user_id,
        raw_data:"user"."id_str"::VARCHAR AS user_id_str,
        raw_data:"in_reply_to_status_id"."$numberLong"::VARCHAR AS in_reply_to_status_id,
        raw_data:"in_reply_to_status_id_str"::VARCHAR AS in_reply_to_status_id_str,
        raw_data:"in_reply_to_user_id_str"::VARCHAR AS in_reply_to_user_id_str,
        raw_data:"in_reply_to_user_id"::VARCHAR AS in_reply_to_user_id,
        raw_data:"contributors"::VARCHAR AS contributors,
        raw_data:"created_at"::TIMESTAMP AS created_at,
        raw_data:"favorited"::BOOLEAN AS is_favorited,
        raw_data:"in_reply_to_screen_name"::VARCHAR AS in_reply_to_screen_name,    
        raw_data:"place"."attributes"."street_address"::varchar AS place_address,
        raw_data:"place"."bounding_box"."type"::VARCHAR AS place_coordinates_type,
        raw_data:"place"."country"::VARCHAR AS place_country,
        raw_data:"place"."country_code"::VARCHAR AS place_country_code,
        raw_data:"place"."full_name"::VARCHAR AS place_full_name,
        raw_data:"place"."id"::VARCHAR AS place_id,
        raw_data:"place"."name"::VARCHAR AS place_name,
        raw_data:"place"."place_type"::VARCHAR AS place_type,
        raw_data:"place"."url"::VARCHAR AS place_url,
        raw_data:"retweet_count" AS retweet_count,
        raw_data:"retweeted"::BOOLEAN AS is_retweeted,
        raw_data:"text"::VARCHAR AS text,
        raw_data:"truncated"::BOOLEAN AS is_truncated,
        raw_data:"user"."contributors_enabled"::BOOLEAN AS is_user_contributors_enabled,
        raw_data:"user"."created_at"::TIMESTAMP AS user_created_at,
        raw_data:"user"."default_profile"::BOOLEAN AS is_user_default_profile,
        raw_data:"user"."default_profile_image"::BOOLEAN AS is_user_default_profile_image,
        raw_data:"user"."description"::VARCHAR AS user_description,
        raw_data:"user"."favourites_count"::INTEGER AS user_favourites_count,
        raw_data:"user"."follow_request_sent" AS user_follow_request_sent,
        raw_data:"user"."followers_count"::INTEGER AS user_followers_count,
        raw_data:"user"."following" AS user_following,
        raw_data:"user"."friends_count"::INTEGER AS user_friends_count,
        raw_data:"user"."geo_enabled"::BOOLEAN AS is_user_geo_enabled,
        raw_data:"user"."is_translator"::BOOLEAN AS is_user_is_translator,
        raw_data:"user"."lang"::VARCHAR AS user_lang,
        raw_data:"user"."listed_count"::INTEGER AS user_listed_count,
        raw_data:"user"."location"::VARCHAR AS user_location,
        raw_data:"user"."name"::VARCHAR AS user_name,
        raw_data:"user"."notifications" AS user_notifications,
        raw_data:"user"."profile_background_color"::VARCHAR AS user_profile_background_color,
        raw_data:"user"."profile_background_image_url"::VARCHAR AS user_profile_background_image_url,
        raw_data:"user"."profile_background_image_url_https"::VARCHAR AS user_profile_background_image_url_https,
        raw_data:"user"."profile_background_tile"::BOOLEAN AS is_user_profile_background_tile,
        raw_data:"user"."profile_image_url"::VARCHAR AS user_profile_image_url,
        raw_data:"user"."profile_image_url_https"::VARCHAR AS user_profile_image_url_https,
        raw_data:"user"."profile_link_color"::VARCHAR AS user_profile_link_color,
        raw_data:"user"."profile_sidebar_border_color"::VARCHAR AS user_profile_sidebar_border_color,
        raw_data:"user"."profile_sidebar_fill_color"::VARCHAR AS user_profile_sidebar_fill_color,
        raw_data:"user"."profile_text_color"::VARCHAR AS user_profile_text_color,
        raw_data:"user"."profile_use_background_image"::BOOLEAN AS is_user_profile_use_background_image,
        raw_data:"user"."protected"::BOOLEAN AS is_user_protected,
        raw_data:"user"."screen_name"::VARCHAR AS user_screen_name,
        raw_data:"user"."show_all_inline_media"::BOOLEAN AS is_user_show_all_inline_media,
        raw_data:"user"."statuses_count"::INTEGER AS user_statuses_count,
        raw_data:"user"."time_zone"::VARCHAR AS user_time_zone,
        raw_data:"user"."url"::VARCHAR AS user_url,
        raw_data:"user"."utc_offset" AS user_utc_offset,
        raw_data:"user"."verified"::BOOLEAN AS is_user_verified,
        ---FURTHER NORMALIZATION NEEDED---
        raw_data:"geo" AS geo,
        TRIM(raw_data:"coordinates"."coordinates") AS coordinates,
        raw_data:"coordinates"."type"::VARCHAR AS coordinates_type,
        raw_data:"place" AS place,
        raw_data:"place"."bounding_box" AS place_bounding_box,
        raw_data:"place"."bounding_box"."coordinates" AS place_coordinates,
        raw_data:"source" AS source,
        raw_data:"entities" AS entities,
        raw_data:"entities"."hashtags" AS hashtags, ---needs normalization
        raw_data:"entities"."urls" AS entities_urls, --- needs normalization
        raw_data:"entities"."user_mentions" AS entities_user_mentions --- needs normalization
        
    FROM
        {{ ref('source_twitter_data') }}
)
SELECT * FROM flattened_twitter_data