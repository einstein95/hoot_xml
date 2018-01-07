<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:template match="/">
	<html lang="ja">
	<head>
		<title>hoot �^�C�g�����X�g(<xsl:value-of select="gamelist/@date"/>��)</title>
		<meta http-equiv="Content-Type" content="text/html; charset=Shift_JIS"/>
		<link rel="stylesheet" type="text/css" href="hoot.css"/>
		<script language="JavaScript">
		<xsl:comment>
		<![CDATA[
		var doc = document.XMLDocument;
		var style = document.XSLDocument;
		var sortfield = style.selectNodes("//xsl:sort");
		function sort_list(f,f2,f3)
		{
			sortfield(0).setAttribute("select",f);
			sortfield(1).setAttribute("select",f2);
			sortfield(2).setAttribute("select",f3);
			gamelist.innerHTML = doc.documentElement.transformNode(style);
		}
		]]>
		</xsl:comment>
		</script>
	</head>
	<body>
		<h1>hoot �^�C�g�����X�g(<xsl:value-of select="gamelist/@date"/>��)</h1>
		<button onClick="sort_list('dummy','dummy','dummy')">�\�[�g�Ȃ�</button>
		<button onClick="sort_list('driver','driver/@type','name')">�h���C�o�Ń\�[�g</button>
		<button onClick="sort_list('name','driver','driver/@type')">�^�C�g���Ń\�[�g</button>
		<div id="gamelist">
		<xsl:apply-templates select="gamelist"/>
		</div>
	</body>
	</html>
</xsl:template>
<xsl:template match="gamelist">
	<xsl:for-each select="game">
		<xsl:sort select="dummy" data-type="text"/>
		<xsl:sort select="dummy" data-type="text"/>
		<xsl:sort select="dummy" data-type="text"/>
		<hr/>
		<h2><xsl:value-of select="name"/></h2>
		<h3>
			�h���C�o:<xsl:value-of select="driver"/>
			(<xsl:value-of select="driver/@type"/>)
		</h3>
		<xsl:apply-templates select="options"/>
		<xsl:apply-templates select="romlist"/>
		<xsl:apply-templates select="titlelist"/>
	</xsl:for-each>
</xsl:template>
<xsl:template match="romlist">
	<h4>�f�[�^</h4>
	<table>
	<tr>
		<th width="10%">���</th>
		<th width="15%">�I�t�Z�b�g</th>
		<th width="15%">CRC32</th>
		<th>�t�@�C����</th>
	</tr>
	<xsl:for-each select="rom">
		<tr>
			<td><xsl:value-of select="@type"/></td>
			<td><xsl:value-of select="@offset"/></td>
			<td><xsl:value-of select="@crc32"/></td>
			<td><xsl:value-of select="./text( )"/></td>
		</tr>
	</xsl:for-each>
	</table>
</xsl:template>
<xsl:template match="options">
	<h4>�I�v�V����</h4>
	<table>
	<tr>
		<th width="25%">���O</th>
		<th>�l</th>
	</tr>
	<xsl:for-each select="option">
		<tr>
			<td><xsl:value-of select="@name"/></td>
			<td><xsl:value-of select="@value"/></td>
		</tr>
	</xsl:for-each>
	</table>
</xsl:template>
<xsl:template match="titlelist">
	<h4>�Ȗ�</h4>
	<table>
	<tr>
		<th width="10%">No.</th>
		<th>�^�C�g��</th>
	</tr>
	<xsl:for-each select="title">
		<tr>
			<td><xsl:value-of select="@code"/></td>
			<td><xsl:value-of select="./text( )"/></td>
		</tr>
	</xsl:for-each>
	<xsl:for-each select="range">
		<tr>
			<td><xsl:value-of select="@min"/>~<xsl:value-of select="@max"/></td>
			<td><xsl:value-of select="./text( )"/></td>
		</tr>
	</xsl:for-each>
	</table>
</xsl:template>
</xsl:stylesheet>
