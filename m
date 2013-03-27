From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 3/6] usb: phy: samsung: Consolidate reference clock rate
 handling
Date: Wed, 27 Mar 2013 15:19:58 +0200
Message-ID: <20130327131958.GH4626@arwen.pp.htv.fi>
References: <1364309595-16102-1-git-send-email-t.figa@samsung.com>
 <1364309595-16102-4-git-send-email-t.figa@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="boAH8PqvUi1v1f55"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:49181 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750977Ab3C0NUE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 09:20:04 -0400
Content-Disposition: inline
In-Reply-To: <1364309595-16102-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, balbi@ti.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, p.paneri@samsung.com, gautam.vivek@samsung.com, m.szyprowski@samsung.com

--boAH8PqvUi1v1f55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 26, 2013 at 03:53:12PM +0100, Tomasz Figa wrote:
> @@ -307,6 +310,7 @@ static int samsung_usb3phy_remove(struct platform_dev=
ice *pdev)
>  static struct samsung_usbphy_drvdata usb3phy_exynos5 =3D {
>  	.cpu_type		=3D TYPE_EXYNOS5250,
>  	.devphy_en_mask		=3D EXYNOS_USBPHY_ENABLE,
> +	.rate_to_clksel		=3D samsung_usbphy_rate_to_clksel_4x12,

why isn't this just a clk_get_rate() ???

--=20
balbi

--boAH8PqvUi1v1f55
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRUvH+AAoJEIaOsuA1yqRE+b0P/0hE+pZc9a5vGQqnuGrdHQ6/
o6dCNVP10XK0qXtzBi3VcsDP0vl25V3qCvaw4nD838SXm4L1qoc43oDF4Z3k5Aud
PwLZrNm/BzZmN2Vo+Mdxv2h3vGbnHwbvXFwjHxDeIQlyMHji9NRhiLpfsgZ4LOBy
JfMRpMqMmAbPQMrvE8bICOnGzMaj2H7l6mTDmW1cGTMlDTGoYdHQEfUrcG8+dLKW
5KxYBWdFHsYUHqYaJ2Z1gASeJcAB4SJ5B02fCNYVbBP4XPP74XFVDDhrTe6n0vc7
8HaJuuRtaGgPKz+tJxaoE+sySs8BFgGb5Bj7ErWM0CneoL2pW9zuJQLlM4tS44xQ
aXe3JjcFpVgk/IqaoGOZT/IiaHV9PXh98B+hHdSPTzzoviZ8GmCeKY3lIEMd4ryM
8ZQ7bMRLIyPd9Q/96ZJFGtoXEKSnKGBmXy1T0nLaKxIkw4BOLSc9Vel1Ehx1V7Hk
A9u9Rg4O43QFbMIsZQ+jcoWhRBWA/CvbCBxWRBxH/z2fEmAx6NkT/Zih0uIZy4AW
8sZ56BYaO5HEv19W9tEuZOva7ELd+yJ1CogxVAgL7tzB3R3P+K+b5RWfDycd2psS
mGFXakJO1egtbMm3aO85UM7uA/0Ao/8wec/pKNv333GEYlXUbY2dc7vEP2HK8M9d
JCVTii8LbB6T/VFZ2UyQ
=toS1
-----END PGP SIGNATURE-----

--boAH8PqvUi1v1f55--
