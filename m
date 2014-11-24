From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH v6]  i2c: s3c2410: Handle i2c sys_cfg register in i2c
 driver
Date: Mon, 24 Nov 2014 10:38:27 +0100
Message-ID: <20141124093827.GC3733@katana>
References: <1416818018-6684-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416818018-6684-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2014 at 02:03:38PM +0530, Pankaj Dubey wrote:
> Let's handle i2c interrupt re-configuration in i2c driver. This will
> help us in removing some soc specific checks from machine files and
> will help in removing static iomapping of SYS register in exynos.c
>=20
> Also handle saving and restoring of SYS_I2C_CFG register during
> suspend and resume of i2c driver.
>=20
> CC: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
> CC: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Applied to for-next, thanks!


--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUcvyTAAoJEBQN5MwUoCm25tkP/RrOeNzBdZNJ22GIwJEN1Son
6CHIcUr6mjsnLFDzvxfzI+nnaSS1ewKLyFNG5JzsCEQ1Ui/SpN1cUjvuGsVF6BRw
FGCr6tYI7xW7EwZgKgPs5Yv8biqzJ8M0f736ToP+zDC4WRm1etwdipy9gAlcHGOP
sDHCts5CZvVK915H7bp8abv1G1yrM3ONmshZWXsE8ICeMLj5x5TK0cey/WDN0iSn
/vmMW4mIshc4++qygdLnSz7mSRl01+fOzC52jv2O9mgAfeFUJB3TFPvJs/FgrVne
XRGKsH+/WTZz6nZ3wj/w2C3TFlbwu9aJYGeMl28WWHd8T9QB+iPLhhKMMQX1WMfu
YqqRMb/m4vxNCNXpM7crkUVXQxMz0DRRCtdwCyrbx1FTr1LA9xhhDRgTsgay/e5C
Bm00UWhWGMA2TF5iMoyi/KDnvSHAMBq7m9DM5Hn0+np73TIasMa7GJNidhfnLBub
I4C/GWFjV4Alqfv+YnaBlOMUpFKRLNXznUCPQvTagEUG0UVzMI71YgZwFaSAVjhm
q0f3cNFIv8KvZwLXoB/6iq/dYTUkaKOnQ1OSHHhItR4AT9O+QFpPvGtHjA0osgay
1kpaKcxVf/Xhf2PgGfgtTuv2fTk6qDyt7c9ORI/dmmF8ZpQtjlKnoezaDn1aMLjW
/flGf4Xc6tF9anFV38A1
=MZIY
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
