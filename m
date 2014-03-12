From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 1/2 v4] i2c: exynos5: add support for HSI2C on Exynos5260
 SoC
Date: Wed, 12 Mar 2014 20:18:51 +0100
Message-ID: <20140312191851.GB28891@katana>
References: <1385100726-32165-1-git-send-email-ch.naveen@samsung.com>
 <1391748171-12451-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1391748171-12451-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2014 at 10:12:51AM +0530, Naveen Krishna Chatradhi wrote:
> This patch adds a new compatible and uses variant struct to support
> HSI2C module on Exynos5260. Updates the Documentation dt bindings.
> Also resets the module as an init sequence (Needed by Exynos5260).
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

This patch has clearly not been tested :( Build failure!

> +struct exynos_hsi2c_variant {
> +	unsigned int		    fifo_depth;
> +};

Why so many tabs? In general, I'd prefer one space.

> -	exynos5_i2c_init(i2c);
> +	exynos5_i2c_reset(i2c);

Is this a related change?


--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTILMbAAoJEBQN5MwUoCm263sQAK2njJTIEyuO/Cbqkml7LLA7
2LxbTzdbCWxeH5ipT7qfk7tGM3YxlE1mkuNsdNbKYVAQJz7CHlBvuFYEClcr8v9S
utBdguKbi9Z+wyZ0Ei8DfF207Addo7x9sm/gfuvJfllT/7VNoGnEzMpsOjBJMliZ
xN1yD2w9nEeyihLHKLA3NjmKBvCAbB96DFd2LxHHFJOTwqXTJ6ndEu2OsCjri97T
2Yhsc1ewFkl5qw0eh7gBBidUAfhp9VHX1WjU9RU6wuxa3PO8eiZ//R2BY82eb/X3
+RRaxKKQQzl2r+clVS/tdeETaTDoUQv4CdbFlKtxvhJ8xq8Krnwl3bHGTkp47e6V
aYzOhW3aX7h8iZJjxyYSSAeCGEGEKc2lqIDe8VzqK3IOPSJVfxHpmYthAVOpGVfi
7r/h0vcDejLrtQPei5ONTiBnONEhEfBM8H1q2LwpebVFOrqoxC5aNeKmExZ6L657
MAUykyOxbDdfRS3/E1nkr2NO2EM4LNGxirVaEvMpgRaghEuO8QV7UriRSV9OCp9R
dl781fXFJp+zpJUHN0Rp2g/evseVl/II0o1hlVaBzEq6JEzUcgUv72oM1bLF90XT
yunUzvs7zgUymkxWNSx6RUJnmv4YY2Pg8sU5RXxVAIik33qSWP1LEQbz0dAjXJJI
LomIIu/f2qrrWyEzBWJk
=C4nf
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
