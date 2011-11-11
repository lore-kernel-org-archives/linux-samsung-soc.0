From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH 3/3] ARM: EXYNOS4: Support ASV for Exynos4210
Date: Fri, 11 Nov 2011 10:47:44 +0900
Message-ID: <CAJ0PZbQJKzpyWgnNAP1VmKQuVc4O=uHOqU16kQ5eN+sv0pPAUA@mail.gmail.com>
References: <1320904083-19173-1-git-send-email-boyko.lee@samsung.com>
	<1320904083-19173-4-git-send-email-boyko.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:49486 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751504Ab1KKBrq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Nov 2011 20:47:46 -0500
Received: by bke11 with SMTP id 11so2889719bke.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Nov 2011 17:47:44 -0800 (PST)
In-Reply-To: <1320904083-19173-4-git-send-email-boyko.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jongpill Lee <boyko.lee@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, boyko.lee@gmail.com

On Thu, Nov 10, 2011 at 2:48 PM, Jongpill Lee <boyko.lee@samsung.com> w=
rote:
> This patch adds function for exynos4210's asv driver.
> On Exynos4210, we can get ASV result using by HPM and IDS value.
> If you want to use asv result on your driver, please define
> exynos_result_of_asv with extern.

Thank you! Looks much better with a variable than a register.
At least, it's now fully compatible with DVFS drivers. :)
I'll add a devfreq driver for Exynos4210 bus soon.

>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> ---
> =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A02 +-
> =A0arch/arm/mach-exynos4/asv-4210.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0339 +++++++++++++++++++++++
> =A0arch/arm/mach-exynos4/asv.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A09 +-
> =A0arch/arm/mach-exynos4/include/mach/asv.h =A0 =A0 =A0 =A0| =A0 =A03=
 +
> =A0arch/arm/mach-exynos4/include/mach/map.h =A0 =A0 =A0 =A0| =A0 =A02=
 +
> =A0arch/arm/mach-exynos4/include/mach/regs-clock.h | =A0 18 ++
> =A0arch/arm/mach-exynos4/include/mach/regs-iem.h =A0 | =A0 27 ++
> =A07 files changed, 397 insertions(+), 3 deletions(-)
> =A0create mode 100644 arch/arm/mach-exynos4/asv-4210.c
> =A0create mode 100644 arch/arm/mach-exynos4/include/mach/regs-iem.h
>
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-exynos4/M=
akefile
> index 587ce90..5422b01 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -18,7 +18,7 @@ obj-$(CONFIG_CPU_EXYNOS4210) =A0+=3D clock-exynos42=
10.o
> =A0obj-$(CONFIG_SOC_EXYNOS4212) =A0 +=3D clock-exynos4212.o
> =A0obj-$(CONFIG_PM) =A0 =A0 =A0 =A0 =A0 =A0 =A0 +=3D pm.o
> =A0obj-$(CONFIG_CPU_IDLE) =A0 =A0 =A0 =A0 +=3D cpuidle.o
> -obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ) =A0 +=3D asv.o
> +obj-$(CONFIG_ARM_EXYNOS4210_CPUFREQ) =A0 +=3D asv.o asv-4210.o
>
> =A0obj-$(CONFIG_SMP) =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D platsmp.o headsm=
p.o
>
> diff --git a/arch/arm/mach-exynos4/asv-4210.c b/arch/arm/mach-exynos4=
/asv-4210.c
> new file mode 100644
> index 0000000..1260ab8
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/asv-4210.c
> @@ -0,0 +1,339 @@
> +/* linux/arch/arm/mach-exynos/asv-4210.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * EXYNOS4210 - ASV(Adaptive Support Voltage) driver
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +
> +#include <plat/clock.h>
> +
> +#include <mach/regs-iem.h>
> +#include <mach/regs-clock.h>
> +#include <mach/asv.h>
> +
> +/*
> + * exynos_result_of_asv is result of ASV group.
> + * Using by this value, other driver can adjust voltage.
> + */
> +unsigned int exynos_result_of_asv;
> +
> +enum target_asv {
> + =A0 =A0 =A0 EXYNOS4210_1200,
> + =A0 =A0 =A0 EXYNOS4210_1400,
> + =A0 =A0 =A0 EXYNOS4210_SINGLE_1200,
> +};
> +
> +struct asv_judge_table exynos4210_1200_limit[] =3D {
> + =A0 =A0 =A0 /* HPM , IDS */
> + =A0 =A0 =A0 {8 , 4},
> + =A0 =A0 =A0 {11 , 8},
> + =A0 =A0 =A0 {14 , 12},
> + =A0 =A0 =A0 {18 , 17},
> + =A0 =A0 =A0 {21 , 27},
> + =A0 =A0 =A0 {23 , 45},
> + =A0 =A0 =A0 {25 , 55},
> +};
> +
> +static struct asv_judge_table exynos4210_1400_limit[] =3D {
> + =A0 =A0 =A0 /* HPM , IDS */
> + =A0 =A0 =A0 {13 , 8},
> + =A0 =A0 =A0 {17 , 12},
> + =A0 =A0 =A0 {22 , 32},
> + =A0 =A0 =A0 {26 , 52},
> +};
> +
> +static struct asv_judge_table exynos4210_single_1200_limit[] =3D {
> + =A0 =A0 =A0 /* HPM , IDS */
> + =A0 =A0 =A0 {8 , 4},
> + =A0 =A0 =A0 {14 , 12},
> + =A0 =A0 =A0 {21 , 27},
> + =A0 =A0 =A0 {25 , 55},
> +};
> +
> +static int exynos4210_asv_pre_clock_init(void)
> +{
> + =A0 =A0 =A0 struct clk *clk_hpm;
> + =A0 =A0 =A0 struct clk *clk_copy;
> + =A0 =A0 =A0 struct clk *clk_parent;
> +
> + =A0 =A0 =A0 /* PWI clock setting */
> + =A0 =A0 =A0 clk_copy =3D clk_get(NULL, "sclk_pwi");
> + =A0 =A0 =A0 if (IS_ERR(clk_copy))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_parent =3D clk_get(NULL, "xusbxti")=
;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(clk_parent)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(clk_copy);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (clk_set_parent(clk_copy, clk_parent=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(clk_parent);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 clk_set_rate(clk_copy, (48 * MHZ));
> +
> + =A0 =A0 =A0 clk_put(clk_copy);
> +
> + =A0 =A0 =A0 /* HPM clock setting */
> + =A0 =A0 =A0 clk_copy =3D clk_get(NULL, "dout_copy");
> + =A0 =A0 =A0 if (IS_ERR(clk_copy))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_parent =3D clk_get(NULL, "mout_mpll=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(clk_parent)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(clk_copy);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (clk_set_parent(clk_copy, clk_parent=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk_put(clk_parent);
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 clk_set_rate(clk_copy, (400 * MHZ));
> +
> + =A0 =A0 =A0 clk_put(clk_copy);
> +
> + =A0 =A0 =A0 clk_hpm =3D clk_get(NULL, "sclk_hpm");
> + =A0 =A0 =A0 if (IS_ERR(clk_hpm))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto clock_fail;
> +
> + =A0 =A0 =A0 clk_set_rate(clk_hpm, (200 * MHZ));
> +
> + =A0 =A0 =A0 clk_put(clk_hpm);
> +
> + =A0 =A0 =A0 return 0;
> +
> +clock_fail:
> + =A0 =A0 =A0 pr_err("EXYNOS4210: ASV: Clock init fail\n");
> +
> + =A0 =A0 =A0 return -EBUSY;
> +}
> +
> +static int exynos4210_asv_pre_clock_setup(void)
> +{
> + =A0 =A0 =A0 /* APLL_CON0 level register */
> + =A0 =A0 =A0 __raw_writel(0x80FA0601, S5P_APLL_CON0L8);
> + =A0 =A0 =A0 __raw_writel(0x80C80601, S5P_APLL_CON0L7);
> + =A0 =A0 =A0 __raw_writel(0x80C80602, S5P_APLL_CON0L6);
> + =A0 =A0 =A0 __raw_writel(0x80C80604, S5P_APLL_CON0L5);
> + =A0 =A0 =A0 __raw_writel(0x80C80601, S5P_APLL_CON0L4);
> + =A0 =A0 =A0 __raw_writel(0x80C80601, S5P_APLL_CON0L3);
> + =A0 =A0 =A0 __raw_writel(0x80C80601, S5P_APLL_CON0L2);
> + =A0 =A0 =A0 __raw_writel(0x80C80601, S5P_APLL_CON0L1);
> +
> + =A0 =A0 =A0 /* IEM Divider register */
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L8);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L7);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L6);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L5);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L4);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L3);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L2);
> + =A0 =A0 =A0 __raw_writel(0x00500000, S5P_CLKDIV_IEM_L1);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int exynos4210_find_group(struct samsung_asv *asv_info,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 enum target=
_asv exynos4_target)
> +{
> + =A0 =A0 =A0 unsigned int ret =3D 0;
> + =A0 =A0 =A0 unsigned int i;
> +
> + =A0 =A0 =A0 if (exynos4_target =3D=3D EXYNOS4210_1200) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ARRAY_SIZE(exynos4210_1200_limi=
t);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(exynos4210=
_1200_limit); i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (asv_info->hpm_resul=
t <=3D exynos4210_1200_limit[i].hpm_limit ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asv_info->ids_re=
sult <=3D exynos4210_1200_limit[i].ids_limit) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D=
 i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } else if (exynos4_target =3D=3D EXYNOS4210_1400) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ARRAY_SIZE(exynos4210_1400_limi=
t);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(exynos4210=
_1400_limit); i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (asv_info->hpm_resul=
t <=3D exynos4210_1400_limit[i].hpm_limit ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asv_info->ids_re=
sult <=3D exynos4210_1400_limit[i].ids_limit) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D=
 i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } else if (exynos4_target =3D=3D EXYNOS4210_SINGLE_1200=
) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ARRAY_SIZE(exynos4210_single_12=
00_limit);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(exynos4210=
_single_1200_limit); i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (asv_info->hpm_resul=
t <=3D exynos4210_single_1200_limit[i].hpm_limit ||
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asv_info->ids_re=
sult <=3D exynos4210_single_1200_limit[i].ids_limit) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D=
 i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +#define PACK_ID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A08
> +#define PACK_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x3
> +
> +#define SUPPORT_1400MHZ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(1 << 31)
> +#define SUPPORT_1200MHZ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(1 << 30)
> +#define SUPPORT_1000MHZ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0(1 << 29)
> +
> +static int exynos4210_get_hpm(struct samsung_asv *asv_info)
> +{
> + =A0 =A0 =A0 unsigned int i;
> + =A0 =A0 =A0 unsigned int tmp;
> + =A0 =A0 =A0 unsigned int hpm_delay =3D 0;
> + =A0 =A0 =A0 void __iomem *iem_base;
> +
> + =A0 =A0 =A0 iem_base =3D ioremap(EXYNOS4_PA_IEM, SZ_128K);
> +
> + =A0 =A0 =A0 if (!iem_base) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("EXYNOS4210: ASV: ioremap fail\n=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EPERM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Clock setting to get asv value */
> + =A0 =A0 =A0 if (!asv_info->pre_clock_init)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (asv_info->pre_clock_init())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* HPM enable =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(iem=
_base + EXYNOS4_APC_CONTROL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D APC_HPM_EN;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tmp, (iem_=
base + EXYNOS4_APC_CONTROL));
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 asv_info->pre_clock_set=
up();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* IEM enable */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(iem=
_base + EXYNOS4_IECDPCCR);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp |=3D IEC_EN;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(tmp, (iem_=
base + EXYNOS4_IECDPCCR));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Get HPM Delay value */
> + =A0 =A0 =A0 for (i =3D 0; i < EXYNOS4_LOOP_CNT; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readb(iem_base + EXYNOS4_=
APC_DBG_DLYCODE);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 hpm_delay +=3D tmp;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 hpm_delay /=3D EXYNOS4_LOOP_CNT;
> +
> + =A0 =A0 =A0 /* Store result of hpm value */
> + =A0 =A0 =A0 asv_info->hpm_result =3D hpm_delay;
> +
> + =A0 =A0 =A0 return 0;
> +
> +err:
> + =A0 =A0 =A0 pr_err("EXYNOS4210: ASV: Failt to get hpm function\n");
> +
> + =A0 =A0 =A0 iounmap(iem_base);
> +
> + =A0 =A0 =A0 return -EPERM;
> +}
> +
> +static int exynos4210_get_ids(struct samsung_asv *asv_info)
> +{
> + =A0 =A0 =A0 unsigned int pkg_id_val;
> +
> + =A0 =A0 =A0 if (!asv_info->ids_offset || !asv_info->ids_mask) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("EXYNOS4210: ASV: No ids_offset =
or No ids_mask\n");
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EPERM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pkg_id_val =3D __raw_readl(S5P_VA_CHIPID + 0x4);
> + =A0 =A0 =A0 asv_info->pkg_id =3D pkg_id_val;
> + =A0 =A0 =A0 asv_info->ids_result =3D ((pkg_id_val >> asv_info->ids_=
offset) &
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 asv_info->ids_mask);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int exynos4210_asv_store_result(struct samsung_asv *asv_info)
> +{
> + =A0 =A0 =A0 unsigned int result_grp;
> + =A0 =A0 =A0 char *support_freq;
> + =A0 =A0 =A0 unsigned int exynos_idcode =3D 0x0;
> +
> + =A0 =A0 =A0 exynos_result_of_asv =3D 0;
> +
> + =A0 =A0 =A0 exynos_idcode =3D __raw_readl(S5P_VA_CHIPID);
> +
> + =A0 =A0 =A0 /* Single chip is only support 1.2GHz */
> + =A0 =A0 =A0 if (!((exynos_idcode >> PACK_ID) & PACK_MASK)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp =3D exynos4210_find_group(as=
v_info, EXYNOS4210_SINGLE_1200);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp |=3D SUPPORT_1200MHZ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 support_freq =3D "1.2GHz";
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto set_reg;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Check support freq */
> + =A0 =A0 =A0 switch (asv_info->pkg_id & 0x7) {
> + =A0 =A0 =A0 /* Support 1.2GHz */
> + =A0 =A0 =A0 case 1:
> + =A0 =A0 =A0 case 7:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp =3D exynos4210_find_group(as=
v_info, EXYNOS4210_1200);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp |=3D SUPPORT_1200MHZ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 support_freq =3D "1.2GHz";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 /* Support 1.4GHz */
> + =A0 =A0 =A0 case 5:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp =3D exynos4210_find_group(as=
v_info, EXYNOS4210_1400);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp |=3D SUPPORT_1200MHZ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 support_freq =3D "1.4GHz";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 /* Defalut support 1.0GHz */
> + =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp =3D exynos4210_find_group(as=
v_info, EXYNOS4210_1200);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result_grp |=3D SUPPORT_1000MHZ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 support_freq =3D "1.0GHz";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 }
> +
> +set_reg:
> + =A0 =A0 =A0 exynos_result_of_asv =3D result_grp;
> +
> + =A0 =A0 =A0 pr_info("EXYNOS4: ASV: Support %s and Group is 0x%x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 support_freq, result_grp);
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +void exynos4210_asv_init(struct samsung_asv *asv_info)
> +{
> + =A0 =A0 =A0 pr_info("EXYNOS4210: Adaptive Support Voltage init\n");
> +
> + =A0 =A0 =A0 asv_info->ids_offset =3D 24;
> + =A0 =A0 =A0 asv_info->ids_mask =3D 0xFF;
> +
> + =A0 =A0 =A0 asv_info->get_ids =3D exynos4210_get_ids;
> + =A0 =A0 =A0 asv_info->get_hpm =3D exynos4210_get_hpm;
> + =A0 =A0 =A0 asv_info->pre_clock_init =3D exynos4210_asv_pre_clock_i=
nit;
> + =A0 =A0 =A0 asv_info->pre_clock_setup =3D exynos4210_asv_pre_clock_=
setup;
> + =A0 =A0 =A0 asv_info->store_result =3D exynos4210_asv_store_result;
> +}
> diff --git a/arch/arm/mach-exynos4/asv.c b/arch/arm/mach-exynos4/asv.=
c
> index b13d182..85d076e 100644
> --- a/arch/arm/mach-exynos4/asv.c
> +++ b/arch/arm/mach-exynos4/asv.c
> @@ -17,6 +17,8 @@
> =A0#include <linux/io.h>
> =A0#include <linux/slab.h>
>
> +#include <plat/cpu.h>
> +
> =A0#include <mach/map.h>
> =A0#include <mach/asv.h>
>
> @@ -26,9 +28,12 @@ static int __init exynos_asv_init(void)
> =A0{
> =A0 =A0 =A0 =A0exynos_asv =3D kzalloc(sizeof(struct samsung_asv), GFP=
_KERNEL);
> =A0 =A0 =A0 =A0if (!exynos_asv)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>
> - =A0 =A0 =A0 /* I will add asv driver of exynos4 series to regist */
> + =A0 =A0 =A0 if (soc_is_exynos4210())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exynos4210_asv_init(exynos_asv);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>
> =A0 =A0 =A0 =A0if (exynos_asv->check_vdd_arm) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (exynos_asv->check_vdd_arm())
> diff --git a/arch/arm/mach-exynos4/include/mach/asv.h b/arch/arm/mach=
-exynos4/include/mach/asv.h
> index 9a4a8f4..cd43c48 100644
> --- a/arch/arm/mach-exynos4/include/mach/asv.h
> +++ b/arch/arm/mach-exynos4/include/mach/asv.h
> @@ -14,6 +14,7 @@
> =A0#define __ASM_ARCH_ASV_H __FILE__
>
> =A0#define JUDGE_TABLE_END =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0NULL
> +#define EXYNOS4_LOOP_CNT =A0 =A0 =A0 =A0 =A0 =A0 =A0 10
>
> =A0struct asv_judge_table {
> =A0 =A0 =A0 =A0unsigned int hpm_limit; /* HPM value to decide group o=
f target */
> @@ -37,4 +38,6 @@ struct samsung_asv {
> =A0 =A0 =A0 =A0int (*store_result)(struct samsung_asv *asv_info);
> =A0};
>
> +extern void exynos4210_asv_init(struct samsung_asv *asv_info);
> +
> =A0#endif /* __ASM_ARCH_ASV_H */
> diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach=
-exynos4/include/mach/map.h
> index 918a979..81fa158 100644
> --- a/arch/arm/mach-exynos4/include/mach/map.h
> +++ b/arch/arm/mach-exynos4/include/mach/map.h
> @@ -60,6 +60,8 @@
>
> =A0#define EXYNOS4_PA_COMBINER =A0 =A0 =A0 =A0 =A0 =A00x10440000
>
> +#define EXYNOS4_PA_IEM =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x10460000
> +
> =A0#define EXYNOS4_PA_GIC_CPU =A0 =A0 =A0 =A0 =A0 =A0 0x10480000
> =A0#define EXYNOS4_PA_GIC_DIST =A0 =A0 =A0 =A0 =A0 =A00x10490000
>
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/a=
rm/mach-exynos4/include/mach/regs-clock.h
> index 6c37ebe..23ee10f 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
> @@ -130,6 +130,24 @@
> =A0#define S5P_CLKGATE_SCLKCPU =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x14=
800)
> =A0#define S5P_CLKGATE_IP_CPU =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x14=
900)
>
> +#define S5P_APLL_CON0L8 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x15100)
> +#define S5P_APLL_CON0L7 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x15104)
> +#define S5P_APLL_CON0L6 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x15108)
> +#define S5P_APLL_CON0L5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x1510C)
> +#define S5P_APLL_CON0L4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x15110)
> +#define S5P_APLL_CON0L3 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x15114)
> +#define S5P_APLL_CON0L2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x15118)
> +#define S5P_APLL_CON0L1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0S5P_CLKREG(0x1511C)
> +
> +#define S5P_CLKDIV_IEM_L8 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
300)
> +#define S5P_CLKDIV_IEM_L7 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
304)
> +#define S5P_CLKDIV_IEM_L6 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
308)
> +#define S5P_CLKDIV_IEM_L5 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
30C)
> +#define S5P_CLKDIV_IEM_L4 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
310)
> +#define S5P_CLKDIV_IEM_L3 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
314)
> +#define S5P_CLKDIV_IEM_L2 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
318)
> +#define S5P_CLKDIV_IEM_L1 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x15=
31C)
> +
> =A0#define S5P_APLL_LOCKTIME =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1C20) =A0 =
=A0 =A0 =A0/* 300us */
>
> =A0#define S5P_APLLCON0_ENABLE_SHIFT =A0 =A0 =A0(31)
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-iem.h b/arch/arm=
/mach-exynos4/include/mach/regs-iem.h
> new file mode 100644
> index 0000000..d9bf177
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/include/mach/regs-iem.h
> @@ -0,0 +1,27 @@
> +/* linux/arch/arm/mach-exynos/include/mach/regs-iem.h
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
> + *
> + * EXYNOS4 - IEM(INTELLIGENT ENERGY MANAGEMENT) register discription
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_REGS_IEM_H
> +#define __ASM_ARCH_REGS_IEM_H __FILE__
> +
> +/* Register for IEC =A0*/
> +#define EXYNOS4_IECDPCCR =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x00000)
> +
> +/* Register for APC */
> +#define EXYNOS4_APC_CONTROL =A0 =A0 =A0 =A0 =A0 =A0(0x10010)
> +#define EXYNOS4_APC_PREDLYSEL =A0 =A0 =A0 =A0 =A0(0x10024)
> +#define EXYNOS4_APC_DBG_DLYCODE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x10=
0E0)
> +
> +#define APC_HPM_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 << 4)
> +#define IEC_EN =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 <<=
 0)
> +
> +#endif /* __ASM_ARCH_REGS_IEM_H */
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
