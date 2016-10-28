From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Drop AC97 drivers
Date: Fri, 28 Oct 2016 18:57:47 +0100
Message-ID: <20161028175747.zmurlr6xhyoxc2l5@sirena.org.uk>
References: <1477671072-742-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lltzdekvgof4i3jy"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45816 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942481AbcJ1R6H (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 13:58:07 -0400
Content-Disposition: inline
In-Reply-To: <1477671072-742-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org


--lltzdekvgof4i3jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2016 at 06:11:12PM +0200, Sylwester Nawrocki wrote:
> The AC97 drivers are broken and it seems these have not been used
> for a long time.  This patch removes the unused code, i.e. Samsung
> SoC AC97 controller driver and related machine drivers:
> ln2440sbc_alc650, smdk2443_wm9710, smdk_wm9713.

This needs rebasing against some of the recent fixes, sorry.

--lltzdekvgof4i3jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYE5GbAAoJECTWi3JdVIfQDiAH/1WZqAyCIe9bAchPQZgaRpHA
YI+aKovR5br1Bhhmvn3AWYEgJ70elM/sH2O8X0Q+q53pceA2lHPLuyImqz7AH6E9
x0HiNrss9QaSp1Uhj338kD5MesvOKYN+hvM9ixot+3yv2s+43fszBT6uQo+YsqAG
NJybmfGPKtueoM4QznQvrhrXtlsZOFuWJF5j+xyo6RZ/o3iUl+fxv0CvH3mJoThw
+xD1fAiX8x/njpTDpHg0t38IaYwq2yLk8wHgazjV+4LZKRPEQT3l4ETBUtRtuaT6
N38U8d4j4eDepUrzmxmTsQ3fRZzC7xBzwyGP6RDFSQ4f//pcajL8WKO+YD4hJxI=
=SlXh
-----END PGP SIGNATURE-----

--lltzdekvgof4i3jy--
