ad_page_contract {
    add/edit an object clipboard and optionally attach an 
    object at the same time.

    @author Jeff Davis davis@xarg.net
    @creation-date 10/30/2003
    @cvs-id $Id$
} {
    clipboard_id:optional
    {object_id:integer,optional {}}
}

set user_id [auth::require_login]
set limit 16

ad_form -name clip_ae -export {object_id} -form {
    clipboard_id:key(acs_object_id_seq)
    {title:text(text)
        {label \#dotfolio-ui.clipboard_name\#}
        {html {size $limit}}}
} -select_query_name {select_title} -validate {
    {title
        {![string is space $title]} 
        \#dotfolio-ui.provide_clipboard_name\#
    }
    {title
	{[string length $title] <= $limit}
        "\#dotfolio-ui.clipboard_num_characters_or_less_part1\# $limit \#dotfolio-ui.clipboard_num_characters_or_less_part2\#"
    }
} -new_data {
    clipboard::new -title $title
} -edit_data {
    set peeraddr [ad_conn peeraddr]
    permission::require_permission -object_id $clipboard_id -privilege admin
    db_dml do_update {}
} -after_submit {
    if {![empty_string_p $object_id]} { 
        ad_returnredirect "attach?[export_vars -url {object_id clipboard_id}]"
    } else { 
        ad_returnredirect ./
    }
    ad_script_abort
}
