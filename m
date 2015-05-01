From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: bt-sco: Constify platform_device_id
Date: Fri, 1 May 2015 17:51:27 +0100
Message-ID: <20150501165127.GN22845@sirena.org.uk>
References: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
 <1430496014-32309-2-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OBDwML3JH6o7XXm2"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46070 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751606AbbEAQvm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 May 2015 12:51:42 -0400
Content-Disposition: inline
In-Reply-To: <1430496014-32309-2-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Timur Tabi <timur@tabi.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--OBDwML3JH6o7XXm2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2015 at 01:00:12AM +0900, Krzysztof Kozlowski wrote:
> The platform_device_id is not modified by the driver and core uses it as
> const.

Applied, thanks.

--OBDwML3JH6o7XXm2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVQ68OAAoJECTWi3JdVIfQ350H/R/KcV0w1F4SgQPDeQAUCiuU
fgrhKJznJL3PH+i8AP3/KsjvhuHMnltuwzSNrzFnIuaBgKM/IqDJeuDSUT9Lu+xA
r4CMDVH0SYLdVn0nPBPh9OoNtsrg7kRlw5xwtiOmyru7/ZpNCwsDkodpU0ivOeA5
wY+78WTTgZAkKC8lYMVccKwTQQCdcUY5+ezAHkgaCx/nkp5+eAAyZ2BW0mNvN5xE
aJ75N3Pi3IZlXEdsfKhFBDxH2wGp9dMGUQUHOWdGd33tFXhsG5sLOEiKqfmH3pno
5tdcgC7fZYBDoz/kJpFIi5JOnxY4Bdw26FV5wqKWxK5Mml2Af3NYGG85GmFNgSg=
=2pRh
-----END PGP SIGNATURE-----

--OBDwML3JH6o7XXm2--
