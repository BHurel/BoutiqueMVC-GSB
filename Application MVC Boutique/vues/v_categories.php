<br>
<ul id="categories">
<?php
foreach( $lesCategories as $uneCategorie) 
{
	$idCategorie = $uneCategorie->getId();
	$libCategorie = $uneCategorie->getLibelle();
	$url ="<a href=index.php?uc=voirMedicaments&idCategorie=$idCategorie&action=voirMedicaments> $libCategorie  </a>";
	echo "<div class='vertical-menu'><li>".$url."</li>\n</div>";
}
?>
</ul>
