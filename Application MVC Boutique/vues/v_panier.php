<a href="http://zupimages.net/viewer.php?id=19/20/nwov.gif"><img src="https://zupimages.net/up/19/20/nwov.gif" alt="" /></a>
<a href="http://zupimages.net/viewer.php?id=19/20/f2lj.jpg"><img src="https://zupimages.net/up/19/20/f2lj.jpg" alt="" /></a>
<?php
foreach( $lesMedicaments as $unMedicament) 
{
	$id = $unMedicament->getId();
	$libelle = $unMedicament->getLibelle();
	$image = $unMedicament->getImage();	
	$quantite = $lesQuantites[$id];
	$url ="<a href=index.php?uc=gererPanier&medicament=$id&action=supprimerUnMedicament>supprimer </a>";
	
	echo "
			<p><img src=".$image." alt=image width=100	height=100 />
			$libelle
			Quantite : $quantite
			$url
			</p>";
}
?>
<br>
<a href=index.php?uc=gererPanier&action=passerCommande>Passer la commande</a>
