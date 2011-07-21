From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2] ARM: EXYNOS4: Add support for ORIGEN board
Date: Thu, 21 Jul 2011 10:02:28 +0530
Message-ID: <CAK9yfHzbfEMTdhBk21o2BXSo_doDmdi9Oh=fStZT5aQVeYsCxw@mail.gmail.com>
References: <1311220670-20395-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9134684322632245024=="
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1311220670-20395-1-git-send-email-tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, snow.jhkim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

--===============9134684322632245024==
Content-Type: multipart/alternative; boundary=001485e7c6fc28c57904a88cd6c0

--001485e7c6fc28c57904a88cd6c0
Content-Type: text/plain; charset=ISO-8859-1

On 21 July 2011 09:27, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> From: JeongHyeon Kim <jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org>
>
> Insignal's ORIGEN board is based Samsung EXYNOS4210 SoC.
>
> Signed-off-by: JeongHyeon Kim <jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org>
> Signed-off-by: Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>
> Changes for V2:
>  - Reworked based on Kukjin's comments and rebased to kgene/for-next
>
>  arch/arm/mach-exynos4/Kconfig       |   10 +++
>  arch/arm/mach-exynos4/Makefile      |    1 +
>  arch/arm/mach-exynos4/mach-origen.c |  108
> +++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/mach-origen.c
>
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 52fc172..012c034 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -205,6 +205,16 @@ config MACH_NURI
>        help
>          Machine support for Samsung Mobile NURI Board.
>
> +config MACH_ORIGEN
> +       bool "ORIGEN"
> +       select CPU_EXYNOS4210
> +       select S3C_DEV_RTC
> +       select S3C_DEV_WDT
> +       select S3C_DEV_HSMMC2
> +       select EXYNOS4_SETUP_SDHCI
> +       help
> +         Machine support for ORIGEN based on Samsung S5PV310
>
Use Exynos4(210) instead of S5PV310.

> +
>  endmenu
>
>  comment "Configuration for HSMMC bus width"
> diff --git a/arch/arm/mach-exynos4/Makefile
> b/arch/arm/mach-exynos4/Makefile
> index 2a0b682..ebec49c 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_MACH_SMDKV310)           += mach-smdkv310.o
>  obj-$(CONFIG_MACH_ARMLEX4210)          += mach-armlex4210.o
>  obj-$(CONFIG_MACH_UNIVERSAL_C210)      += mach-universal_c210.o
>  obj-$(CONFIG_MACH_NURI)                        += mach-nuri.o
> +obj-$(CONFIG_MACH_ORIGEN)              += mach-origen.o
>
>  # device support
>
> diff --git a/arch/arm/mach-exynos4/mach-origen.c
> b/arch/arm/mach-exynos4/mach-origen.c
> new file mode 100644
> index 0000000..ed59f86
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/mach-origen.c
> @@ -0,0 +1,108 @@
> +/* linux/arch/arm/mach-exynos4/mach-origen.c
> + *
> + * Copyright (c) 2011 Insignal Co., Ltd.
> + *             http://www.insignal.co.kr/
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/serial_core.h>
> +#include <linux/gpio.h>
> +#include <linux/mmc/host.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/input.h>
> +
> +#include <asm/mach/arch.h>
> +#include <asm/mach-types.h>
> +
> +#include <plat/regs-serial.h>
> +#include <plat/exynos4.h>
> +#include <plat/cpu.h>
> +#include <plat/devs.h>
> +#include <plat/sdhci.h>
> +#include <plat/iic.h>
> +
> +#include <mach/map.h>
> +
> +/* Following are default values for UCON, ULCON and UFCON UART registers
> */
> +#define ORIGEN_UCON_DEFAULT    (S3C2410_UCON_TXILEVEL |        \
> +                                S3C2410_UCON_RXILEVEL |        \
> +                                S3C2410_UCON_TXIRQMODE |       \
> +                                S3C2410_UCON_RXIRQMODE |       \
> +                                S3C2410_UCON_RXFIFO_TOI |      \
> +                                S3C2443_UCON_RXERR_IRQEN)
> +
> +#define ORIGEN_ULCON_DEFAULT   S3C2410_LCON_CS8
> +
> +#define ORIGEN_UFCON_DEFAULT   (S3C2410_UFCON_FIFOMODE |       \
> +                                S5PV210_UFCON_TXTRIG4 |        \
> +                                S5PV210_UFCON_RXTRIG4)
> +
> +static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
> +       [0] = {
> +               .hwport         = 0,
> +               .flags          = 0,
> +               .ucon           = ORIGEN_UCON_DEFAULT,
> +               .ulcon          = ORIGEN_ULCON_DEFAULT,
> +               .ufcon          = ORIGEN_UFCON_DEFAULT,
> +       },
> +       [1] = {
> +               .hwport         = 1,
> +               .flags          = 0,
> +               .ucon           = ORIGEN_UCON_DEFAULT,
> +               .ulcon          = ORIGEN_ULCON_DEFAULT,
> +               .ufcon          = ORIGEN_UFCON_DEFAULT,
> +       },
> +       [2] = {
> +               .hwport         = 2,
> +               .flags          = 0,
> +               .ucon           = ORIGEN_UCON_DEFAULT,
> +               .ulcon          = ORIGEN_ULCON_DEFAULT,
> +               .ufcon          = ORIGEN_UFCON_DEFAULT,
> +       },
> +       [3] = {
> +               .hwport         = 3,
> +               .flags          = 0,
> +               .ucon           = ORIGEN_UCON_DEFAULT,
> +               .ulcon          = ORIGEN_ULCON_DEFAULT,
> +               .ufcon          = ORIGEN_UFCON_DEFAULT,
> +       },
> +};
> +
> +static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
> +       .cd_type                = S3C_SDHCI_CD_GPIO,
> +       .ext_cd_gpio            = EXYNOS4_GPK2(2),
> +       .ext_cd_gpio_invert     = 1,
> +       .clk_type               = S3C_SDHCI_CLK_DIV_EXTERNAL,
> +};
> +
> +static struct platform_device *origen_devices[] __initdata = {
> +       &s3c_device_hsmmc2,
> +       &s3c_device_rtc,
> +       &s3c_device_wdt,
> +};
> +
> +static void __init origen_map_io(void)
> +{
> +       s5p_init_io(NULL, 0, S5P_VA_CHIPID);
> +       s3c24xx_init_clocks(24000000);
> +       s3c24xx_init_uarts(origen_uartcfgs, ARRAY_SIZE(origen_uartcfgs));
> +}
> +
> +static void __init origen_machine_init(void)
> +{
> +       s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
> +       platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
> +}
> +
> +MACHINE_START(ORIGEN, "ORIGEN")
> +       /* Maintainer: JeongHyeon Kim <jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org> */
> +       .boot_params    = S5P_PA_SDRAM + 0x100,
> +       .init_irq       = exynos4_init_irq,
> +       .map_io         = origen_map_io,
> +       .init_machine   = origen_machine_init,
> +       .timer          = &exynos4_timer,
> +MACHINE_END
> --
> 1.7.4.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>



-- 
With warm regards,
Sachin

--001485e7c6fc28c57904a88cd6c0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On 21 July 2011 09:27, Tushar Behera <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">tushar.beher=
a@linaro.org</a>&gt;</span> wrote:<br><blockquote style=3D"margin: 0px 0px =
0px 0.8ex; padding-left: 1ex; border-left-color: rgb(204, 204, 204); border=
-left-width: 1px; border-left-style: solid;" class=3D"gmail_quote">
From: JeongHyeon Kim &lt;<a href=3D"mailto:jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org">jhkim@insi=
gnal.co.kr</a>&gt;<br>
<br>
Insignal&#39;s ORIGEN board is based Samsung EXYNOS4210 SoC.<br>
<br>
Signed-off-by: JeongHyeon Kim &lt;<a href=3D"mailto:jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org">j=
hkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org</a>&gt;<br>
Signed-off-by: Tushar Behera &lt;<a href=3D"mailto:tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org=
">tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;<br>
---<br>
<br>
Changes for V2:<br>
=A0- Reworked based on Kukjin&#39;s comments and rebased to kgene/for-next<=
br>
<br>
=A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 | =A0 10 +++<br>
=A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0| =A0 =A01 +<br>
=A0arch/arm/mach-exynos4/mach-origen.c | =A0108 +++++++++++++++++++++++++++=
++++++++<br>
=A03 files changed, 119 insertions(+), 0 deletions(-)<br>
=A0create mode 100644 arch/arm/mach-exynos4/mach-origen.c<br>
<br>
diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig<=
br>
index 52fc172..012c034 100644<br>
--- a/arch/arm/mach-exynos4/Kconfig<br>
+++ b/arch/arm/mach-exynos4/Kconfig<br>
@@ -205,6 +205,16 @@ config MACH_NURI<br>
 =A0 =A0 =A0 =A0help<br>
 =A0 =A0 =A0 =A0 =A0Machine support for Samsung Mobile NURI Board.<br>
<br>
+config MACH_ORIGEN<br>
+ =A0 =A0 =A0 bool &quot;ORIGEN&quot;<br>
+ =A0 =A0 =A0 select CPU_EXYNOS4210<br>
+ =A0 =A0 =A0 select S3C_DEV_RTC<br>
+ =A0 =A0 =A0 select S3C_DEV_WDT<br>
+ =A0 =A0 =A0 select S3C_DEV_HSMMC2<br>
+ =A0 =A0 =A0 select EXYNOS4_SETUP_SDHCI<br>
+ =A0 =A0 =A0 help<br>
+ =A0 =A0 =A0 =A0 Machine support for ORIGEN based on Samsung S5PV310<br></=
blockquote><div>Use Exynos4(210)=A0instead of S5PV310.</div><blockquote sty=
le=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; border-left-color: rgb(=
204, 204, 204); border-left-width: 1px; border-left-style: solid;" class=3D=
"gmail_quote">

+<br>
=A0endmenu<br>
<br>
=A0comment &quot;Configuration for HSMMC bus width&quot;<br>
diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/Makefil=
e<br>
index 2a0b682..ebec49c 100644<br>
--- a/arch/arm/mach-exynos4/Makefile<br>
+++ b/arch/arm/mach-exynos4/Makefile<br>
@@ -31,6 +31,7 @@ obj-$(CONFIG_MACH_SMDKV310) =A0 =A0 =A0 =A0 =A0 +=3D mach=
-smdkv310.o<br>
=A0obj-$(CONFIG_MACH_ARMLEX4210) =A0 =A0 =A0 =A0 =A0+=3D mach-armlex4210.o<=
br>
=A0obj-$(CONFIG_MACH_UNIVERSAL_C210) =A0 =A0 =A0+=3D mach-universal_c210.o<=
br>
=A0obj-$(CONFIG_MACH_NURI) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=
=3D mach-nuri.o<br>
+obj-$(CONFIG_MACH_ORIGEN) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D mach-origen.o<br=
>
<br>
=A0# device support<br>
<br>
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/ma=
ch-origen.c<br>
new file mode 100644<br>
index 0000000..ed59f86<br>
--- /dev/null<br>
+++ b/arch/arm/mach-exynos4/mach-origen.c<br>
@@ -0,0 +1,108 @@<br>
+/* linux/arch/arm/mach-exynos4/mach-origen.c<br>
+ *<br>
+ * Copyright (c) 2011 Insignal Co., Ltd.<br>
+ * =A0 =A0 =A0 =A0 =A0 =A0 <a href=3D"http://www.insignal.co.kr/" target=
=3D"_blank">http://www.insignal.co.kr/</a><br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License version 2 as<br>
+ * published by the Free Software Foundation.<br>
+*/<br>
+<br>
+#include &lt;linux/serial_core.h&gt;<br>
+#include &lt;linux/gpio.h&gt;<br>
+#include &lt;linux/mmc/host.h&gt;<br>
+#include &lt;linux/platform_device.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+#include &lt;linux/input.h&gt;<br>
+<br>
+#include &lt;asm/mach/arch.h&gt;<br>
+#include &lt;asm/mach-types.h&gt;<br>
+<br>
+#include &lt;plat/regs-serial.h&gt;<br>
+#include &lt;plat/exynos4.h&gt;<br>
+#include &lt;plat/cpu.h&gt;<br>
+#include &lt;plat/devs.h&gt;<br>
+#include &lt;plat/sdhci.h&gt;<br>
+#include &lt;plat/iic.h&gt;<br>
+<br>
+#include &lt;mach/map.h&gt;<br>
+<br>
+/* Following are default values for UCON, ULCON and UFCON UART registers *=
/<br>
+#define ORIGEN_UCON_DEFAULT =A0 =A0(S3C2410_UCON_TXILEVEL | =A0 =A0 =A0 =
=A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UC=
ON_RXILEVEL | =A0 =A0 =A0 =A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UC=
ON_TXIRQMODE | =A0 =A0 =A0 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UC=
ON_RXIRQMODE | =A0 =A0 =A0 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2410_UC=
ON_RXFIFO_TOI | =A0 =A0 =A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S3C2443_UC=
ON_RXERR_IRQEN)<br>
+<br>
+#define ORIGEN_ULCON_DEFAULT =A0 S3C2410_LCON_CS8<br>
+<br>
+#define ORIGEN_UFCON_DEFAULT =A0 (S3C2410_UFCON_FIFOMODE | =A0 =A0 =A0 \<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_UF=
CON_TXTRIG4 | =A0 =A0 =A0 =A0\<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_UF=
CON_RXTRIG4)<br>
+<br>
+static struct s3c2410_uartcfg origen_uartcfgs[] __initdata =3D {<br>
+ =A0 =A0 =A0 [0] =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ORIGEN_UCON_DEF=
AULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_ULCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_UFCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 [1] =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 1,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ORIGEN_UCON_DEF=
AULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_ULCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_UFCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 [2] =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 2,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ORIGEN_UCON_DEF=
AULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_ULCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_UFCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 },<br>
+ =A0 =A0 =A0 [3] =3D {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .hwport =A0 =A0 =A0 =A0 =3D 3,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ucon =A0 =A0 =A0 =A0 =A0 =3D ORIGEN_UCON_DEF=
AULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ulcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_ULCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ufcon =A0 =A0 =A0 =A0 =A0=3D ORIGEN_UFCON_DE=
FAULT,<br>
+ =A0 =A0 =A0 },<br>
+};<br>
+<br>
+static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata =3D {<br>
+ =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI_CD_GPIO=
,<br>
+ =A0 =A0 =A0 .ext_cd_gpio =A0 =A0 =A0 =A0 =A0 =A0=3D EXYNOS4_GPK2(2),<br>
+ =A0 =A0 =A0 .ext_cd_gpio_invert =A0 =A0 =3D 1,<br>
+ =A0 =A0 =A0 .clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_DIV_E=
XTERNAL,<br>
+};<br>
+<br>
+static struct platform_device *origen_devices[] __initdata =3D {<br>
+ =A0 =A0 =A0 &amp;s3c_device_hsmmc2,<br>
+ =A0 =A0 =A0 &amp;s3c_device_rtc,<br>
+ =A0 =A0 =A0 &amp;s3c_device_wdt,<br>
+};<br>
+<br>
+static void __init origen_map_io(void)<br>
+{<br>
+ =A0 =A0 =A0 s5p_init_io(NULL, 0, S5P_VA_CHIPID);<br>
+ =A0 =A0 =A0 s3c24xx_init_clocks(24000000);<br>
+ =A0 =A0 =A0 s3c24xx_init_uarts(origen_uartcfgs, ARRAY_SIZE(origen_uartcfg=
s));<br>
+}<br>
+<br>
+static void __init origen_machine_init(void)<br>
+{<br>
+ =A0 =A0 =A0 s3c_sdhci2_set_platdata(&amp;origen_hsmmc2_pdata);<br>
+ =A0 =A0 =A0 platform_add_devices(origen_devices, ARRAY_SIZE(origen_device=
s));<br>
+}<br>
+<br>
+MACHINE_START(ORIGEN, &quot;ORIGEN&quot;)<br>
+ =A0 =A0 =A0 /* Maintainer: JeongHyeon Kim &lt;<a href=3D"mailto:jhkim@ins=
ignal.co.kr">jhkim-l017aS1Txqb0CLH3JO92LQ@public.gmane.org</a>&gt; */<br>
+ =A0 =A0 =A0 .boot_params =A0 =A0=3D S5P_PA_SDRAM + 0x100,<br>
+ =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D exynos4_init_irq,<br>
+ =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D origen_map_io,<br>
+ =A0 =A0 =A0 .init_machine =A0 =3D origen_machine_init,<br>
+ =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &amp;exynos4_timer,<br>
+MACHINE_END<br>
--<br>
1.7.4.1<br>
<font color=3D"#888888"><br>
--<br>
To unsubscribe from this list: send the line &quot;unsubscribe linux-samsun=
g-soc&quot; in<br>
the body of a message to <a href=3D"mailto:majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org">major=
domo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org</a><br>
More majordomo info at =A0<a href=3D"http://vger.kernel.org/majordomo-info.=
html" target=3D"_blank">http://vger.kernel.org/majordomo-info.html</a><br>
</font></blockquote></div><br><br clear=3D"all"><br>-- <br><div>With warm r=
egards,</div>
<div>Sachin</div><br>

--001485e7c6fc28c57904a88cd6c0--


--===============9134684322632245024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linaro-dev mailing list
linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
http://lists.linaro.org/mailman/listinfo/linaro-dev

--===============9134684322632245024==--
