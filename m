From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v7 1/4] ARM: EXYNOS: Add support for mapping PMU base
 address via DT
Date: Sun, 27 Jul 2014 05:33:19 +0200
Message-ID: <53D472FF.60009@suse.de>
References: <1404878455-31518-1-git-send-email-pankaj.dubey@samsung.com> <1404878455-31518-2-git-send-email-pankaj.dubey@samsung.com> <02d701cf9c45$ce481260$6ad83720$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:33284 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751681AbaG0DdY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Jul 2014 23:33:24 -0400
In-Reply-To: <02d701cf9c45$ce481260$6ad83720$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux@arm.linux.org.uk, t.figa@samsung.com, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com

Am 10.07.2014 15:49, schrieb Kukjin Kim:
> Pankaj Dubey wrote:
>>
>> Add support for mapping Samsung Power Management Unit (PMU)
>> base address from device tree.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
>> ---
>>  arch/arm/mach-exynos/common.h |    1 +
>>  arch/arm/mach-exynos/exynos.c |   37 ++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 38 insertions(+)
>>
>> diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/co=
mmon.h
>> index 152b464..f8daa9c 100644
>> --- a/arch/arm/mach-exynos/common.h
>> +++ b/arch/arm/mach-exynos/common.h
>> @@ -113,6 +113,7 @@ IS_SAMSUNG_CPU(exynos5800, EXYNOS5800_SOC_ID, EX=
YNOS5_SOC_MASK)
>>
>>  extern void __iomem *sysram_ns_base_addr;
>>  extern void __iomem *sysram_base_addr;
>> +extern void __iomem *pmu_base_addr;
>>  void exynos_sysram_init(void);
>>
>>  void exynos_firmware_init(void);
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/ex=
ynos.c
>> index 186f35d..173aac8 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>> +#include <linux/irqchip.h>
>>
>>  #include <asm/cacheflush.h>
>>  #include <asm/hardware/cache-l2x0.h>
>> @@ -31,6 +32,8 @@
>>  #include "regs-pmu.h"
>>  #include "regs-sys.h"
>>
>> +void __iomem *pmu_base_addr;
>> +
>>  static struct map_desc exynos4_iodesc[] __initdata =3D {
>>  	{
>>  		.virtual	=3D (unsigned long)S3C_VA_SYS,
>> @@ -253,6 +256,39 @@ static void __init exynos_init_io(void)
>>  	exynos_map_io();
>>  }
>>
>> +static const struct of_device_id exynos_dt_pmu_match[] =3D {
>> +	{ .compatible =3D "samsung,exynos3250-pmu" },
>> +	{ .compatible =3D "samsung,exynos4210-pmu" },
>> +	{ .compatible =3D "samsung,exynos4212-pmu" },
>> +	{ .compatible =3D "samsung,exynos4412-pmu" },
>> +	{ .compatible =3D "samsung,exynos5250-pmu" },
>> +	{ .compatible =3D "samsung,exynos5420-pmu" },
>> +	{ /*sentinel*/ },
>> +};
>> +
>> +static void exynos_map_pmu(void)
>> +{
>> +	struct device_node *np;
>> +
>> +	np =3D of_find_matching_node(NULL, exynos_dt_pmu_match);
>> +	if (np)
>> +		pmu_base_addr =3D of_iomap(np, 0);
>> +
>> +	if (!pmu_base_addr)
>> +		panic("failed to find exynos pmu register\n");
>> +}
>> +
>> +static void __init exynos_init_irq(void)
>> +{
>> +	irqchip_init();
>> +	/*
>> +	 * Since platsmp.c needs pmu base address by the time
>> +	 * DT is not unflatten so we can't use DT APIs before

Either "Since platsmp.c needs ... unflattened, we can't ..."
or "platsmp.c needs ... unflattened, so we can't ..."

>> +	 * init_irq
>> +	 */
>> +	exynos_map_pmu();
>> +}
>> +
>>  static void __init exynos_dt_machine_init(void)
>>  {
>>  	struct device_node *i2c_np;
>> @@ -336,6 +372,7 @@ DT_MACHINE_START(EXYNOS_DT, "SAMSUNG EXYNOS (Fla=
ttened Device Tree)")
>>  	.smp		=3D smp_ops(exynos_smp_ops),
>>  	.map_io		=3D exynos_init_io,
>>  	.init_early	=3D exynos_firmware_init,
>> +	.init_irq	=3D exynos_init_irq,
>>  	.init_machine	=3D exynos_dt_machine_init,
>>  	.init_late	=3D exynos_init_late,
>>  	.dt_compat	=3D exynos_dt_compat,
>> --
>> 1.7.9.5
>=20
> Looks good to me, will apply.

Unfortunately this broke the boot on ODROID-XU: Neither is there a
exynos_dt_pmu_match[] entry for 5410 nor is such a node defined in
exynos5410.dtsi. Not having access to a TRM, should 5410 get a node lik=
e
5420? Might SoCs beyond 5420 also require changes?

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
