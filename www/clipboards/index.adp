<master>
  <property name="title">#dotfolio-ui.your_clipboards#</property>
  <property name="context">#dotfolio-ui.clipboards#</property>
  <if @user_id@ eq 0>#dotfolio-ui.log_in_or_register#</if>
  <else>
    <if @clipboards:rowcount@ eq 0>#dotfolio-ui.no_clipboards#</if>
    <else>
      <ul>
        <multiple name="clipboards">
          <li> 
            <a href="view?clipboard_id=@clipboards.clipboard_id@">@clipboards.title@</a> <if @clipboards.clipped@ ne 0>#dotfolio-ui.num_items_last_used#</if>
            <a class="button" href="ae?clipboard_id=@clipboards.clipboard_id@">#dotfolio-ui.edit#</a> <a href="delete?clipboard_id=@clipboards.clipboard_id@" class="button">#dotfolio-ui.delete#</a>
          </li>
        </multiple>
      </ul>
    </else>
  </else>
