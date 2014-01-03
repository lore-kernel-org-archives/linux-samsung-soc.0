From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH V2] i2c: s3c2410 : Add polling mode support
Date: Fri, 3 Jan 2014 17:10:12 +0100
Message-ID: <20140103161012.GH7132@katana>
References: <1384168820-2986-1-git-send-email-yuvaraj.cd@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384168820-2986-1-git-send-email-yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuvaraj Kumar C D <yuvaraj.cd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, ks.giri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, aditya.ps-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Vasanth Ananthan <vasanthananthan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vasanth Ananthan <vasanth.a-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Yuvaraj Kumar C D <yuvaraj.cd-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org


--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 11, 2013 at 04:50:20PM +0530, Yuvaraj Kumar C D wrote:
> From: Vasanth Ananthan <vasanthananthan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> This patch adds polling mode support for i2c-s3c2410 driver.The
> SATA PHY controller's CMU and TRSV block's are of I2C register
> map in exynos5250.These blocks can be configured using i2c.
>=20
> But i2c controller instance on which these block's sits lacks an
> interrupt line.Also the current i2c-s3c2410 driver is only interrupt
> driven, thus a polling mode support is required in the driver for
> supporting this controller. This patch adds this support to the driver.
>=20
> Changes from V1:
> 	1.Changed the is_ack() to have even period b/w polls and
> 	  used usleep_range() instead of udelay().

Mileages vary, but I'd like to see revision changes after the "---".

>  	ret =3D devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq, 0,
> -			       dev_name(&pdev->dev), i2c);
> +				dev_name(&pdev->dev), i2c);

Unrelated change.

Rest looks good, so I'll fix up the things for you and apply to
for-next, thanks!


--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJSxuDjAAoJEBQN5MwUoCm2SLUP/1Q8BcJlMMfSyfORTR+34WlF
507zNPJcyrNobOULiYp5Y6Ud5cgjEOsQOJwOdX4TAYAhMX4Ydpqp7Y8+YHZ4lEQu
61U3qSanrUpqdyOSt8gk5ZkFO7M5jqXkMNf1SMFdGZG0cuCNC/05uMk9NB0ImyDN
3JzuBuDBImzKUbvhQonsYtGKonZYX01jYJ5MH3UWpCrBHjD67XahH5Ut94roRMjm
spjUG67V6cV6QNcqGfmPdQn0FdSfIoBW2JLXMfyI9SLYetiZ3mG0YsQ4qR58CEqg
Cc4ABFhQhvOe1qfL7OMyafjgBaMIjH9DJ0fssHgV8xyPhQpjhl9Ew1dcTs7/6TqI
a30RLhUX91VvmOPy7mMSv4UTT2ev6den1KdcJdMdCbVyn27i8nxFOweemQi0LFIF
mReAByF1SfQQs5ViFDxQt2+nr2LChYBS9HWTXFbOrCzGawW3M54tf6y5IR73hIfI
lkNztNi1CdtLp+fQyf/XJMG/qr+xgexs4EJq+TL9t8gsiWep8nnR4Jjt6Yo7f6Hc
KwDArTbRsv1Hk5p9GbrV4oswN80gQLPpSLOlk6wsL1c5Yf8WhUaqTSvJuLpVMLnK
x0rXM8d4cByBfnrAa1/0t8amj5X4DuFpeaFtlMO4QblmC25s4n48U2cPj7lNLPmZ
KDwu6qzlN0AKXvwp3OKc
=rOkk
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--
