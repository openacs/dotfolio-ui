ad_page_contract {
    The home page for an eportfolio.

    @author Nick Carroll (nick.c@rroll.net)
    @creation-date 2005-03-16
} -query {
    edit_welcome:optional
    edit_profile:optional
}

set package_id [ad_conn package_id]
set node_id [ad_conn node_id]
set user_id [ad_conn user_id]
set url [ad_conn url]

# Get owner_id and username.
set owner_id [dotfolio::user::get_owner_id]
set owner_username [dotfolio::user::get_owner_username $owner_id]

# Is the user the owner of the dotfolio?
set owner_p [dotfolio::user::owner_p $user_id]

# Does the owner have a portrait?
set portrait_p [dotfolio::user::portrait_p $owner_id]

set list_of_package_ids [subsite::util::packages -node_id $node_id]

db_multirow blog_entries blog_entries {}

set edit_welcome_p 0
if {[info exists edit_welcome]} {
    set edit_welcome_p 1
}

set edit_profile_p 0
if {[info exists edit_profile]} {
    set edit_profile_p 1
}

ad_return_template
