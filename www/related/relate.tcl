# /packages/cop-ui/www/related/relate.tcl
ad_page_contract {
    Relate object_id.
    Requires registration.

    @author Jeff Davis davis@xarg.net
    @creation-date 10/30/2003
    @cvs-id $Id$
} {
    object_one:integer,notnull
    {orderby "clipboard,desc"}
}

set user_id [auth::require_login]
set admin_p [permission::permission_p -object_id [ad_conn package_id] -privilege admin]

set title [_ dotfolio-ui.relate]

if {![empty_string_p $object_one]} {
    set object_name [db_string object_name {} -default {}]
    if {![empty_string_p $object_name]} { 
        append title " to $object_name"
    } else { 
        append title " to object $object_one"
    }
}

set context [list [list ./ relate] {relate object}]
