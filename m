From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 2/2] i2c: s3c2410: Check clk_prepare_enable() return
 value
Date: Tue, 26 Apr 2016 00:20:51 +0200
Message-ID: <20160425222051.GK1550@katana>
References: <1461163076-5959-1-git-send-email-javier@osg.samsung.com>
 <1461163076-5959-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6K2R/cS9K4qvcBNq"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461163076-5959-2-git-send-email-javier@osg.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org


--6K2R/cS9K4qvcBNq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2016 at 10:37:56AM -0400, Javier Martinez Canillas wrote:
> The clk_prepare_enable() function can fail so check the return
> value and propagate the error in case of a failure.
>=20
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>=20

Applied to for-next, thanks!


--6K2R/cS9K4qvcBNq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXHphDAAoJEBQN5MwUoCm2zN0P/1w8eTUai3hXi54Uzjwecc7T
CalfxMqAMRog9qzZ9qDrBiY/AyL1vH3yHm0us5SCLez/7DnY2EdlbSVLdbOXMT4D
U/MzjCPl3jLfWQXAxoKYXDFl806FTqWUKom8LkQAW/UUB7uPiY0tve2mTneNbl9b
8K2g4TkOg4QvQnF/bpnPKrpe1fBXqmPq8ES9ugbMCLvmwMjV9XC23EkgGy02oMvQ
DUsjvmnkS+NPic9jtIaWlwHIu1eSMR16lh2hoLmixM4I62g2gQDyss4pHnKlHcwQ
7xPY6Od8jAFD7O+5R8L2Uf0+Ou0hmC5Hk/MQLngv/TQwDpFU23BQV90mJBc9S0ij
G/tPl0JBxXYiSvNjNABMH6b083ZHGxW4kEG0M69ymuc+xHZIB0txh7i+k3+4Fcdc
Vum566CEd02Xqp1phAAgyOUwusPcuo+Ntvgj9rjhyIkhepWqkBZlYpCJYegYcDBT
1HkKfF5K7SwYU4Vh1gi7qmXf4qANdWsZzPo9I65+AzpCLrHcZA+ArmrLdNdusos+
8yk0adcH1SvPR/w3+JELQQ4EDiqed2V93ohAi13QTmzrUpgWIepsvft2FTXgY4eO
CE11FAL1T/XrvWuNOUeQbFfkhyeLp/eCrBEb46jO+w4UZGgnlXz8UuCx4skxGMpc
gA5gFTespklR3GEU0MNf
=/fLh
-----END PGP SIGNATURE-----

--6K2R/cS9K4qvcBNq--
