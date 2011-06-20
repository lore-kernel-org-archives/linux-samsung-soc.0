From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 6/6] arm: exynos4: Add a new Exynos4 device tree enabled machine
Date: Mon, 20 Jun 2011 10:55:54 -0600
Message-ID: <BANLkTinaXg+_4xQiMCUw-aeGFeZs1iNuCQ@mail.gmail.com>
References: <1308567752-13451-1-git-send-email-thomas.abraham@linaro.org> <1308567752-13451-7-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:36039 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751507Ab1FTQ4P convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Jun 2011 12:56:15 -0400
Received: by yia27 with SMTP id 27so2159673yia.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2011 09:56:14 -0700 (PDT)
In-Reply-To: <1308567752-13451-7-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Mon, Jun 20, 2011 at 5:02 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Basic Exynos4 machine with device tree support that can boot on a Exy=
nos4
> based smdkv310 board and bring up the console.
>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> =A0Documentation/devicetree/bindings/arm/samsung.txt | =A0 =A03 +-
> =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 11 +++
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0| =A0 =A01 +
> =A0arch/arm/mach-exynos4/mach-exynos4-dt.c =A0 =A0 =A0 =A0 =A0 | =A0 =
94 +++++++++++++++++++++
> =A04 files changed, 108 insertions(+), 1 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/mach-exynos4-dt.c
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung.txt b/Docu=
mentation/devicetree/bindings/arm/samsung.txt
> index 594cb97..80d29bb 100644
> --- a/Documentation/devicetree/bindings/arm/samsung.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung.txt
> @@ -4,6 +4,7 @@ Samsung Exynos4 S5PV310 SoC based SMDKV310 eval board
> =A0 =A0 Samsung's Exynos4 family of application processors.
>
> =A0Required root node properties:
> - =A0 =A0- compatible =3D "samsung,smdkv310","samsung,s5pv310"
> + =A0 =A0- compatible =3D "samsung,smdkv310","samsung,s5pv310", "sams=
ung,exynos4210'.
> =A0 =A0 =A0 =A0 (a) "samsung,smdkv310" - for Samsung's SMDKV310 eval =
board.
> =A0 =A0 =A0 =A0 (b) "samsung,s5pv310" =A0- for boards based on S5PV31=
0 SoC.
> + =A0 =A0 =A0 (c) "samsung,exynos4210" - for boards based on Exynos42=
10 processor.
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kc=
onfig
> index 1435fc3..412e0c5 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -186,6 +186,17 @@ config MACH_NURI
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Machine support for Samsung Mobile NURI Board.
>
> +config MACH_EXYNOS4_DT
> + =A0 =A0 =A0 bool "Samsung's Exynos4 Machine with DT support"
> + =A0 =A0 =A0 select CPU_EXYNOS4210
> + =A0 =A0 =A0 select USE_OF
> + =A0 =A0 =A0 select S3C_DEV_WDT
> + =A0 =A0 =A0 select S3C_DEV_HSMMC
> + =A0 =A0 =A0 select S3C_DEV_HSMMC2
> + =A0 =A0 =A0 select EXYNOS4_SETUP_SDHCI
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for Samsung Exynos4 machine with de=
vice tree enabled.
> +
> =A0endmenu
>
> =A0comment "Configuration for HSMMC bus width"
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index 60fe5ec..6491e5b 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_MACH_SMDKV310) =A0 =A0 =A0 =A0 =A0 +=3D=
 mach-smdkv310.o
> =A0obj-$(CONFIG_MACH_ARMLEX4210) =A0 =A0 =A0 =A0 =A0+=3D mach-armlex4=
210.o
> =A0obj-$(CONFIG_MACH_UNIVERSAL_C210) =A0 =A0 =A0+=3D mach-universal_c=
210.o
> =A0obj-$(CONFIG_MACH_NURI) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D mach-nuri.o
> +obj-$(CONFIG_MACH_EXYNOS4_DT) =A0 =A0 =A0 =A0 =A0+=3D mach-exynos4-d=
t.o
>
> =A0# device support
>
> diff --git a/arch/arm/mach-exynos4/mach-exynos4-dt.c b/arch/arm/mach-=
exynos4/mach-exynos4-dt.c
> new file mode 100644
> index 0000000..34267d8
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/mach-exynos4-dt.c
> @@ -0,0 +1,94 @@
> +/*
> + * Samsung's Exynos4210 device tree enabled machine.
> + *
> + * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com
> + * Copyright (c) 2010-2011 Linaro Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 www.linaro.org
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/serial_core.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/of_platform.h>
> +#include <linux/irq.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/exynos4.h>
> +#include <plat/cpu.h>
> +#include <plat/sdhci.h>
> +
> +#include <mach/map.h>
> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc0_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_INTERNAL,
> + =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK=
_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 8,
> + =A0 =A0 =A0 .host_caps =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D MMC_CAP_8_BIT=
_DATA,
> +#endif
> +};
> +
> +static struct s3c_sdhci_platdata smdkv310_hsmmc2_pdata __initdata =3D=
 {
> + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_C=
D_INTERNAL,
> + =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK=
_DIV_EXTERNAL,
> +#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
> + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 8,
> + =A0 =A0 =A0 .host_caps =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D MMC_CAP_8_BIT=
_DATA,
> +#endif
> +};
> +
> +static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initco=
nst =3D {
> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(2)=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-sd=
hci.2", &s3c_hsmmc2_def_platdata),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s3c-sdhci", EXYNOS4_PA_HSMMC(0)=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s3c-sd=
hci.0", &s3c_hsmmc0_def_platdata),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s5pv210-uart", S5P_PA_UART0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s5pv21=
0-uart.0", NULL),
> + =A0 =A0 =A0 OF_DEV_AUXDATA("samsung,s5pv210-uart", S5P_PA_UART1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "s5pv21=
0-uart.1", NULL),
> + =A0 =A0 =A0 {},
> +};
> +
> +static void __init exynos4_dt_map_io(void)
> +{
> + =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> + =A0 =A0 =A0 s3c24xx_init_clocks(24000000);
> +}
> +
> +static const struct of_device_id intc_of_match[] __initconst =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,exynos4-gic", },
> + =A0 =A0 =A0 {}
> +};
> +
> +static void __init exynos4_dt_machine_init(void)
> +{
> + =A0 =A0 =A0 s3c_sdhci0_set_platdata(&smdkv310_hsmmc0_pdata);
> + =A0 =A0 =A0 s3c_sdhci2_set_platdata(&smdkv310_hsmmc2_pdata);

Are these two lines still necessary?

Otherwise, the patch looks good to me.

g.

> +
> + =A0 =A0 =A0 irq_domain_generate_simple(intc_of_match, EXYNOS4_PA_GI=
C_DIST, 0);
> + =A0 =A0 =A0 of_platform_populate(NULL, of_default_bus_match_table,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4=
_auxdata_lookup, NULL);
> +}
> +
> +static char const *exynos4_dt_compat[] __initdata =3D {
> + =A0 =A0 =A0 "samsung,exynos4210",
> + =A0 =A0 =A0 NULL
> +};
> +
> +DT_MACHINE_START(SMDKV310, "Samsung Exynos4 DT")
> + =A0 =A0 =A0 /* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D exynos4_init_irq,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D exynos4_dt_map_io,
> + =A0 =A0 =A0 .init_machine =A0 =3D exynos4_dt_machine_init,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &exynos4_timer,
> + =A0 =A0 =A0 .dt_compat =A0 =A0 =A0=3D exynos4_dt_compat,
> +MACHINE_END
> --
> 1.6.6.rc2
>
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev@lists.linaro.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
