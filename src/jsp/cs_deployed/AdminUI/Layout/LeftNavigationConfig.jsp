<%@page import="com.fatwire.services.beans.asset.PermissionBean"
%><%@taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@taglib prefix="xlat" uri="futuretense_cs/xlat.tld"
%><%@ taglib prefix="assetset" uri="futuretense_cs/assetset.tld"
%><%@ taglib prefix="listobject" uri="futuretense_cs/listobject.tld"
%><%@ taglib prefix="asset" uri="futuretense_cs/asset.tld"
%><cs:ftcs>
    <!--
    LeftNav Custom Integration:  Pane Content Plug-in
    The tree tag is now optional for the parent top level Element Tag
    Added the source property which now is the plug-in for the
    source element rendering any "content" display
    -->
    <leftnavconfig>
        <panes>
            <pane id="genAdminPane" label="<xlat:stream key='AdminUI/DojoTree/GeneralAdmin' escape='true'/>">
                <content>
                    <source> AdminUI/Layout/LeftNavigation/Tree </source>

                    <tree id="genAdminTree" label="<xlat:stream key='AdminUI/DojoTree/GeneralAdmin' escape='true'/>" showParentsOnly="true">
                        <datastore> AdminUI/Data/Tree/Store </datastore>
                        <include>
                            <uid>CSSystem:TreeTabs:Admin</uid>
                            <uid>CSSystem:TreeTabs:Workflow</uid>
                            <uid>CSSystem:TreeTabs:Mobility</uid>
                            <uid>CSSystem:TreeTabs:Connector Admin</uid>
                            <uid>CSSystem:TreeTabs:Visitors Admin</uid>
                        </include>
                        <arguments>
                            <argument name="typeAttr" value="type" />
                            <argument name="persist" value="true" />
                            <argument name="showRoot" value="false" />
                        </arguments>
                    </tree>
                </content>
            </pane>

            <pane id="myWorkPane" label="<xlat:stream key='dvin/UI/MyWork' escape='true'/>">
                <content>
                    <source> AdminUI/Layout/LeftNavigation/Tree </source>

                    <tree id="myWorkTree" label="<xlat:stream key='dvin/UI/MyWork' escape='true'/>" showParentsOnly="true">
                        <datastore> AdminUI/Data/Tree/Store </datastore>
                        <include>
                            <uid>CSSystem:TreeTabs:Bookmarks</uid>
                            <uid>CSSystem:TreeTabs:History</uid>
                            <uid>CSSystem:TreeTabs:Tags</uid>
                        </include>
                        <arguments>
                            <argument name="typeAttr" value="type" />
                            <argument name="persist" value="true" />
                            <argument name="showRoot" value="false" />
                        </arguments>
                    </tree>
                </content>
            </pane>

            <pane id="contentPane" label="<xlat:stream key='AdminUI/DojoTree/Content' escape='true'/>">
                <content>
                    <source> AdminUI/Layout/LeftNavigation/Tree </source>

                    <tree id="contentTree" label="<xlat:stream key='AdminUI/DojoTree/Content' escape='true'/>" showParentsOnly="true">
                        <datastore> AdminUI/Data/Tree/Store </datastore>
                        <exclude>
                            <uid>CSSystem:TreeTabs:Admin</uid>
                            <uid>CSSystem:TreeTabs:Site Navigation</uid>
                            <uid>CSSystem:TreeTabs:Site Admin</uid>
                            <uid>CSSystem:TreeTabs:Workflow</uid>
                            <uid>CSSystem:TreeTabs:Bookmarks</uid>
                            <uid>CSSystem:TreeTabs:Design</uid>
                            <uid>CSSystem:TreeTabs:History</uid>
                            <uid>CSSystem:TreeTabs:Mobility</uid>
                            <uid>CSSystem:TreeTabs:Connector Admin</uid>
                            <uid>CSSystem:TreeTabs:Tags</uid>
                            <uid>CSSystem:TreeTabs:Visitors Admin</uid>
                        </exclude>
                        <arguments>
                            <argument name="typeAttr" value="type" />
                            <argument name="persist" value="true" />
                            <argument name="showRoot" value="false" />
                        </arguments>
                    </tree>
                </content>
            </pane>

            <pane id="sitePane" label="<xlat:stream key='AdminUI/DojoTree/Site' escape='true'/>">
                <content>
                    <source> AdminUI/Layout/LeftNavigation/Tree </source>

                    <tree id="siteTree" label="<xlat:stream key='AdminUI/DojoTree/Site' escape='true'/>" showParentsOnly="true">
                        <datastore> AdminUI/Data/Tree/Store </datastore>
                        <include>
                            <uid>CSSystem:TreeTabs:Site Admin</uid>
                            <uid>CSSystem:TreeTabs:Site Navigation</uid>
                        </include>
                        <arguments>
                            <argument name="typeAttr" value="type" />
                            <argument name="persist" value="true" />
                            <argument name="showRoot" value="false" />
                        </arguments>
                    </tree>
                </content>
            </pane>
        </panes>
    </leftnavconfig>
</cs:ftcs>