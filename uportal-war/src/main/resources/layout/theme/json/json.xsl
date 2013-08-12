<?xml version="1.0" encoding="utf-8"?>
<!--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

-->

<!-- ========================================================================= -->
<!-- ========== README ======================================================= -->
<!-- ========================================================================= -->
<!-- 
 | The theme is written in XSL. For more information on XSL, refer to [http://www.w3.org/Style/XSL/].
 | Baseline XSL skill is strongly recommended before modifying this file.
 |
 | This file has two purposes:
 | 1. To instruct the portal how to compile and configure the theme for use in mobile devices.
 | 2. To provide theme configuration and customization.
 |
 | As such, this file has a mixture of code that should not be modified, and code that exists explicitly to be modified.
 | To help make clear what is what, a RED-YELLOW-GREEN legend has been added to all of the sections of the file.
 |
 | RED: Stop! Do not modify.
 | YELLOW: Warning, proceed with caution.  Modifications can be made, but should not generally be necessary and may require more advanced skill.
 | GREEN: Go! Modify as desired.
-->

<!-- ========================================================================= -->
<!-- ========== DOCUMENT DESCRIPTION ========================================= -->
<!-- ========================================================================= -->
<!-- 
 | Date: 08/14/2008
 | Author: Matt Polizzotti
 | Company: Unicon,Inc.
 | uPortal Version: uP3.0.0 and uP3.0.1
 | 
 | General Description: This file, muniversality.xsl, was developed with mcolumn.xsl in order 
 | to enable uPortal 3.0.1 to be viewable by mobile devices. Supported mobile devices 
 | consist of Internet-enabled mobile devices running Windows Mobile 5+ and the BlackBerry Browser 4+. 
 | 
 | This file transforms the xml content generated by the mcolumn.xsl file into html, which 
 | is then rendered in a mobile device. This file formats the html markup to render uPortal's tabs 
 | and their associated channels and portlets for mobile display.
-->


<!-- ========================================================================= -->
<!-- ========== STYLESHEET DELCARATION ======================================= -->
<!-- ========================================================================= -->
<!-- 
 | RED
 | This statement defines this document as XSL.
-->
<xsl:stylesheet 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:dlm="http://www.uportal.org/layout/dlm"
    xmlns:upAuth="http://xml.apache.org/xalan/java/org.jasig.portal.security.xslt.XalanAuthorizationHelper"
    xmlns:upGroup="http://xml.apache.org/xalan/java/org.jasig.portal.security.xslt.XalanGroupMembershipHelper"
    xmlns:upMsg="http://xml.apache.org/xalan/java/org.jasig.portal.security.xslt.XalanMessageHelper"
    xmlns:url="https://source.jasig.org/schemas/uportal/layout/portal-url"
    xmlns:upElemTitle="http://xml.apache.org/xalan/java/org.jasig.portal.security.xslt.XalanLayoutElementTitleHelper"
    xsi:schemaLocation="
            https://source.jasig.org/schemas/uportal/layout/portal-url https://source.jasig.org/schemas/uportal/layout/portal-url-4.0.xsd"
    exclude-result-prefixes="url upAuth upGroup upMsg upElemTitle" 
    version="1.0">

<!-- ========================================================================= -->


<!-- ========================================================================= -->
<!-- ========== IMPORTS ====================================================== -->
<!-- ========================================================================= -->
<!-- 
| RED
| Imports are the XSL files that build the theme.
| Import statments and the XSL files they refer to should not be modified.
-->
<xsl:import href="../resourcesTemplates.xsl" />  <!-- Templates for Skin Resource generation -->
<xsl:import href="../urlTemplates.xsl" />        <!-- Templates for URL generation -->
<!-- ========================================================================= -->


<!-- ========================================= -->
<!-- ========== OUTPUT DELCARATION =========== -->
<!-- ========================================= -->
<!-- 
    | RED
    | This statement instructs the XSL how to output.
-->
<xsl:output method="xml" indent="yes" media-type="text/html"/>
<!-- ========================================= -->

<!-- ============================================== -->
<!-- ========== VARIABLES and PARAMETERS ========== -->
<!-- ============================================== -->
<!-- 
| YELLOW - GREEN
| These variables and parameters provide flexibility and customization of the user interface.
| Changing the values of the variables and parameters signals the theme to reconfigure use 
| and location of user interface components. Most text used within the theme is localized.  
-->
  
  
<!-- ****** XSL UTILITY PARAMETERS ****** -->
<!-- 
| RED
| Parameters used by XSL->Java Callbacks
-->
<xsl:param name="CURRENT_REQUEST" />
<xsl:param name="RESOURCES_ELEMENTS_HELPER" />
<xsl:param name="XSLT_PORTAL_URL_PROVIDER" />


<!-- ****** SKIN SETTINGS ****** -->
<!-- 
| YELLOW
| Skin Settings can be used to change the location of skin files.
--> 
<xsl:param name="CONTEXT_PATH">/NOT_SET</xsl:param>
<xsl:variable name="MEDIA_PATH">media/skins/muniversality</xsl:variable>
<xsl:variable name="ABSOLUTE_MEDIA_PATH" select="concat($CONTEXT_PATH,'/',$MEDIA_PATH)"/>
<xsl:variable name="PORTAL_SHORTCUT_ICON" select="concat($CONTEXT_PATH,'/favicon.ico')" />
<!-- ======================================== -->


<!-- ****** LOCALIZATION SETTINGS ****** -->
<!-- 
| GREEN
| Locatlization Settings can be used to change the localization of the theme.
-->
<xsl:param name="MESSAGE_DOC_URL">messages.xml</xsl:param>
<xsl:param name="USER_LANG">en</xsl:param>
<!-- ======================================== -->


<!-- ****** PORTAL SETTINGS ****** -->
<!-- 
| YELLOW
| Portal Settings should generally not be (and not need to be) modified.
-->
<xsl:param name="AUTHENTICATED" select="'false'"/>
<xsl:param name="USER_ID">guest</xsl:param>
<xsl:param name="userName">Guest User</xsl:param>
<xsl:param name="USER_NAME"><xsl:value-of select="$userName"/></xsl:param>
<xsl:param name="USE_SELECT_DROP_DOWN">true</xsl:param>
<xsl:param name="uP_productAndVersion">uPortal</xsl:param>
<xsl:param name="UP_VERSION"><xsl:value-of select="$uP_productAndVersion"/></xsl:param>
<xsl:param name="baseActionURL">render.uP</xsl:param>
<xsl:variable name="BASE_ACTION_URL"><xsl:value-of select="$baseActionURL"/></xsl:variable>
<!--  
<xsl:param name="HOME_ACTION_URL"><xsl:value-of select="$BASE_ACTION_URL"/>?uP_root=root&amp;uP_reload_layout=true&amp;uP_sparam=targetRestriction&amp;targetRestriction=no targetRestriction parameter&amp;uP_sparam=targetAction&amp;targetAction=no targetAction parameter&amp;uP_sparam=selectedID&amp;selectedID=&amp;uP_cancel_targets=true&amp;uP_sparam=mode&amp;mode=view</xsl:param> 
-->

<xsl:param name="EXTERNAL_LOGIN_URL"></xsl:param>
    
<!-- ========================================================================= -->
<!-- ========== TEMPLATE: ROOT =============================================== -->
<!-- ========================================================================= -->
<!-- 
| RED
| This is the root xsl template and it defines the overall structure of the html markup. 
| Focused and Non-focused content is controlled through an xsl:choose statement.
| Template contents can be any valid XSL or XHTML.
-->
<xsl:template match="/">
    <layout><json/>{
        "user": "<xsl:value-of select="$USER_ID"/>",
        "locale": "<xsl:value-of select="$USER_LANG"/>", 
        "layout":
            { "folders": [
            <xsl:for-each select="//navigation/tab">
                { "id": "<xsl:value-of select="@ID"/>", "title": "<xsl:value-of select="upElemTitle:getTitle(@ID, $USER_LANG, @name)"/>",
                "portlets": [
                    <xsl:apply-templates select="channel" />
                ]}<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>]}
    }<json/></layout>
</xsl:template>
<!-- ========================================================================= -->


<!-- ========================================================================= -->
<!-- ========== TEMPLATE: PORTLET =============================================== -->
<!-- ========================================================================= -->
<!-- 
| RED
| This template defines the method for expressing the presence of a portlet within a layout.
-->
<xsl:template match="channel">
    <xsl:variable name="defaultPortletUrl">
        <xsl:call-template name="portalUrl">
            <xsl:with-param name="url">
                <url:portal-url>
                    <url:layoutId><xsl:value-of select="@ID"/></url:layoutId>
                    <url:portlet-url state="DETACHED" />
                </url:portal-url>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="portletUrl">{up-portlet-link(<xsl:value-of select="@ID" />,<xsl:value-of select="$defaultPortletUrl" />)}</xsl:variable>
    <xsl:variable name="iconUrl">
        <xsl:choose>
            <xsl:when test="parameter[@name='mobileIconUrl'] and parameter[@name='mobileIconUrl']/@value != ''">
                <xsl:value-of select="parameter[@name='mobileIconUrl']/@value"/>
            </xsl:when>
            <xsl:otherwise><xsl:value-of select="$CONTEXT_PATH"/>/media/skins/icons/mobile/default.png</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
                    {
                        "fname": "<xsl:value-of select="@fname"/>",
                        "title": "{up-portlet-title(<xsl:value-of select="@ID" />)}",
                        "url": "<xsl:value-of select="$portletUrl"/>",
                        "description": "<xsl:value-of select="@description"/>",
                        "newItemCount": "{up-portlet-new-item-count(<xsl:value-of select="@ID" />)}",
                        "iconUrl": "<xsl:value-of select="$iconUrl"/>"
                    }<xsl:if test="position() != last()">,</xsl:if>
</xsl:template>
<!-- ========================================================================= -->

</xsl:stylesheet>
