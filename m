From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/2] ARM: Exynos: Hook up power domains to generic power
 domain infrastructure
Date: Wed, 28 Dec 2011 10:55:20 +0530
Message-ID: <CAJuYYwTPqCdgzK+bcikNiowHxq33yAuf6B695ZZfCp2pYooxEw@mail.gmail.com>
References: <1323704789-23923-1-git-send-email-thomas.abraham@linaro.org>
	<1323704789-23923-2-git-send-email-thomas.abraham@linaro.org>
	<1323704789-23923-3-git-send-email-thomas.abraham@linaro.org>
	<4EFA5154.9060606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:56295 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807Ab1L1FZV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 00:25:21 -0500
In-Reply-To: <4EFA5154.9060606@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, rjw@sisk.pl, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com, patches@linaro.org

Hi Sylwester,

On 28 December 2011 04:44, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hi Thomas,
>
> On 12/12/2011 04:46 PM, Thomas Abraham wrote:
>> The generic power domain infrastructure is used to control the power=
 domains
>> available on Exynos4. For non-dt platforms, the power domains are st=
atically
>> instantiated. For dt platforms, the power domain nodes found in the =
device
>> tree are instantiated.
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Cc: Rob Herring <rob.herring@calxeda.com>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
>> ---
>> This patch is mainly derived from Mark Brown's work on generic power=
 domain
>> support for s3c64xx platforms. The existing exynos4 power domain imp=
lementation
>> is not removed in this patch. The devices are not yet registered wit=
h the power
>> domains for non-dt platforms.
>>
>> =A0arch/arm/mach-exynos/Kconfig | =A0 =A01 +
>> =A0arch/arm/mach-exynos/pm.c =A0 =A0| =A0179 +++++++++++++++++++++++=
+++++++++++++++++++
>> =A02 files changed, 180 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kco=
nfig
>> index 0afcc3b..c1f77c7 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -29,6 +29,7 @@ config CPU_EXYNOS4210
>> =A0 =A0 =A0 default y
>> =A0 =A0 =A0 depends on ARCH_EXYNOS4
>> =A0 =A0 =A0 select SAMSUNG_DMADEV
>> + =A0 =A0 select PM_GENERIC_DOMAINS
>> =A0 =A0 =A0 select ARM_CPU_SUSPEND if PM
>> =A0 =A0 =A0 select S5P_PM if PM
>> =A0 =A0 =A0 select S5P_SLEEP if PM
>> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
>> index 4093fea..a471ea6 100644
>> --- a/arch/arm/mach-exynos/pm.c
>> +++ b/arch/arm/mach-exynos/pm.c
>> @@ -20,6 +20,10 @@
>> =A0#include <linux/io.h>
>> =A0#include <linux/err.h>
>> =A0#include <linux/clk.h>
>> +#include <linux/slab.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/delay.h>
>> +#include <linux/of_address.h>
>>
>> =A0#include <asm/cacheflush.h>
>> =A0#include <asm/hardware/cache-l2x0.h>
>> @@ -37,6 +41,13 @@
>> =A0#include <mach/pm-core.h>
>> =A0#include <mach/pmu.h>
>>
>> +struct exynos4_pm_domain {
>> + =A0 =A0 void __iomem *base;
>> + =A0 =A0 char const *name;
>> + =A0 =A0 bool is_off;
>> + =A0 =A0 struct generic_pm_domain pd;
>> +};
>> +
>> =A0static struct sleep_save exynos4_set_clksrc[] =3D {
>> =A0 =A0 =A0 { .reg =3D S5P_CLKSRC_MASK_TOP =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0, .val =3D 0x00000001, },
>> =A0 =A0 =A0 { .reg =3D S5P_CLKSRC_MASK_CAM =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0, .val =3D 0x11111111, },
>> @@ -285,12 +296,172 @@ static struct sysdev_driver exynos4_pm_driver=
 =3D {
>> =A0 =A0 =A0 .add =A0 =A0 =A0 =A0 =A0 =A0=3D exynos4_pm_add,
>> =A0};
>>
>> +static int exynos4_pd_power_on(struct generic_pm_domain *domain)
>> +{
>> + =A0 =A0 struct exynos4_pm_domain *pd;
>> + =A0 =A0 void __iomem *base;
>> + =A0 =A0 u32 timeout;
>> +
>> + =A0 =A0 pd =3D container_of(domain, struct exynos4_pm_domain, pd);
>> + =A0 =A0 base =3D pd->base;
>> +
>> + =A0 =A0 __raw_writel(S5P_INT_LOCAL_PWR_EN, base);
>> +
>> + =A0 =A0 /* Wait max 1ms */
>> + =A0 =A0 timeout =3D 10;
>> + =A0 =A0 while ((__raw_readl(base + 0x4) & S5P_INT_LOCAL_PWR_EN)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 !=3D S5P_INT_LOCAL_PWR_EN) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!timeout) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Power domain %s en=
able failed\n", domain->name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ETIMEDOUT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 timeout--;
>> + =A0 =A0 =A0 =A0 =A0 =A0 udelay(100);
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static int exynos4_pd_power_off(struct generic_pm_domain *domain)
>> +{
>> + =A0 =A0 struct exynos4_pm_domain *pd;
>> + =A0 =A0 void __iomem *base;
>> + =A0 =A0 u32 timeout;
>> +
>> + =A0 =A0 pd =3D container_of(domain, struct exynos4_pm_domain, pd);
>> + =A0 =A0 base =3D pd->base;
>> +
>> + =A0 =A0 __raw_writel(0, base);
>> +
>> + =A0 =A0 /* Wait max 1ms */
>> + =A0 =A0 timeout =3D 10;
>> + =A0 =A0 while (__raw_readl(base + 0x4) & S5P_INT_LOCAL_PWR_EN) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!timeout) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Power domain %s di=
sable failed\n", domain->name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ETIMEDOUT;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 timeout--;
>> + =A0 =A0 =A0 =A0 =A0 =A0 udelay(100);
>> + =A0 =A0 }
>> + =A0 =A0 return 0;
>> +}
>> +
>> +static struct exynos4_pm_domain exynos4_pd_mfc =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_MFC_CONF,
>> + =A0 =A0 .name =3D "pd-mfc",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct exynos4_pm_domain exynos4_pd_g3d =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_G3D_CONF,
>> + =A0 =A0 .name =3D "pd-g3d",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct exynos4_pm_domain exynos4_pd_lcd0 =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_LCD0_CONF,
>> + =A0 =A0 .name =3D "pd-lcd0",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct exynos4_pm_domain exynos4_pd_lcd1 =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_LCD1_CONF,
>> + =A0 =A0 .name =3D "pd-lcd1",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct exynos4_pm_domain exynos4_pd_tv =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_TV_CONF,
>> + =A0 =A0 .name =3D "pd-tv",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct exynos4_pm_domain exynos4_pd_cam =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_CAM_CONF,
>> + =A0 =A0 .name =3D "pd-cam",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>> +
>> +static struct exynos4_pm_domain exynos4_pd_gps =3D {
>> + =A0 =A0 .base =3D (void __iomem *)S5P_PMU_GPS_CONF,
>> + =A0 =A0 .name =3D "pd-gps",
>> + =A0 =A0 .pd =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_off =3D exynos4_pd_power_off,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .power_on =3D exynos4_pd_power_on,
>> + =A0 =A0 },
>> +};
>
> I'm not sure if arch/arm/mach-exynos/pm.c is the right place to add t=
his.
> IMHO it would be much better to put PD in separate file, pm-runtime.c
> or something like this.

Ok. I will move this to a new file pm-runtime.c.

>
> Can we assume various exynos versions will have same S5P_PMU_*_CONF
> addresses? For old s3c64xx SoCs such assumption could be valid but I'=
m
> a bit uncertain about Exynos series.

The addresses could be different, but it can be mapped to a
S5P_PMU_*_CONF. Maybe I did not understand your question here.

>
> IMHO the proper way to proceed would be to convert Samsung power doma=
ins
> to generic power domains and then add device tree support. Rather tha=
n

Yes, this patchset is intended to replace Samsung specific power
domains with generic power domains.

> doing a sort of work around. Much of the conversion to genpd work hav=
e
> been already done [1]. We would perhaps just need to drop the clock g=
ating
> as there seem to be no agreement about this.

Ok. Thanks for the link. I think I missed looking at this patch.

Thanks,
Thomas.

>
> [1]. http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/ms=
g07431.html
>
> --
>
> Thanks,
> Sylwester
