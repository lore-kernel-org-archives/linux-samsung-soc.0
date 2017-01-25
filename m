From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH] i2c: exynos5: fix arbitration lost handling
Date: Wed, 25 Jan 2017 21:57:15 +0100
Message-ID: <20170125205715.xaaphsyb7hwowurq@ninjato>
References: <CGME20170105120727eucas1p2b9452792b7d13d551974305b478a26e2@eucas1p2.samsung.com>
 <1483618013-10721-1-git-send-email-a.hajda@samsung.com>
 <20170125205554.m7vmhs4tq6bzti52@ninjato>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4cqzfwdul5dnhlb6"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170125205554.m7vmhs4tq6bzti52@ninjato>
Sender: linux-i2c-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-i2c@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


--4cqzfwdul5dnhlb6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 09:55:54PM +0100, Wolfram Sang wrote:
> On Thu, Jan 05, 2017 at 01:06:53PM +0100, Andrzej Hajda wrote:
> > In case of arbitration lost adequate interrupt sometimes is not signale=
d. As
> > a result transfer timeouts and is not retried, as it should. To avoid s=
uch
> > cases code is added to check transaction status in case of every interr=
upt.
> >=20
> > Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>=20
> Looks good to me, but I'd like some review from one of the Samsung
> people?

Ooops, you are from Samsung as well :) Still, I'd like one more ack or
review from someone with the HW.

Thanks,

   Wolfram


--4cqzfwdul5dnhlb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAliJESsACgkQFA3kzBSg
KbYE+g/+KGe1Z7iFAkXlu4f+WN6A9/3ejRk0hTNyifn1p6fjPSKuF08D/gqWLUea
r4S5jcEwQ9IEeHevgO9n0dcbg+0zutxde76YzozQWg2rR2jGb97pMN6lSHgAUW2V
5/VGBmKlTbD7mUMSkJjRm62MkWml1RQnKfPRke9pjhVN+AnJhpJXeViFka7BoHZ/
VJsUwDbFEop3oXVnGsQcnoPBuiH1zSeysmvgzwwNSCYB2EKYrrxCim3h1epaWRZv
7K4Re0uY5/7HcJJUTheCaY+Bfo1y3wydcbGH6qwxlKpGzufbNRQ1b4cgV26bK2a1
VsMq14rZmQKtdlhzXi1zTkGbpToudpIIt/TIk+3Xz7JcoRJ4JmWr7LN2ImJx5Y9h
bZi2voQaS8V+4Z0SwC29mDlffQJh80v0fQFEVWCF/JWROx9PZTt8k0pH/CP9I4Q5
vppEViof5kDkV8gSTlpa9342laSZviz5iY/G8qOpTU1CTr/H9m6VpxZcYW/1xEFF
oh6PcxqEGSAschMnV+CSYooWkYZdDuU+7vtpfLSQNbhON6p5VpqqmFF2mfznSdci
Uy4oa6hIdcM/XAQojF475lJUljcQx0gLsoatfaBxErlqMy6tHkFF9geOvloLh5rF
CwfQcTYx5Lm3L++9gFwTSWuXoLUXZe+UxgxXXQyGPt0LOIXnb90=
=vhDR
-----END PGP SIGNATURE-----

--4cqzfwdul5dnhlb6--
