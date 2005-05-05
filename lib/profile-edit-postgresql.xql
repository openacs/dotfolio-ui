<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.4</version></rdbms>

    <fullquery name="get_profile_attributes">
      <querytext>
	SELECT pref_name, tele_work, tele_home, mobile,
	       im_msn, im_aim, interests, company, job_desc,
	       goals, edu_level, university, main_skills
	FROM dotfolio_owner_identification
	WHERE owner_id = :owner_id
      </querytext>
    </fullquery>

    <fullquery name="insert_profile_attributes">
      <querytext>
	SELECT dotfolio_owner_identification__new (:owner_id, :pref_name,
              :tele_work, :tele_home, :mobile, :im_msn, :im_aim,
              :interests, :company, :job_desc, :goals, :edu_level,
              :university, :main_skills)
      </querytext>
    </fullquery>

    <fullquery name="update_profile_attributes">
      <querytext>
	UPDATE dotfolio_owner_identification SET
            pref_name = :pref_name,
	    tele_work = :tele_work,
	    tele_home = :tele_home,
	    mobile = :mobile,
	    im_msn = :im_msn,
	    im_aim = :im_aim,
	    interests = :interests,
	    company = :company,
	    job_desc = :job_desc,
	    goals = :goals,
	    edu_level = :edu_level,
	    university = :university,
	    main_skills = :main_skills
	WHERE
	    owner_id = :owner_id
      </querytext>
    </fullquery>

    <fullquery name="profile_exists">
      <querytext>
	SELECT 1 FROM dotfolio_owner_identification WHERE owner_id = :owner_id
      </querytext>
    </fullquery>

</queryset>