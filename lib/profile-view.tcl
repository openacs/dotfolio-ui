ad_page_contract {

    Page for viewing profile content portlet on homepage.

} -properties {
    profile:multirow
}

set owner_id [dotfolio::user::get_owner_id]

db_0or1row get_identification {}

template::multirow create profile attribute value

# NC: Nasty way of displaying profile attributes.  Need to find a better 
# way to do this.  But short on time, so this will have to do for now.
if {[info exists pref_name] && ![empty_string_p $pref_name]} {
    template::multirow append profile [_ dotfolio-ui.profile_pref_name] $pref_name
}
if {[info exists tele_work] && ![empty_string_p $tele_work]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_tele_work] $tele_work
}
if {[info exists tele_home] && ![empty_string_p $tele_home]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_tele_home] $tele_home
}
if {[info exists mobile] && ![empty_string_p $mobile]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_mobile] $mobile
}
if {[info exists im_msn] && ![empty_string_p $im_msn]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_im_msn] $im_msn
}
if {[info exists im_aim] && ![empty_string_p $im_aim]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_im_aim] $im_aim
}
if {[info exists interests] && ![empty_string_p $interests]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_interests] $interests
}
if {[info exists company] && ![empty_string_p $company]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_company] $company
}
if {[info exists job_desc] && ![empty_string_p $job_desc]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_job_desc] $job_desc
}
if {[info exists goals] && ![empty_string_p $goals]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_goals] $goals
}
if {[info exists edu_level] && ![empty_string_p $edu_level]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_edu_level] $edu_level
}
if {[info exists university] && ![empty_string_p $university]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_university] $university
}
if {[info exists main_skills] && ![empty_string_p $main_skills]} {
    template::multirow append profile \
	[_ dotfolio-ui.profile_main_skills] $main_skills
}

template::list::create \
    -name profile_attributes \
    -multirow profile \
    -no_data [_ dotfolio-ui.no_information_provided] \
    -elements {
        attribute {}
	value {
	    html {width "100%"}
	}
    }

ad_return_template
