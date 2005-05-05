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

# Need to ignore the admin section to avoid permissions problems.
# Would prefer portfolio owners to be subsite administrators but not
# have all the privileges of an administrator.  Do not want to display
# admin section even if user is the administrator.  Temporary hack till
# we can work out finer granularity of permissions in acs-subsites.

# Refer to proc get_pageflow_struct in
# /packages/acs-subsite/tcl/subsite-procs.tcl.
template::multirow create tabs name label title url selected_p link_p
template::multirow foreach sections {

    if {![string equal $name "admin"]} {

	template::multirow append tabs $name $label $title $url \
	                               $selected_p $link_p
    }
}
