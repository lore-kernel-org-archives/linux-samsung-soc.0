From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v4 1/2] i2c: s3c2410: Handle i2c sys_cfg register in i2c
 driver
Date: Fri, 21 Nov 2014 08:25:45 +0100
Message-ID: <20141121072545.GG1480@katana>
References: <1414656270-8048-1-git-send-email-pankaj.dubey@samsung.com>
 <1414656270-8048-2-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQbNiKLmgenwUfTN"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:49119 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750876AbaKUHY2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Nov 2014 02:24:28 -0500
Content-Disposition: inline
In-Reply-To: <1414656270-8048-2-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, Rob Herring <robh+dt@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org


--yQbNiKLmgenwUfTN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2014 at 01:34:29PM +0530, Pankaj Dubey wrote:
> Let's handle i2c interrupt re-configuration in i2c driver. This will
> help us in removing some soc specific checks from machine files and
> will help in removing static iomapping of SYS register in exynos.c
>=20
> Since only Exynos5250, and Exynos5420 has i2c nodes in DT, added syscon
> based phandle to i2c device nodes of respective SoC DT files.
>=20
> Also handle saving and restoring of SYS_I2C_CFG register during
> suspend and resume of i2c driver.
>=20
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Randy Dunlap <rdunlap@infradead.org>
> CC: Wolfram Sang <wsa@the-dreams.de>
> CC: Russell King <linux@arm.linux.org.uk>
> CC: devicetree@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> CC: linux-i2c@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  .../devicetree/bindings/i2c/i2c-s3c2410.txt        |    1 +
>  arch/arm/boot/dts/exynos5250.dtsi                  |    4 +++
>  arch/arm/boot/dts/exynos5420.dtsi                  |    4 +++

I usually don't take DTS patches. They should go via arm-soc. Please say
so if there are reasons I should take them.

> @@ -1084,6 +1092,23 @@ s3c24xx_i2c_parse_dt(struct device_node *np, struc=
t s3c24xx_i2c *i2c)
>  	of_property_read_u32(np, "samsung,i2c-slave-addr", &pdata->slave_addr);
>  	of_property_read_u32(np, "samsung,i2c-max-bus-freq",
>  				(u32 *)&pdata->frequency);
> +	/*
> +	 * Exynos5's legacy i2c controller and new high speed i2c
> +	 * controller have muxed interrupt sources. By default the
> +	 * interrupts for 4-channel HS-I2C controller are enabled.
> +	 * If node for first four channels of legacy i2c controller

s/node/nodes/

> +	 * are available then re-configure the interrupts via the
> +	 * system register.
> +	 */
> +	id =3D of_alias_get_id(np, "i2c");
> +	i2c->sysreg =3D syscon_regmap_lookup_by_phandle(np,
> +			"samsung,sysreg-phandle");
> +	if (IS_ERR(i2c->sysreg)) {
> +		/* As this is not compulsory do not return error */
> +		pr_info("i2c-%d skipping re-configuration of interrutps\n", id);

I'd say drop this message. If you want to keep it, it should be dev_dbg.

> +		return;
> +	}
> +	regmap_update_bits(i2c->sysreg, EXYNOS5_SYS_I2C_CFG, BIT(id), 0);
>  }

Rest looks good, thanks!

--yQbNiKLmgenwUfTN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUbuj5AAoJEBQN5MwUoCm2hTsP/Az5+KkwKMv2AxxdjTHgErj3
XGj9YmSGR3ISb8e3E+JBbWBlPxyYXdQgncO1+2uSqJPD7WGsE9r2/klSX8l7XKOF
+wek+ic9f0qzO+R+CnoYF1t54OtG7NLQBztSj7DXU5LpFc8amAmNqUAEoO/LK0W+
dsgk+eOub6AZW6Tl33VKiDviWim+KutfHT7CAduRFcWAnAiAZU4Wx6cDLzGR0qMa
3H4etNn0IX6m6suB0I9G7dC0qnw3BpsF8851kY5e5xTEieMubv7S9vrpp9rEkSB6
4olSfTRNc/NZkh++XO95RqQMqAjkOtIRECMmUOhCNHSt8jVF5/juKp3spDFeOdvM
PKN+qy/V1710UWykuYEqwPWxtpdiZ7gVOFh6A47cxBjyHP2wW3PWOIKsAwz4pjPr
dAjZG40tpCmXtRuQcionSfeXtWLmOFBZMUCZMo/vH+K29esL2RMNkJYsQ2uyNvkx
EP/ozVNj9H28WM/aOWBk+kMMOBJycUZ2MiH6H68ya7DOs/u2e8WMvb7ZzD0OPUlY
uM4jg3z3Mom3BBwluMYqCzLSAbZnDaQQNMWrhb57RV0pQ6GEPelmkzZGi47lJ3QN
9AQOl3HmKVeh4SZeg5vBOVIEcV1x8xeE9hx3u3dsYJ8Q/Sxqf2NHKRg9rbyXlZDs
oTPciS5BQDe1p0JXQlvT
=QkRc
-----END PGP SIGNATURE-----

--yQbNiKLmgenwUfTN--
