<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.4</version></rdbms>

    <fullquery name="get_content">
      <querytext>
	SELECT content,title from cr_revisions, cr_items
	    WHERE revision_id=live_revision
	    AND cr_items.item_id=:item_id
      </querytext>
    </fullquery>

</queryset>
