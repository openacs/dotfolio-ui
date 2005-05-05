ad_page_contract {

    Displays tools for adding displayed objects to the clipboard, and adding
    related items.

    @author  Nick Carroll (nick.c@rroll.net)
    @creation-date 2005-03-24
    @cvs-id  $Id$
} {

}


# generic stuff we need
set url [dotfolio::ui::organiser_url]
set subsite [ad_conn subsite_id]
set user_id [ad_conn user_id]
set cur_pkg [ad_conn package_id]

db_1row obj_title {}

if {[empty_string_p $obj_title]} { 
    set obj_title EMPTY
}

if {[empty_string_p $acs_name]} { 
    set acs_name EMPTY
}

# get the clipboard info 
clipboard::clipboards -create_new -force_default [ad_conn user_id] clipboards
clipboard::clipped $displayed_object_id [ad_conn user_id] clipped

# record object view and get current count.
db_string record_view {} -default 0
if {![db_0or1row views {}]} { 
    set views missing
    set unique_views missing
}

set return_url [ad_return_url]

# Stuff for related items
relation::get_related -object_id $displayed_object_id -datasource related
template::multirow extend related delete_url
template::multirow foreach related { 
    set delete_url [export_vars -base related/relation-delete \
			{rel_id return_url}]
}
