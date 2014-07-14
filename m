From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: samsung: remove unused DMA data
Date: Mon, 14 Jul 2014 19:54:01 +0100
Message-ID: <20140714185401.GD6800@sirena.org.uk>
References: <1405086308-1461192-1-git-send-email-arnd@arndb.de>
 <1405086308-1461192-7-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PLVMksexArUZ/iL3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37404 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752433AbaGNSyX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 14:54:23 -0400
Content-Disposition: inline
In-Reply-To: <1405086308-1461192-7-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com, t.figa@samsung.com, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org


--PLVMksexArUZ/iL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 11, 2014 at 03:45:08PM +0200, Arnd Bergmann wrote:
> The s3c_dma_client structures and the 'ch' and 'ops' members in
> s3c_dma_params were only used by the legacy DMA driver and serve
> no function any more. This removes any reference to them.

Applied, thanks.

--PLVMksexArUZ/iL3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTxCdGAAoJELSic+t+oim9EuwP/ieQi8HP/IYEeO1KjtP6ymOx
FQSCouwLB0j7OKbYah6DjzpavQHa5EEvA2uCFwC3q9+eHUYBRp/QDQ4U4VfmEgGm
UQA4gsnvRMlP1n7rFT0kg8OyPJWwT0dcrAyfVvvxr1jZW3mhqd1gxYcfzzdEkCUx
pjMosidmprvMMBqIydIJOjtjglRMWyAHcyu5QF3MY1iTmPz71RbTpdxGRpx109D2
QfiB/APcF189GxSGCQW5Jjowf4WgnJaxljBj5CU+rCwzs8mP3txt+yFIqUUbs8g4
XvYLHe/fhSAxoin1/kRGVsL3XYy3RTAUV2m7lkhXjxSaSOvhTQbPBIkpWe+3j/aj
KImwsK5L3Q4jgnJBNQTpEldzrQiVNuGYJOVvHx1kansm4DS09HgvsEexJ6YEn7H/
yLWLMLNE3moQ6xH00dJjtYRcSFm1kzfyBDzOU2Ia4dNk6o+McBpBnzZ2qOUQmeRj
5n05Mt7RhTrMb9NGLs95i+zOTa/inma7IC0bNvC3FJ1ycJWqy5qpwab1vjhoBJZ0
5QW29fYqPwgJtyaVQBRMOx/PmSm7etDLJXOA14RubmCGQMySRm2YSfGzhvBjsP95
39AHA3NPgJpilcCTWlqnmJUWlc979O2Oi+kYhQ0BlhbvzIR6NyxAXA0mb6ZNFy+A
ILtDTKamgRL8WZeJH/bl
=jVc0
-----END PGP SIGNATURE-----

--PLVMksexArUZ/iL3--
