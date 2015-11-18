From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 3/3] ASoC: samsung: pass filter function as pointer
Date: Wed, 18 Nov 2015 17:52:09 +0000
Message-ID: <20151118175209.GJ31303@sirena.org.uk>
References: <11363089.F4JJ1Xsq7F@wuerfel>
 <5187956.iFJ0QGUy5T@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Or8LRHETumScJgaM"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37657 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755154AbbKRRwa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2015 12:52:30 -0500
Content-Disposition: inline
In-Reply-To: <5187956.iFJ0QGUy5T@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: alsa-devel@alsa-project.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org


--Or8LRHETumScJgaM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 18, 2015 at 03:26:41PM +0100, Arnd Bergmann wrote:
> As we are now passing the filter data as pointers to the drivers,
> we can take the final step and also pass the filter function the
> same way. I'm keeping this change separate, as there it's less
> obvious that this is a net win.

This doens't apply against current code, please check and resend.

--Or8LRHETumScJgaM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWTLrIAAoJECTWi3JdVIfQlc4H/3iL+KlWmtX7jsZyTXGSnO5y
DHu5bB7tCu70Vm+/L4oIBpRBRxe+yknw9gKAXfhgOPWxHgBHF7P0KWLLNsOKcjtc
48LQejUvxkbwYdZlMiWGlzl+3F7f2nnzDU7VmhFJ/iNgvS0hjxHA5KC6bSTQvIME
2pAaJd226tSjrUcGfzFYd1RIKWEm0WjDH7H60YWL3v7a5kGCOtKcT+fbjN81Cqe7
y9Pk8FZIEnEQWO6HL4u1hTPT9uIJuL5xSI7asobkWgiLJzlG8RRULLMtHbjrIGD2
8VUq9Z96OfLlzNNUNVuyClVRvN0rX5p/jZKChK7NxaUiPaKLTvN1M3uf6PCWOoA=
=J/jd
-----END PGP SIGNATURE-----

--Or8LRHETumScJgaM--
