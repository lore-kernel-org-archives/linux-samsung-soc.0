From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: Samsung: add missing I2C/SPI dependencies
Date: Sat, 21 Feb 2015 18:36:11 +0900
Message-ID: <20150221093611.GJ6236@finisterre.sirena.org.uk>
References: <8075847.dUio9f5hRh@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qD3brAgIG4LbUq6d"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47933 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752048AbbBUJh3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Feb 2015 04:37:29 -0500
Content-Disposition: inline
In-Reply-To: <8075847.dUio9f5hRh@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--qD3brAgIG4LbUq6d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2015 at 09:35:08PM +0100, Arnd Bergmann wrote:
> A few sound drivers for the samsung platforms are missing dependencies
> on I2C or SPI, which can lead to build errors like

Applied, thanks.

--qD3brAgIG4LbUq6d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU6FGKAAoJECTWi3JdVIfQ5hoH/1aKrMUGyZvQpWOG678XWC1D
lAU3IdOEtugfWqZcsSDINEzY11B1F1zOlH7XaPfZzC6sQOw1yQTiKKGY6DPV4aOk
nBEVQ5dYeKmN7za16c65DEuO5/WG/fZcVz5Cfah9rjJAT4tYU6+HQSVqz3pnCSXJ
n7NLqJut1LfvyVn7uqwtNT/kcaCBbYYKq6CJINy9uKoCyPHeIkMnOXOACMF/E77f
/WShB3th51Vr77oZ1X0PMIVKWewnONgR5OPMJ/kYcpRlkXGvdW/AB2actDTPIEDG
Gv8jV2hu51EZTc2G9UQHonpPlg+kpqkaPK0mgHf/3gNThxTzDHJI7p1iii/YRUg=
=52G/
-----END PGP SIGNATURE-----

--qD3brAgIG4LbUq6d--
