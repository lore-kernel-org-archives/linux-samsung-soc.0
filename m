From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH] i2c: exynos5: add support for HSI2C on Exynos5260 SoC
Date: Wed, 21 May 2014 12:34:32 +0200
Message-ID: <20140521103432.GM2708@katana>
References: <1398675598-25991-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00sTfE/IIAT5d2r5"
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398675598-25991-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--00sTfE/IIAT5d2r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2014 at 02:29:58PM +0530, Naveen Krishna Chatradhi wrote:
> HSI2C module on Exynos5260 differs from current modules in
> following ways:
> 1.  HSI2C on Exynos5260 has fifo_depth of 16bytes
> 2.  Module needs to be reset as a part of init sequence.
>=20
> Hence, Following changes are involved.
> 1. Add a new compatible string and Updates the Documentation dt bindings.
> 2. Introduce a variant struct to support the changes in H/W
> 3. Reset the module during init. Thus, bringing the module back
> to default state irrespective of what firmware did with it.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ich.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---

=2E..

> -		fifo_ctl |=3D HSI2C_RXFIFO_TRIGGER_LEVEL(HSI2C_DEF_TXFIFO_LVL);
> +		trig_lvl =3D (i2c->msg->len > i2c->variant->fifo_depth) ?
> +			(i2c->variant->fifo_depth * 3/4) : i2c->msg->len;
> +		fifo_ctl |=3D HSI2C_RXFIFO_TRIGGER_LEVEL(trig_lvl);
> +

Dunno why checkpatch missed the 'space around operator' issue, yet I
fixed it here...

Applied to for-next, thanks!


--00sTfE/IIAT5d2r5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)

iQIcBAEBAgAGBQJTfIE4AAoJEBQN5MwUoCm2YF0P/0EFkN+wHA4u0tnxLbjfCXiT
mvz+QdM0aDBfnZ94TzkuDIYdDfH79QHG6goj0co6w33MqMS++E8tHhFO+7cFF5Ol
dkto2A0nJNHnqoC8hmvCoL9MaqTSsVrcOhWgrRcaxKj4CC8nQnJj+BkLgsf+PCXY
tfJEEwO+7N9Z7eWokF3Vyr/uzLEDPgkSgCsJLLvNNaAxNB8OGCpMPpHnNkL7eWdL
KqlkDqqvGTIpQZ4yJFTEE5RDMmACB+XzVrKF4L3Fu7ZwEZaKgOmlImo8qKAyRfeE
Pt0gLxSGQZyM0nlK+P16Fmk4cB96gwBJKzOAX956NltuEe0ykh0mR4Xzstczeb/G
hkD3R7XeYHYQ+6vDBvGlR3kZjYvWaUnfEiUGVaj+8lTQmaKqZbBESc25r3D93MsI
+D+BZ13CsGs1Q6sJAdYiH2D3ujdy80V8wtgUBAMyXTZNAVhd5sFF2wbhNn3AZlwO
TGXs8oBWu4IMqRvjcdH7Me2PAHVdP62miN7Gq3PFoyrMgSB1PX213JoJvE0ccCP1
CCSLdJq8ittMeiF0EhqWnq40xQMd0E6c518B6fd8rSNH2G586CCu6qHNdsddrbAw
NdAt0uKX4t/TBcQJiZVJDahDGQ+pvz13tv2zVApZqZ4/XrBjKFfwmJhpVtaK9Bhg
2OUAzmXWRBZ+EEwOUppr
=2qMU
-----END PGP SIGNATURE-----

--00sTfE/IIAT5d2r5--
