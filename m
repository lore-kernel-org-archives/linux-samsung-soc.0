From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] mfd: sec-core: Rename MFD and regulator names
 differently
Date: Wed, 4 Nov 2015 13:45:45 +0000
Message-ID: <20151104134545.GA1717@sirena.org.uk>
References: <1446437169-29550-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:47136 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751973AbbKDNqQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2015 08:46:16 -0500
Content-Disposition: inline
In-Reply-To: <1446437169-29550-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: lee.jones@linaro.org, k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 09:36:09AM +0530, Alim Akhtar wrote:
> Currently S2MPSXX multifunction device is named as *-pmic,
> and these MFDs also supports regulator as a one of its MFD cell which
> has the same name, because current name is confusing and we want to
> sort it out.

Acked-by: Mark Brown <broonie@kernel.org>

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWOgwCAAoJECTWi3JdVIfQeVMH/3Ha+RIQFIFmlTJWYOBZul6K
FhF3051JgGlvWjNAlXHH9Fl6zoFkzm9A+I2XYsUnPUtTht92kQhMLfAxqISYbHjH
/re+KIlMRK+ICPrIb+Kn+/pIqY6FOab5M8ZsujCRTvs/wQdBERkjSoIcBVtABJO1
ltb29z2HdxDt9FODN7CDJfHoRBNamKLTK3JRg8OAGV4rNzzkolOnFcYWKtXfRjuZ
R1eoQZjjPB5+dRi3Us382z9QXdEv5tTGi8n4Z83FdpKG9gDn0I6fNga1MWMi1IqE
z+OlPoSNOovQbC/LVMEVG2eWrVvNEq6ibwfEgM8aAYRxrmo6uFFM7xMbj/pIrgw=
=e1ta
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
