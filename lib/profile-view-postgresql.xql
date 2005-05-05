<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.4</version></rdbms>

    <fullquery name="get_identification">
      <querytext>
	SELECT pref_name, tele_work, tele_home, mobile, im_msn, im_aim,
	       interests, company, job_desc, goals, edu_level, university,
	       main_skills
	FROM dotfolio_owner_identification
	WHERE owner_id = :owner_id
      </querytext>
    </fullquery>

</queryset>
