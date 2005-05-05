ad_page_contract {

    Page for viewing main content portlet on homepage.

} -properties {
    content:onevalue
    title:onevalue
}

set package_id [ad_conn package_id]
set folder_id [dotfolio::get_folder_id -package_id $package_id]

set item_id [content::item::get_id -item_path "welcome" \
		 -resolve_index "t" -root_folder_id $folder_id]

db_1row get_content {}

set content [template::util::richtext::get_property text $content]
