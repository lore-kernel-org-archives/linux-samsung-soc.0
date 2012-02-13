From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 4/6] ARM: EXYNOS: Add hsotg device for NURI board
Date: Mon, 13 Feb 2012 14:59:58 +0530
Message-ID: <4F38D816.8020500@linaro.org>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com> <1328870146-20312-5-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:64162 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141Ab2BMJaE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Feb 2012 04:30:04 -0500
Received: by yenm8 with SMTP id m8so2196076yen.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Feb 2012 01:30:03 -0800 (PST)
In-Reply-To: <1328870146-20312-5-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On 02/10/2012 04:05 PM, Lukasz Majewski wrote:
> From: Joonyoung Shim <jy0922.shim@samsung.com>
>=20
> This patch adds hsotg device to the NURI board.
>=20
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> [Rebased on the newest git/kgene/linux-samsung #for-next]
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-nuri.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/=
mach-nuri.c
> index 165c876..cd90ef2 100644
> --- a/arch/arm/mach-exynos/mach-nuri.c
> +++ b/arch/arm/mach-exynos/mach-nuri.c
> @@ -43,6 +43,7 @@
>  #include <plat/fb.h>
>  #include <plat/sdhci.h>
>  #include <plat/ehci.h>
> +#include <plat/udc-hs.h>
>  #include <plat/clock.h>
>  #include <plat/gpio-cfg.h>
>  #include <plat/iic.h>
> @@ -391,6 +392,7 @@ static struct regulator_consumer_supply __initdat=
a max8997_ldo1_[] =3D {
>  	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* Used by CPU's ADC drv */
>  };
>  static struct regulator_consumer_supply __initdata max8997_ldo3_[] =3D=
 {
> +	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* USB */
>  	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
>  };
>  static struct regulator_consumer_supply __initdata max8997_ldo4_[] =3D=
 {
> @@ -403,7 +405,7 @@ static struct regulator_consumer_supply __initdat=
a max8997_ldo7_[] =3D {
>  	REGULATOR_SUPPLY("dig_18", "0-001f"), /* HCD803 */
>  };
>  static struct regulator_consumer_supply __initdata max8997_ldo8_[] =3D=
 {
> -	REGULATOR_SUPPLY("vusb_d", NULL), /* Used by CPU */
> +	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"), /* USB */
>  	REGULATOR_SUPPLY("vdac", NULL), /* Used by CPU */
>  };
>  static struct regulator_consumer_supply __initdata max8997_ldo11_[] =
=3D {
> @@ -1115,6 +1117,9 @@ static void __init nuri_ehci_init(void)
>  	s5p_ehci_set_platdata(pdata);
>  }
> =20
> +/* USB OTG */
> +static struct s3c_hsotg_plat nuri_hsotg_pdata;
> +
>  /* CAMERA */
>  static struct regulator_consumer_supply cam_vdda_supply[] =3D {
>  	REGULATOR_SUPPLY("a_sensor", "0-001f"),
> @@ -1268,6 +1273,7 @@ static struct platform_device *nuri_devices[] _=
_initdata =3D {
>  	&exynos4_device_pd[PD_LCD0],
>  	&exynos4_device_pd[PD_CAM],
>  	&s5p_device_fimc_md,
> +	&s3c_device_usb_hsotg,
> =20
>  	/* NURI Devices */
>  	&nuri_gpio_keys,
> @@ -1312,6 +1318,7 @@ static void __init nuri_machine_init(void)
>  	nuri_camera_init();
> =20
>  	nuri_ehci_init();
> +	s3c_hsotg_set_platdata(&nuri_hsotg_pdata);
>  	clk_xusbxti.rate =3D 24000000;
> =20
>  	/* Last */
It is missing S3C_DEV_USB_HSOTG entry in Kconfig file for individual bo=
ards.

Additionally, after adding the same, the build fails with following
error message.

arch/arm/plat-samsung/devs.c:1442:8: error: =91IRQ_OTG=92 undeclared he=
re
(not in a function)
drivers/usb/gadget/s3c-hsotg.c:38:27: fatal error: mach/regs-sys.h: No
such file or directory
compilation terminated.

I had applied the patches at kgene's for-next branch while doing this
build-test.


--=20
Tushar Behera
