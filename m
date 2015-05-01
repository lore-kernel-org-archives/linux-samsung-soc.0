From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: samsung: Constify platform_device_id
Date: Fri, 1 May 2015 17:54:05 +0100
Message-ID: <20150501165405.GP22845@sirena.org.uk>
References: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
 <1430496014-32309-4-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BktmtKUJXfGkDXG3"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46141 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750994AbbEAQyQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 May 2015 12:54:16 -0400
Content-Disposition: inline
In-Reply-To: <1430496014-32309-4-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Timur Tabi <timur@tabi.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--BktmtKUJXfGkDXG3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2015 at 01:00:14AM +0900, Krzysztof Kozlowski wrote:
> The platform_device_id is not modified by the driver and core uses it as
> const.

Applied, thanks.

--BktmtKUJXfGkDXG3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVQ6+sAAoJECTWi3JdVIfQPkUH/AmZWavLaSNSnNx6XX1Q1hns
FFXoaPjZK6LQ3tRtPlyxj9qXjvbyOnKoNWJX04AU8/Pkq9ca/0G9fpTpSGvbCpLk
ymBImJHtPLP+JE6O3DKUuJ0/6V/ROVC1tyO7XRdjDUZRArcFriYV6H8FKa06Kxz0
r7SkAVIafPXd3AjIUB6o66PqsLwNbaNV2Rk0V2LQlgO/ChME3wHVlkAinDkJrGcO
Hgo4ROodt4LiYlQT7crdXG2pVB0L2ncF6QTeeTVfi2T/XgMVNJ9CIp7z+QZUb+Fu
h7AVD1vc3+Q5pckYZxjnmnNhfOKVg1bCgj8ASEWOgvS8+RhU9uWA0p8XycQCMiY=
=nag6
-----END PGP SIGNATURE-----

--BktmtKUJXfGkDXG3--
