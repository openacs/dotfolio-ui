<master>
<property name="title">#dotfolio-ui.dotfolio#</property>

<P>
<div class="visualClear"></div>

<table id="portal-columns">
  <tbody>
    <tr>
      <td id="portal-column-one">
      <div class="visualPadding">
        <div class="portlet" id="portlet-portrait">
          <div class="padding">
            <h5>#dotfolio-ui.portrait#</h5>
            <div class="portletBody">
              <if @owner_p@ eq "1">
              <div class="portletEdit">
                <a href="user/portrait/upload?return_url=@url@" onmouseover="this.T_WIDTH=65;return escape('#dotfolio-ui.tooltip_edit_portrait#')"><img src="/resources/dotfolio-ui/edit.jpg"></a>
              </div>
              </if>
              <div align="center" class="portletContent">
              <if @portrait_p@ eq "1">
              <img class="dotfolioPortrait" src="shared/portrait-bits.tcl?user_id=@owner_id@">
              </if>
              <else>
                <if @owner_p@ eq "1">
                <img onmouseover="this.T_WIDTH=120;this.T_TEMP=3500;return escape('<img src=\"/resources/dotfolio-ui/help.jpg\" alt=\"#dotfolio-ui.help#\" /> #dotfolio-ui.help_edit_portrait#')" class="dotfolioPortrait" src="/resources/dotfolio-ui/blank_portrait.jpg" alt="#dotfolio-ui.portrait#" />
 	        </if>
                <else>
                <img class="dotfolioPortrait" src="/resources/dotfolio-ui/blank_portrait.jpg" alt="#dotfolio-ui.portrait#" />
                </else>
              </else>
              </div>
            </div>
          </div>
        </div>
      </div>
      </td>

      <td id="portal-column-content">
        <div class="visualPadding">
          <div class="documentBorder">
            <if @owner_p@ eq "1">
            <div class="portletEdit">
              <a href="?edit_welcome" onmouseover="this.T_WIDTH=100;return escape('#dotfolio-ui.tooltip_edit_welcome#')"><img src="/resources/dotfolio-ui/edit.jpg"></a>
            </div>
            </if>

            <div class="documentContent">
              <if @edit_welcome_p@ eq "1">
              <include src="welcome-edit" owner_username=@owner_username@>
              </if>
              <else>
              <include src="welcome-view" owner_username=@owner_username@>
              </else>
            </div>
          </div>
        </div>

        <div class="visualPadding">
          <div class="documentBorder">
            <if @owner_p@ eq "1">
            <div class="portletEdit">
              <a href="?edit_profile" onmouseover="this.T_WIDTH=85;return escape('#dotfolio-ui.tooltip_edit_profile#')"><img src="/resources/dotfolio-ui/edit.jpg"></a>
            </div>
            </if>

            <div class="documentContent">
              <if @edit_profile_p@ eq "1">
              <include src="profile-edit" owner_username=@owner_username@>
              </if>
              <else>
              <include src="profile-view" owner_username=@owner_username@>
              </else>
            </div>
          </div>
        </div>
      </td>

      <td id="portal-column-two">
        <div class="visualPadding">
          <div class="portlet" id="portlet-blogs">
            <div class="padding">
              <h5>#dotfolio-ui.blog_entries#</h5>
              <div class="portletBody">
                <div align="left" class="portletContent">
                  <multiple name="blog_entries">
                    <div class="portletBlogEntries">
                      <a href="blog/one-entry?entry_id=@blog_entries.entry_id@">@blog_entries.title@</a>
                    </div>
                    <span class="portletBlogDates">@blog_entries.pretty_date@</span>
                    <P>
                    <HR>
                  </multiple>
                  <if @blog_entries:rowcount@ eq 0>
                    <span class="portletBlogEntries">#dotfolio-ui.no_entries#</span>
                  </if>
                  <else>
                    <a href="blog"><span class="portletBlogEntries">#dotfolio-ui.more#</span></a>
                  </else>
                </div>
              </div>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </tbody>
</table>
