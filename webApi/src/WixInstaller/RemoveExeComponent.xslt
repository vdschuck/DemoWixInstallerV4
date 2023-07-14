<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
                xmlns:wix="http://wixtoolset.org/schemas/v4/wxs"
                xmlns:bal="http://wixtoolset.org/schemas/v4/wxs/bal">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:key
        name="ExeToRemove"
        match="/wix:Wix/wix:Fragment/wix:DirectoryRef/wix:Component[wix:File[@Source='SourceDir\WebApiWindowService.exe']]"
        use="@Id" />

    <xsl:template match="*[ self::wix:Component or self::wix:ComponentRef ][ key( 'ExeToRemove', @Id ) ]" />
</xsl:stylesheet>