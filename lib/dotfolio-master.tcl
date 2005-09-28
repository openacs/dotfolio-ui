ad_page_contract {

    Master template for dotfolio.

    @author  Nick Carroll (nick.c@rroll.net)
    @creation-date 2005-03-24
    @cvs-id  $Id$
} {

}


if { ![info exists section] } {
    set section {}
}

if { ![info exists header_stuff] } {
    set header_stuff {}
}

if { ![info exists subnavbar_link] } {
    set subnavbar_link {}
}

# Rename title to page_title, as title is used below for the navigation tabs.
if { ![info exists title] } {
    set page_title {}
} else {
    set page_title $title
}

set dotfolioCSS [parameter::get_from_package_key -parameter "DotfolioCSS" \
		     -package_key "dotfolio"]

# This will set 'sections' and 'subsections' multirows
subsite::define_pageflow -section $section
subsite::get_section_info -array section_info

# Find the subsite we belong to
set subsite_url [site_node_closest_ancestor_package_url]
array set subsite_sitenode [site_node::get -url $subsite_url]
set subsite_node_id $subsite_sitenode(node_id)
set subsite_name $subsite_sitenode(instance_name)

if { [string equal [ad_conn url] $subsite_url] } {
    set subsite_url {}
}

set user_id [ad_conn user_id]
set is_adviser_p 0
set has_dotfolio_p [dotfolio::has_dotfolio_p -user_id $user_id]

# Need to ignore the admin section to avoid permissions problems.
# Would prefer portfolio owners to be subsite administrators but not
# have all the privileges of an administrator.  Do not want to display
# admin section even if user is the administrator.  Temporary hack till
# we can work out finer granularity of permissions in acs-subsites.

# Refer to proc get_pageflow_struct in
# /packages/acs-subsite/tcl/subsite-procs.tcl.
template::multirow create tabs name label title url selected_p link_p

# If the user is an owner or admin, then display all tabs except admin.
if { [dotfolio::user::owner_p -node_id $subsite_node_id $user_id] || \
	 [dotfolio::admin_p -user_id $user_id]} {
    template::multirow foreach sections {

	if {![string equal $name "admin"] && ![string equal $name "members"]} {

	    template::multirow append tabs $name $label $title $url \
		$selected_p $link_p
	}
    }

} elseif { [dotfolio::user::type_adviser_p -user_id $user_id] } {
    set is_adviser_p 1

    # Else if user is an adviser, then display all tabs except admin
    # and the organiser tab.
    template::multirow foreach sections {

	if {![string equal $name "admin"] && \
		![string equal $name "organise"] && \
		![string equal $name "members"]} {

	    template::multirow append tabs $name $label $title $url \
		$selected_p $link_p
	}
    }

} else {
    # Otherwise only display home and blog tabs.
    template::multirow foreach sections {

	if {[string equal $name "home"] || \
		[string equal $name "blog"]} {

	    template::multirow append tabs $name $label $title $url \
		$selected_p $link_p
	}
    }
    
}


# Display clipper and related items?
set display_clipper 0
if { [info exists displayed_object_id] } {
    if { ![dotfolio::ui::is_content_folder_p -object_id $displayed_object_id] } {
	set display_clipper 1
    }
}
