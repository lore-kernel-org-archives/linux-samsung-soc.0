From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: au1x: Constify platform_device_id
Date: Fri, 1 May 2015 17:46:24 +0100
Message-ID: <20150501164624.GM22845@sirena.org.uk>
References: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4kyyiuJNZa/POMXt"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:46039 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751107AbbEAQqo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 May 2015 12:46:44 -0400
Content-Disposition: inline
In-Reply-To: <1430496014-32309-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Timur Tabi <timur@tabi.org>, Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Kukjin Kim <kgene@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org


--4kyyiuJNZa/POMXt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 02, 2015 at 01:00:11AM +0900, Krzysztof Kozlowski wrote:
> The platform_device_id is not modified by the driver and core uses it as
> const.

Applied, thanks.

--4kyyiuJNZa/POMXt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVQ63fAAoJECTWi3JdVIfQAjQH/A3e23pzvDBdrQiWsDNZhyrZ
IOR8OlgwM3GLe/FoHsud8RTdr38gIM8papbGpiHF69kSVB5qp/bwRvI2o+Ao0wTx
6uCnvcaUzGi2K6VWheeQsplFVmad78h19CwTGkN91NwC/e/XVjJsSzCk/y6qdiIb
DxVgpTALk9Tt+fJbnpe1lxPMIBabb4Id1xc66JFOHpKpkun0p6OmyCT8s0l4bM7S
kAu87h7BJ0gdF1uLrOdhiwKzjoOhSDRKmepzKqfpqIo2DrPNenfRbYWEpD4kwmyE
RwyugWz/NPeek3kqI1i2CjJEXSvWao8h78hgAej+0H3Y0OKFlvfTLNGgLPI7uJ4=
=rQvY
-----END PGP SIGNATURE-----

--4kyyiuJNZa/POMXt--
