ad_page_contract {

    Page for editing dotfolio owner's profile.

} -query {
    owner_id:integer,notnull,optional
} -properties {

}

set user_id [ad_conn user_id]
set package_id [ad_conn package_id]

# Since we define owner_id here, ad_form will always be an edit_request, and
# never a new_request.
set owner_id [dotfolio::user::get_owner_id]

# Check if the user has write permission to edit the owner's profile.
permission::require_permission \
    -object_id $package_id \
    -party_id $user_id \
    -privilege "write"

# Export variable edit_profile as empty query string.  Used to display this
# include script.
set edit_profile ""
ad_form -name edit_profile_attributes -cancel_url {./} \
    -export {edit_profile} -form {
	# The owner id is key
	owner_id:key

	# Preferred name
	{pref_name:text \
	    {label "[_ dotfolio-ui.profile_pref_name]" }
	    {html {size 40}}
	}

	# Work telephone number
	{tele_work:text,optional \
	     {label "[_ dotfolio-ui.profile_tele_work]" }
	    {html {size 40}}
	}

	# Home telephone number
	{tele_home:text,optional \
	     {label "[_ dotfolio-ui.profile_tele_home]" }
	    {html {size 40}}
	}

	# Mobile number
	{mobile:text,optional \
	     {label "[_ dotfolio-ui.profile_mobile]" }
	    {html {size 40}}
	}

	# MSN Messenger
	{im_msn:text,optional \
	     {label "[_ dotfolio-ui.profile_im_msn]" }
	    {html {size 40}}
	}

	# AIM
	{im_aim:text,optional \
	     {label "[_ dotfolio-ui.profile_im_aim]" }
	    {html {size 40}}
	}

	# Interests
	{interests:text,optional \
	     {label "[_ dotfolio-ui.profile_interests]" }
	    {html {size 40}}
	}

	# Company
	{company:text,optional \
	     {label "[_ dotfolio-ui.profile_company]" }
	    {html {size 40}}
	}

	# Job Description
	{job_desc:text,optional \
	     {label "[_ dotfolio-ui.profile_job_desc]" }
	    {html {size 40}}
	}

	# Goals
	{goals:text,optional \
	     {label "[_ dotfolio-ui.profile_goals]" }
	    {html {size 40}}
	}

	# Level of education
	{edu_level:text,optional \
	     {label "[_ dotfolio-ui.profile_edu_level]" }
	    {html {size 40}}
	}

	# University
	{university:text,optional \
	     {label "[_ dotfolio-ui.profile_university]" }
	    {html {size 40}}
	}

	# Main skills
	{main_skills:text,optional \
	     {label "[_ dotfolio-ui.profile_main_skills]" }
	    {html {size 40}}
	}

    } -edit_request {
	
	set owner_id [dotfolio::user::get_owner_id]
	db_0or1row get_profile_attributes {}

    } -after_submit {

	# Check to see if profile exists first.
	# This check is required as we have explicity set the key as
	# the owner_id above.
	set exists_p [db_0or1row profile_exists {}]

	# If profile exists, then do update, otherwise do insert.
	if {$exists_p} {
	    db_dml update_profile_attributes {}
	} else {
	    db_0or1row insert_profile_attributes {}
	}

	ad_returnredirect "./"

	ad_script_abort
    }

ad_return_template


#        INSERT INTO dotfolio_owner_identification
#            (owner_id, pref_name, tele_work, tele_home, 
#             mobile, im_msn, im_aim, interests, company, 
#             job_desc, goals, edu_level, university, main_skills)
#        VALUES
#            (:owner_id, :pref_name, :tele_work, :tele_home, :mobile,
#             :im_msn, :im_aim, :interests, :company, :job_desc, :goals, 
#             :edu_level, :university, :main_skills)
