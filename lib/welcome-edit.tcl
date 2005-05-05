ad_page_contract {

    Page for editing main content portlet on homepage.

} -query {
    item_id:integer,notnull,optional
} -properties {
    title:onevalue
    content:onevalue
}

set package_id [ad_conn package_id]
set folder_id [dotfolio::get_folder_id -package_id $package_id]
set user_id [ad_conn user_id]
set ip_address [ad_conn peeraddr]

set item_id [content::item::get_id -item_path "welcome" -resolve_index "t" -root_folder_id $folder_id]

permission::require_permission \
    -object_id $folder_id \
    -party_id $user_id \
    -privilege "create"

# Export variable edit.  Required because main-edit is an include script
# in index.  Not sure why this is so.  Got this technique from the
# Wiki package.
set edit_welcome ""
ad_form -name edit_welcome_content -cancel_url {./} -export {edit_welcome} -form {
    # The content item key
    item_id:key

    # "title" is of type text and will use a text widget.
    {title:text \
	 {label "[_ dotfolio-ui.title]" }
	{html {size 40}}
     }

    # "content" is of type text and will use a textarea widget.
    {content:richtext(richtext) \
	 {label "[_ dotfolio-ui.content]" }
        {html {rows 20 cols 50 wrap soft}}
    }

} -edit_request {

    db_1row get_welcome_item {}

} -new_data {

    content::item::new \
        -name "welcome" \
        -parent_id $folder_id \
        -creation_user $user_id \
        -creation_ip $ip_address \
        -title $title \
        -text $content \
        -is_live "t" \
        -storage_type "text"

} -edit_data {

    content::revision::new \
        -item_id $item_id \
        -title $title \
        -content $content

    db_dml set_live {}

} -after_submit {

    ad_returnredirect "./"

    ad_script_abort
}

ad_return_template
