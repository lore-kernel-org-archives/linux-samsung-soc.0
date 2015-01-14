From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH V3 13/15] ARM: dts: Exynos4 and Odroid X2/U3 sound device
 nodes update
Date: Wed, 14 Jan 2015 19:54:52 +0000
Message-ID: <20150114195452.GM3043@sirena.org.uk>
References: <1421260962-16892-1-git-send-email-s.nawrocki@samsung.com>
 <1421260962-16892-14-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57502 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751065AbbANTy7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 14:54:59 -0500
Content-Disposition: inline
In-Reply-To: <1421260962-16892-14-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, padma.v@samsung.com, drake@endlessm.com, sbkim73@samsung.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 14, 2015 at 07:42:40PM +0100, Sylwester Nawrocki wrote:
> Clock related properties are added to the Exynos4 I2S device nodes
> so they can be referred to as clock providers. Missing i2s_opclk1
> clock is added to the I2S0 node and clock properties are added
> to the MAX98090 codec node to allow it to control/read frequency
> of the MCLK clock directly.

Sorry, I should've said - I applied the ASoC patches, not these.

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUtsmLAAoJECTWi3JdVIfQ+vwH/iiIdWa2sq7XBFXNgeq8T3lw
oQVX5w3eMhJ9DoqQG5IdURo1BEqRvtpWnAStjLikShE+U5DH6l+16xSY2tFkI+ci
s3OY3yBXBh4c8/HLwq+AbE/W4juiDFiprXcu+kBGT2Paq3lrbLRB4ipsA6+96Gop
vkxlhkEw5sAjShJF6WYXb8HqUcflcmTsL8+PAlutt2hbu0RdtN5N1pRV8TLEl3tZ
8iZe7X/o1ocIiSZPgc75Te/SbKF0vT5/hbrhhIWwnyt8HesuOkvTCogXBsjONk/6
sUr8pJZ32HV8Y/BQN6blm9U1IpjoQsPzkunRIvlSw1Ta+s/B3csVQD7dYh2RFUs=
=8bP6
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--
