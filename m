From: Felipe Balbi <balbi@kernel.org>
Subject: Re: [BUG] Regression, usb-dwc3 not working, Odroid XU3, usb 3.0
Date: Mon, 04 Jul 2016 14:33:31 +0300
Message-ID: <87shvpljsk.fsf@linux.intel.com>
References: <577A47D3.7020900@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:56612 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751008AbcGDLeT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 07:34:19 -0400
In-Reply-To: <577A47D3.7020900@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Krzysztof Kozlowski <k.kozlowski@samsung.com> writes:

> Hi,
>
>
> Since three recent next releases (first on 20160630), on Odroid XU3 board
> the USB 3.0 host port (the only one) stopped working.
>
> This is a "samsung,exynos5250-dwusb3" (drivers/usb/dwc3/dwc3-exynos.c).
>
> Two issues here:
> 1. The port does not show up as USB 3.0 device.
> This one device is missing:
> 	Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>
> 2. The port does not work even for 2.0 devices (I didn't test 1.0).
>
>
> config: exynos_defconfig (ARM)
> DTS: exynos5422-odroidxu3.dts

apply [1] and try again. That commit is already in greg/usb-testing [2]
and it should trickle down to usb-next shortly.

[1] https://marc.info/?l=3Dlinux-usb&m=3D146728795330915&w=3D2
[2] https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=
=3Dusb-testing&id=3D322832f2f19e04c866a0ce4bdac8cff8e695f2b3

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXekmLAAoJEIaOsuA1yqREXr8P/0p1/p7CAL+tKN0ndbDa7pqy
RvOZGpzbeZk/BQ0xhw6xwVN6dEyZthp37Pe3RthGMU38kobrq/CQNnjuEclEXWwc
ifbZ20UYaTuGJYWW5xb9oogpY89XKCfe4AnM516yMM/2hT1JBa6GGmwi6v9HWc7h
JBnYIjuijmnZaVXrNIVLpWm3AVQu3Jv5CYHHzP5yz0CmxJ8wyAf5bFebJ4KPSAmx
ULd0GxMh2NgENsXw1TBKFG3cC3vcA/wfIxGXNMice1yyth3kXT7jMoBJ3SsoZIPI
efFh8A3yl26hbRxk3EZ/Y7Xihs6UJhyQbXIVByPsWyxTOrJflLyWkEbwlJb84HNZ
EKgjd4s+imZKALvWHQuEJt6rOrPO4DM9St2NtUGYwaXvJJaIKBvxDF4xgUsHQPYr
2FpCKD1YOH6UHTHyTyTDmrZdRtT7H96Vi31cCuanyi2uiSqfEl6CV8l8f6pLGkBQ
cajtHf9hK3a31IHB36SzsTSy4tOgDjo85Mk6XifeNk37ctU6kYoBLLErg3rvHKk8
0EhG2NUfdj1OCQh1dUps9tbYv116OPs1VWrVepEnCyFCLkNQPu1SX5zCBcUy6pyg
hgNa8SOs+0KfXMAci/mXTuZ/X3C9lCY3OR8OEV2GCMvlegqBgox/RImsK7N0LlzJ
yxyU2dKvplEUCJHm8wKb
=JZVC
-----END PGP SIGNATURE-----
--=-=-=--
