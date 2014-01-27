From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] regulator: s5m8767: Use GPIO for controlling
 Buck9/eMMC
Date: Mon, 27 Jan 2014 20:25:24 +0000
Message-ID: <20140127202524.GQ11841@sirena.org.uk>
References: <1390570678-30686-1-git-send-email-k.kozlowski@samsung.com>
 <1390570678-30686-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRy0ocDzxpWaNtI5"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:60300 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754317AbaA0UZc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Jan 2014 15:25:32 -0500
Content-Disposition: inline
In-Reply-To: <1390570678-30686-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>


--iRy0ocDzxpWaNtI5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2014 at 02:37:57PM +0100, Krzysztof Kozlowski wrote:
> Add support for GPIO control (enable/disable) over Buck9. The Buck9
> Converter is used as a supply for eMMC Host Controller.

Applied, thanks.

--iRy0ocDzxpWaNtI5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS5sCxAAoJELSic+t+oim9W9oQAItQiAzCNH6gWaEf96M2PDXo
Nsx3xif18vEbtcwNBWSOEgS0VoUN6Ipin1JsU07pasid7KKdg6MRpbX6lqRv+p8j
1JWJBxImev9ukeX5kkpEdceUNu8nFeBE67ij6R5zSKfw6FIs3lYsIkyn5N5EhchJ
fE4cOsXWh7ptMFqDOs9IpIFP5i7URImaInodely+vJaeQEafU2i23FWpm8FyflSn
Rg6XNkpowK2erqmVS4x9I12MoBsf3z2bjvFCCHcgQTN1878sTx0QtHIOdrEa424D
CLAw3YVjVF9Ns6tlQFiFs8Js9PWpxC+lTqa27oPsWID091RbjZQlOvIFk0MfAjY7
Tk4pBgQcnOgC0Q6igLBiGTnASBSU0T636V4oBk7How2cz+wZ1S5FKQn1udkgiPR7
zkNl0BF9S3DFjgn5XP63bfC0WtVF/lEH/eqg+ynvfq4LE8ULlxq5ltaUWoDqdlWY
C3clwowALQPYtkr67V8Nev96wHah8zFSYW8elCpa1DS/pJiugnqvWmPR9emthfhO
FtumJk/Q0A5bgjwoQcR6T3q6Mc8RMPWGmoKkOEezZPMVDq6iUk36XAhGTQ9YnYaV
Z7/NqtPDpVXVq8asmlO7X6hOMyrIjJ6brWM4Zm3CYezG35rJAC7hqXUYq8JiUS7L
Lo99wU+0RqdqQLVsIn9T
=NDNs
-----END PGP SIGNATURE-----

--iRy0ocDzxpWaNtI5--
