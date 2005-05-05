ad_page_contract {
    display a given clipboards contents.

    @author Jeff Davis (davis@xarg.net)
    @creation-date 11/12/2003
    @cvs-id $Id$
} { 
    clipboard_id:integer,notnull
}

set user_id [auth::refresh_login]

# Check that the user is permissioned for this clipboard.
permission::require_permission -party_id $user_id \
    -object_id $clipboard_id -privilege read

if {![db_0or1row clipboard {}] } {
    ad_return_complaint 1 "Invalid clipboard id."
    ad_script_abort
}

set context [list [list ./ Clipboards] $title]

# TODO: Yuck! should fix this query.  maybe stick it in a view...
db_multirow -extend {clipped} items get_items {} {
    set clipped [util::age_pretty -timestamp_ansi $clipped_ansi \
		     -sysdate_ansi [clock_to_ansi [clock seconds]]]
}
