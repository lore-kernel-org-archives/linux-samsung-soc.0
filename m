From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Tue, 6 Nov 2012 18:43:05 +0200
Message-ID: <20121106164304.GD3993@arwen.pp.htv.fi>
References: <1352215729-11703-1-git-send-email-gautam.vivek@samsung.com>
 <1352215729-11703-2-git-send-email-gautam.vivek@samsung.com>
Reply-To: <balbi@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:49840 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751326Ab2KFQtQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 11:49:16 -0500
Content-Disposition: inline
In-Reply-To: <1352215729-11703-2-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, balbi@ti.com, av.tikhomirov@samsung.com, yulgon.kim@samsung.com, thomas.abraham@linaro.org, p.paneri@samsung.com

--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 06, 2012 at 08:58:49PM +0530, Vivek Gautam wrote:
> Adding DWC3 device tree node for Exynos5250 along with the
> device address and clock support needed for the controller.
>=20
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi       |    6 ++++++
>  arch/arm/mach-exynos/clock-exynos5.c    |   24 ++++++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c  |    2 ++
>  drivers/usb/Kconfig                     |    1 +
>  5 files changed, 34 insertions(+), 0 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos=
5250.dtsi
> index cf6a02d..52bca54 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -68,6 +68,12 @@
>  		interrupts =3D <0 96 0>;
>  	};
> =20
> +	dwc3 {

shouldn't this be usb@12000000 ??

> +		compatible =3D "samsung,exynos-dwc3";
> +		reg =3D <0x12000000 0x10000>;
> +		interrupts =3D <0 72 0>;
> +	};
> +
>  	rtc {
>  		compatible =3D "samsung,s3c6410-rtc";
>  		reg =3D <0x101E0000 0x100>;
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-exynos/=
clock-exynos5.c
> index a88e0d9..ee094ee 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -740,6 +740,11 @@ static struct clk exynos5_init_clocks_off[] =3D {
>  		.enable		=3D exynos5_clk_ip_fsys_ctrl ,
>  		.ctrlbit	=3D (1 << 18),
>  	}, {
> +		.name		=3D "usbdrd30",
> +		.parent		=3D &exynos5_clk_aclk_200.clk,
> +		.enable		=3D exynos5_clk_ip_fsys_ctrl,
> +		.ctrlbit	=3D (1 << 19),
> +	}, {
>  		.name		=3D "usbotg",
>  		.enable		=3D exynos5_clk_ip_fsys_ctrl,
>  		.ctrlbit	=3D (1 << 7),
> @@ -1004,6 +1009,16 @@ struct clksrc_sources exynos5_clkset_group =3D {
>  	.nr_sources	=3D ARRAY_SIZE(exynos5_clkset_group_list),
>  };
> =20
> +struct clk *exynos5_clkset_usbdrd30_list[] =3D {
> +	[0] =3D &exynos5_clk_mout_mpll.clk,
> +	[1] =3D &exynos5_clk_mout_cpll.clk,

looks like [0] and [1] indexes are unnecessary ?!? Not sure about
mach-exynos' preferred array initialization style, though ;-)

> diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> index 4c90b51..0454b8a 100644
> --- a/drivers/usb/Kconfig
> +++ b/drivers/usb/Kconfig
> @@ -53,6 +53,7 @@ config USB_ARCH_HAS_EHCI
>  # some non-PCI HCDs implement xHCI
>  config USB_ARCH_HAS_XHCI
>  	boolean
> +	default y if ARCH_EXYNOS5

NAK, this should be done on your arch/arm/mach-exynos/Kconfig. Just
select USB_ARCH_HAS_XHCI.

--=20
balbi

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQmT4YAAoJEIaOsuA1yqREiZ0P/RlocdGNvhhI0Tt6JTm0nyEU
YEsT50lz8Qb+gcOs9/nHqUpVJa2F8a6fo438QoBmTVyEf+xyzTIDE8Wy/F2ZcIJI
hsqgQqC+urBM9K47YVkFLZbwM/6ISAF2qKkRHpseNykybdahR2xWlNRhfiCaLA9+
hNbfQHH3SFFcEajR/x/heYjsG1DDytOkVZO0hq4FLW0r+ZVzQNOFcmYGiEbFhM+2
fwmlg+3HlkCBMpktnaSMyeIbejutPAyn/Fmoegy/HSzRkQp/pHBz+uOKOVPzB9W+
iEb4g7mkHiLkhB2b4g2EKP4VriT6OzyCbZVTD7QwmPqEoAUKPW9Tn0nMTmWkLv+a
nWed+NSCIe7p4RElNZQR7LHE8FyTcMuz76bVDq4irKtZrcrDL/ghNh3B3IH/xLlN
YPLpK6bDOIwDixMj4nasit+iJjPXzIfN8A47X3Oag9NLFZh1bck6069fOxsxmUJm
DyCoD3PmWfphJkSwZAbjsM9OqZlZKJR5PD6uaQp7G1I/V/TowavAISYJlh4f7v3y
ATXFvlgBUH8uFxFug1E3iT/Ke0Mrbao4+omvLNtXsnRBj158YBxxqEc/yiWG/Wx2
97Xt2BEN3e7SN2LYB9hIF7kRa2yz2otLMeKQhNxiECAke1w9a9ypuDmeYd9LoZqi
OrCMTGxx2SWRCXLVWzep
=EzPA
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
