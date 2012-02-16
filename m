From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 06/12] ARM: S3C24XX: change the ARCH_S3C2410 to
 ARCH_S3C24XX
Date: Thu, 16 Feb 2012 11:21:13 +0200
Message-ID: <20120216092111.GJ1925@legolas.emea.dhcp.ti.com>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
 <1329346545-16373-7-git-send-email-kgene.kim@samsung.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Jl+DbTnyraiZ/loT"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog125.obsmtp.com ([74.125.149.153]:52635 "EHLO
	na3sys009aog125.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754794Ab2BPJVT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Feb 2012 04:21:19 -0500
Received: by mail-lpp01m010-f52.google.com with SMTP id y4so3465943lag.39
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Feb 2012 01:21:18 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1329346545-16373-7-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Chris Ball <cjb@laptop.org>, David Woodhouse <dwmw2@infradead.org>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@secretlab.ca>, Greg Kroah-Hartman <gregkh@suse.de>, Felipe Balbi <balbi@ti.com>, Florian Tobias Schandinat <FlorianSchandinat@gmx.de>, Wim Van Sebroeck <wim@iguana.be>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Russell King <rmk+kernel@arm.linux.org.uk>


--Jl+DbTnyraiZ/loT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 16, 2012 at 07:55:40AM +0900, Kukjin Kim wrote:
> This patch changes the ARCH name to "ARCH_S3C24XX" for Samsung
> S3C2410, S3C2412, S3C2413, S3C2416, S3C2440, S3C2442, S3C2443,
> and S3C2450 SoCs so that we can merge the mach-xxx directories
> and plat-s3c24xx dir. to just one mach-s3c24xx for them.
>=20
> I think this should be sent to upstream via samsung tree because
> this touches many samsung stuff.
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Chris Ball <cjb@laptop.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Cc: Felipe Balbi <balbi@ti.com>
> Cc: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
> Cc: Wim Van Sebroeck <wim@iguana.be>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Cc: Liam Girdwood <lrg@ti.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/Kconfig                      |   23 +++++++++++------------
>  arch/arm/Makefile                     |    2 +-
>  arch/arm/boot/compressed/head.S       |    2 +-
>  arch/arm/configs/mini2440_defconfig   |    2 +-
>  arch/arm/configs/s3c2410_defconfig    |    2 +-
>  arch/arm/configs/tct_hammer_defconfig |    2 +-
>  arch/arm/mach-s3c2410/Kconfig         |    2 +-
>  arch/arm/mach-s3c2412/Kconfig         |    4 ++--
>  arch/arm/mach-s3c2416/Kconfig         |    2 +-
>  arch/arm/mach-s3c2443/Kconfig         |    2 +-
>  arch/arm/plat-s3c24xx/Kconfig         |    6 +++---
>  arch/arm/plat-s3c24xx/Makefile        |    2 +-
>  arch/arm/plat-samsung/Kconfig         |    4 ++--
>  drivers/input/touchscreen/Kconfig     |    2 +-
>  drivers/leds/Kconfig                  |    2 +-
>  drivers/mmc/host/Kconfig              |    2 +-
>  drivers/mtd/nand/Kconfig              |    2 +-
>  drivers/rtc/Kconfig                   |    2 +-
>  drivers/spi/Kconfig                   |    2 +-
>  drivers/usb/Kconfig                   |    2 +-
>  drivers/usb/gadget/Kconfig            |    4 ++--

for the gadget part:

Acked-by: Felipe Balbi <balbi@ti.com>

--=20
balbi

--Jl+DbTnyraiZ/loT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPPMqHAAoJEIaOsuA1yqREkogP/0xHTitmJHalwElnpwdAgbAG
52IpRB33fdHKzEe1kRNyNKaFRDjFttmfGotHfFLMj7qxZkny5EHP9KfbLC+A0u4i
zWoGFOsWVL3IJYIrw6ISRVJ2mhzqjbUcEdzc5OLEAV9ofNTN9VZLLeeVswMvouZ1
rABJTMRz4cclmhk5hD6ZlCcJvviDegLsPvf614YmHp8aebIHHN0kZuPCAhF75sL8
chgLwNS+GUBYLrA08S45XSTW23f7bWgdUB3GVo7OKGACnbV1iHBfAZ6oVDhTk1eb
1lnbJsh/b48rjaXrS5oFq3z6W9zW9qIYJv9DzWM0KPyOHQoaae9M3V3CuQjBJmUl
akqIkRTZ5oAWeTdNSzu84ZsvHfVU4TZt2ktl2heO4+ozgyssYvmKYn8Z5ahuFVxh
0lRyJYERmsYuI7WFGcMdPCIlXZU1miRe+SBYe5it7c2dr4a+AI9NRFkKXJdKwdwF
S6eo1LSxKrlVuaOj0thPykYp5dmcCH1t5JvEnWavoittne0OoFIThVLeqGpTlCnb
6jVEukSassvKsAF0pGRqeu5qWvDPDR6Ola2TuPwlh8urKwansJWH6WTY5NQNTOVc
rf26FFUzlPMGysLPEnAEi1dGXwvcux0cZANIDHbABxUp0vxEJ6Zb5EV4kOsjflzO
Lf5lh4WX1rIaC1pIB++6
=BQ8n
-----END PGP SIGNATURE-----

--Jl+DbTnyraiZ/loT--
