<?xml version="1.0"?>

<queryset>

  <fullquery name="do_update">
    <querytext>
        UPDATE acs_objects
           SET title = :title, last_modified = now(),
               modifying_user = :user_id, modifying_ip = :peeraddr
         WHERE object_id = :clipboard_id AND object_type = 'clipboard'
    </querytext>
  </fullquery>

  <fullquery name="select_title">
    <querytext>
      SELECT title FROM acs_objects
          WHERE object_id = :clipboard_id
          AND object_type = 'clipboard'
    </querytext>
  </fullquery>
    
</queryset>
