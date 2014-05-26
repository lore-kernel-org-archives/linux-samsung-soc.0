From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Use params_width()
Date: Mon, 26 May 2014 17:04:40 +0100
Message-ID: <20140526160440.GJ22111@sirena.org.uk>
References: <1400846739-32427-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yYtrNYCJ4sZown6G"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43438 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704AbaEZQFW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 12:05:22 -0400
Content-Disposition: inline
In-Reply-To: <1400846739-32427-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, tiwai@suse.de, perex@perex.cz, lgirdwood@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com


--yYtrNYCJ4sZown6G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 23, 2014 at 05:35:39PM +0530, Tushar Behera wrote:
> commit 8c5178fca4ce ("ALSA: Add params_width() helpers") introduces
> a helper to get the sample width. Updating Samsung related sound
> drivers to use this helper.

Applied, thanks.

--yYtrNYCJ4sZown6G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTg2YVAAoJELSic+t+oim9ZdAP/32osrxT61699mdfyzQNHesF
ME8yujSL5/E6AMZ/dvIOscp4Y6u+1Yeju9XS0l+SrQqaY7a9eJMmX7gzInQC4z2M
SdrByuhzpezU9tcVBhkmpe7PVUtZ7srcx3qUMZqxoxQTHPuEnoCQTdQp5tjBW594
g7OvUc2C8HfAJMmpJuVZRDu2fQf7giPxgF6z9WihJC1u+bRvjmkszLnOxNi9nC1a
ArNA+uTe4GewNliqqygvrJFVJwQuXez0i3Df2kXOcYQ+rSOX/S7gr2z0RvxRQGl0
hV6YSqjhammCWI9cRFgNQX9jKArcAa+La6NTastSJzVfq+5SlJSNohyRYGyqD9Aj
yNmEjrhLWITtVnTekuwuz4g5IMaeVLzNuVDNbRCoQ/jIDMMgOk1i4Xdt3jf8Nsg+
HPeiUit+Mg9NVw42ghumrNOtNp9sakO4g2QOuL2JwOFst2WLO7Yw6LRnZXgdaPqJ
Q2FU9nfqw3UgohiOJl4AJyM3G8N4T3ncGCtfywdYL3E+1xJegRSAB1RHUcx4YuQK
CPuLsPbBoF5w6xke7epj9n8s8v6xJZZhu3z+IKzZi2Vp7QtrVYvW6DtSE2mfc/yb
64Lb1ymtg/A74LKn4vFtxAwpFtFWjetgESp4ZI+HZnDtKKHQhS6njnac+qz0ix2B
RYZMudFQVmtk4TBa6dWN
=/PBU
-----END PGP SIGNATURE-----

--yYtrNYCJ4sZown6G--
