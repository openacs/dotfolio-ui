<?xml version="1.0"?>

<queryset>
    <rdbms><type>postgresql</type><version>7.4</version></rdbms>

    <fullquery name="get_welcome_item">
      <querytext>
        SELECT cr_items.item_id, title, content
            FROM cr_items, cr_revisions
            WHERE name='welcome'
            AND parent_id=:folder_id
            AND latest_revision=revision_id
      </querytext>
    </fullquery>

    <fullquery name="set_live">
      <querytext>
        UPDATE cr_items SET live_revision=latest_revision
            WHERE item_id=:item_id
      </querytext>
    </fullquery>

</queryset>