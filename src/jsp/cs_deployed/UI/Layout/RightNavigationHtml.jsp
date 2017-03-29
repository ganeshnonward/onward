<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld" %>
<cs:ftcs>

    <div id="rightSwitchPanes" data-dojo-type="dijit.layout.ContentPane">

        <div id="dockedSearchContainer" data-dojo-type="dijit.layout.BorderContainer" 
             data-dojo-props="'class':'dockedSearchContainer', design:'sidebar'"
             style="height: 100%; width: 100%; position: absolute; background: #FFF">
        </div>

        <div id="deviceContainer" data-dojo-type="dijit.layout.BorderContainer" 
             style="height: 100%; width: 100%; position: absolute;">

            <div id='devicePaneTop' data-dojo-type="dijit.layout.ContentPane" 
                 data-dojo-props="region:'top'" 
                 style="height: 84px; width: 100%; background: #555;">
            </div>

            <div id='deviceCarousel' data-dojo-type="fw.ui.dijit.insite.DeviceCarousel" 
                 data-dojo-props="region:'center', isShowScrollIcons: false" 
                 style="height: 100%; width: 100%;">
            </div>

        </div>

        <div id="abtestContainer" data-dojo-type="dijit.layout.BorderContainer" class="flat" 
             style="height: 100%; width: 100%; position: absolute; background: #FFF">

            <div data-dojo-type="dijit.layout.ContentPane" data-dojo-props="region:'top'"
                 style="height: 90px; width: 100%; background: #555;">
            </div>

            <div id="ABPanelDiv" data-dojo-type="fw.ui.dijit.insite.ABPanel" data-dojo-props="region:'center'"
                 style="height: 100%; width: 100%;">
            </div>

        </div>

    </div>
</cs:ftcs>