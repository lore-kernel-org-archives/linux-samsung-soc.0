From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] spi: s3c64xx: Zero dma_slave_config struct in
 prepare_dma()
Date: Sun, 11 Aug 2013 14:07:19 +0100
Message-ID: <20130811130719.GZ6427@sirena.org.uk>
References: <1376181210-14599-1-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6rTh04rb0J9qQhfe"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:36379 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753425Ab3HKNHX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Aug 2013 09:07:23 -0400
Content-Disposition: inline
In-Reply-To: <1376181210-14599-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>


--6rTh04rb0J9qQhfe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 11, 2013 at 02:33:28AM +0200, Tomasz Figa wrote:
> Not all fields of dma_slave_config struct are being initialized by
> prepare_dma() function, leaving those which are not in undefined state,
> which can confuse DMA drivers using them.

Applied all, thanks.

--6rTh04rb0J9qQhfe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSB4yEAAoJELSic+t+oim93ncP/35C+uRg2hRZ9BdGVjwtKcay
v+O1FVz+7TIya9tYtOYLmwnXZCJiGS4jLBGitZLZ0goT3D78EAHUuuoHNuQaYEuS
OZUkOtZgcxQa48GspVMgAFtLgl4VzGuEACDOHyYELnD/Xb/hjknyBLIP/8G62Var
mcwIg8NymPkglo3STHc+uiLj/VM9z6l+PfljaAY3MPJk/cnYhLQqmmzHUvLXBwr6
beC1kWekeDk5tiGe0OB91a7/S4LvdNkUyYxkzp36xZEpmPrs5B2T1Uf+7PSbdhyb
PRiw85rYNATQoPidel1/oytp7yAj1DxgVWyTVAD/+qmnb89Z9Wj6XfDv/YtZX3Lq
Kx7u+FujOtmGGAtaAsfpy/5LlR2nbmDKZIRMtqFTGQ4TfVBAm5od70ZS49WOmU7K
nJ4NSQG0R+ww3otLKPyjwTKJ4fTbMGGj/pGR9GIYdNIgdDQ4hKLkoUmDCINFYLo0
H2ItIm6WC7meC49Y88hs+dtT3XQyPFWP0j2FeQZI/8oMdbOuqz+qgvBrX2TXm1/m
nnUIhn61JEjcUVqfn701/RNdOUGEnsF+/BZUAZBGS//0BxAd+17/WzDgw+XJJTvm
j+wIhrPfTG85es+jQIksKiiVpIGRypu+9EBj4z9PloIIrZ4B7q+iycroLXDw+DIP
Bqfei2g6y1jhXTlhdaNm
=kRYP
-----END PGP SIGNATURE-----

--6rTh04rb0J9qQhfe--
