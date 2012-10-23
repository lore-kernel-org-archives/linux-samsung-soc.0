From: =?EUC-KR?B?sei9wr/s?= <sw0312.kim@samsung.com>
Subject: Re: [PATCH v5] ARM: EXYNOS: Add MFC device tree support
Date: Tue, 23 Oct 2012 16:04:20 +0900
Message-ID: <50864174.3020508@samsung.com>
References: <1348765784-7508-1-git-send-email-arun.kk@samsung.com>
 <1348765784-7508-2-git-send-email-arun.kk@samsung.com>
Reply-To: sw0312.kim@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52748 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753450Ab2JWHEV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 03:04:21 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCC00BT23N8MKP0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 16:04:20 +0900 (KST)
Received: from [10.90.51.68] by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MCC00CGG3N7V770@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Oct 2012 16:04:20 +0900 (KST)
In-reply-to: <1348765784-7508-2-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arun Kumar K <arun.kk@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, k.debski@samsung.com, jtp.park@samsung.com, thomas.abraham@linaro.org, k.lewandowsk@samsung.com, s.nawrocki@samsung.com, ch.naveen@samsung.com, joshi@samsung.com

Hi Arun,

On 2012=B3=E2 09=BF=F9 28=C0=CF 02:09, Arun Kumar K wrote:
> This patch adds device tree entry for MFC v6 in the Exynos5
> SoC. Makes the required changes in the clock files and adds
> MFC to the DT device list.
>=20
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt          |   23 ++++++++++=
+++
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    5 +++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 +++
>  arch/arm/mach-exynos/Kconfig                       |    1 +
>  arch/arm/mach-exynos/clock-exynos5.c               |    2 +-
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |   16 +++++++++
>  arch/arm/plat-samsung/devs.c                       |    1 +
>  arch/arm/plat-samsung/include/plat/mfc.h           |   11 ++++++
>  arch/arm/plat-samsung/s5p-dev-mfc.c                |   34 ++++++++++=
++++++++++
>  9 files changed, 98 insertions(+), 1 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/s5p-mfc.t=
xt
>=20

<snip>

> diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-e=
xynos/mach-exynos5-dt.c
> index fee9dcd..b4ed43a 100644
> --- a/arch/arm/mach-exynos/mach-exynos5-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
> @@ -11,6 +11,8 @@
> =20
>  #include <linux/of_platform.h>
>  #include <linux/serial_core.h>
> +#include <linux/memblock.h>
> +#include <linux/of_fdt.h>
> =20
>  #include <asm/mach/arch.h>
>  #include <asm/hardware/gic.h>
> @@ -18,6 +20,7 @@
> =20
>  #include <plat/cpu.h>
>  #include <plat/regs-serial.h>
> +#include <plat/mfc.h>
> =20
>  #include "common.h"
> =20
> @@ -72,6 +75,7 @@ static const struct of_dev_auxdata exynos5250_auxda=
ta_lookup[] __initconst =3D {
>  				"exynos-gsc.2", NULL),
>  	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
>  				"exynos-gsc.3", NULL),
> +	OF_DEV_AUXDATA("samsung,mfc-v6", 0x11000000, "s5p-mfc-v6", NULL),
>  	{},
>  };
> =20
> @@ -92,6 +96,17 @@ static char const *exynos5250_dt_compat[] __initda=
ta =3D {
>  	NULL
>  };
> =20
> +static void __init exynos5_reserve(void)
> +{
> +	struct s5p_mfc_dt_meminfo mfc_mem;
> +
> +	/* Reserve memory for MFC only if it's available */
> +	mfc_mem.compatible =3D "samsung,mfc-v6";
> +	if (of_scan_flat_dt(s5p_fdt_find_mfc_mem, &mfc_mem))

of_scan_flat_dt() is called but it does not have __init on its
definition. So this causes section mismatch.

> +		s5p_mfc_reserve_mem(mfc_mem.roff, mfc_mem.rsize, mfc_mem.loff,
> +				mfc_mem.lsize);
> +}
> +
>  DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Flattened Device Tree=
)")
>  	/* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
>  	.init_irq	=3D exynos5_init_irq,
> @@ -102,4 +117,5 @@ DT_MACHINE_START(EXYNOS5_DT, "SAMSUNG EXYNOS5 (Fl=
attened Device Tree)")
>  	.timer		=3D &exynos4_timer,
>  	.dt_compat	=3D exynos5250_dt_compat,
>  	.restart        =3D exynos5_restart,
> +	.reserve	=3D exynos5_reserve,
>  MACHINE_END

<snip>


Best Regards,
- Seung-Woo Kim

--=20
Seung-Woo Kim
Samsung Software R&D Center
--
