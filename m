From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/2] i2c: s3c2410: Print errno code in error logs
Date: Tue, 26 Apr 2016 00:20:45 +0200
Message-ID: <20160425222045.GJ1550@katana>
References: <1461163076-5959-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwgQ89ZNnFUwFHTC"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47316 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750843AbcDYWUw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 18:20:52 -0400
Content-Disposition: inline
In-Reply-To: <1461163076-5959-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--rwgQ89ZNnFUwFHTC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2016 at 10:37:55AM -0400, Javier Martinez Canillas wrote:
> The driver not always prints the error code in case of a failure but this
> information can be very useful for debugging. So let's print if available.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20

Applied to for-next, thanks!


--rwgQ89ZNnFUwFHTC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHpg9AAoJEBQN5MwUoCm2x1gP/2smicFCKNeDWz53qnF+gCyt
A0Bjn5jMRRZVltffqT4kFr/+qoZMiR+CVJFSHzERhfCaSCus9R9td7nFJD7CrdK1
W4sgf510kTrlKYoSC978AnHF63/Vpgx86aEmlbq04jOpgM18MAN5xDqh0uMLlo/4
Togp+zgT9Fv/sXbbqQpVMmxNzhVbsdrdVGLQIXPOufAw25O6+8Da+azsjpak27zo
vnKV78dOica0wFSegLr/XwErNGkS7/+fsa+I7A9YrJumbdaaWGjI79a8U7dCbW1g
TOsvYliq5jTzeB4QOY86aOYb809kh26hnhm03nXpws5H9EkYrjxJt8E1JNdo/z5o
cEwhQSh9Ry/LfiIulZ2zPL4gc4N/B38CZNCzWtkmb3dsmP3Zsjr9GyUGMVqeF8Ln
nhdlb+lnsFWCobZEQZXIqQ0H27b3nO545BkXYN4I83G2KEBNg0P2TFoUmXVSoPGZ
TxNLDu3GRSzJ7sh4rslXM7tJKyTkK7tpjX+2AZYfrR8u6Cq0p+RkFAoccmY7iHrm
UU1eA6xCqj9vrFqTG07Y6K8q3zF/gRdP4PwceT/HiQ5T0sIGa8nuHne+BfpqhIiZ
7yYYlx/LIAk3TpUgEMLJrHf/OXe5LHO/EHDmbHYyeeaCLPyGwhQeH4NGedthPxBM
xMDN9B6h0b78X6f4g2MB
=qazi
-----END PGP SIGNATURE-----

--rwgQ89ZNnFUwFHTC--
