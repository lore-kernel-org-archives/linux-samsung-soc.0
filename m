Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EF3C3C1E
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Apr 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735848; cv=none; b=ftt486h54VMF+wuuJoMT4/L2viTRpVjWy2Ew870IKPEVN7iK1qH2hMTIw8ATVuWRTJ04ag7hxVe55N1sOftnJkUkV0LFg+8HcbeMvRYHaYadsjSe6X13ODqTtpN4Taesj8xK1MPSwOkY7mKqECbCMnbwNW3350B7mml/Ljovjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735848; c=relaxed/simple;
	bh=Ub59K2tMA8SS3jTO9Ll/rawyPG3dIfI5Ms434oWsw9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gsk0hR4eobzhbuVZT1r6egaKZoaDSXn1+jR/9ieA0YbllUviZXXpvEW4tNNMgSE0vOAiJ5nNtCuDy/SjZ0uHk9CQF6K5QjOq+C6M3En8UvTvmoJLdnaj2bZgC5kQTnPanC4DkZG4myRzxri5HRoxr/5oMGK3//BYik7TIGNIZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=m8px0pa4; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="m8px0pa4"
Date: Thu, 9 Apr 2026 13:57:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1775735843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BFGPXXDO5Qs7zdZxT8hLPVa+m/HFux3xI7M/xg68NOg=;
	b=m8px0pa4oDHJtsNk67FPcWrtxJeJL/+yzfNUBnSjINro0E7q9OFfyG/ExZxkJlUfT0UCyp
	VIvz7jjaM5Xexsc/01v4C0OlM6g9GaD4xP1pdkLi//MzTRoUVWd3NDV5mvsG9efNPSQKW6
	wugKQU0tfFHBsvSHy6lqhxXJR+ShYAo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
Message-ID: <20260409115630.GA15706@localhost>
References: <20260401-exynos850-cpuhotplug-v2-0-c5a760a3e259@linaro.org>
 <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-exynos850-cpuhotplug-v2-5-c5a760a3e259@linaro.org>
X-Migadu-Flow: FLOW_OUT

Hi Alexey,

This patch breaks compilation for arm(32) exynos devices. Compiling
with exynos_defconfig I get:

[ ... ]
  CC      drivers/soc/samsung/exynos850-pmu.o
  CC [M]  fs/squashfs/page_actor.o
../drivers/soc/samsung/exynos850-pmu.c:17:21: error: call to undeclared function 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   17 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                            ^
../drivers/soc/samsung/exynos850-pmu.c:17:42: error: call to undeclared function 'read_cpuid_mpidr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   17 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                                                 ^
../drivers/soc/samsung/exynos850-pmu.c:48:21: error: call to undeclared function 'MPIDR_AFFINITY_LEVEL'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   48 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                            ^
../drivers/soc/samsung/exynos850-pmu.c:48:42: error: call to undeclared function 'read_cpuid_mpidr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   48 |         u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
      |                                                 ^
4 errors generated.
make[6]: *** [../scripts/Makefile.build:289: drivers/soc/samsung/exynos850-pmu.o] Error 1
make[5]: *** [../scripts/Makefile.build:548: drivers/soc/samsung] Error 2
make[4]: *** [../scripts/Makefile.build:548: drivers/soc] Error 2
make[3]: *** [../scripts/Makefile.build:548: drivers] Error 2
make[3]: *** Waiting for unfinished jobs....
[ ... ]

Best regards,
Henrik Grimler

On Wed, Apr 01, 2026 at 05:51:58AM +0100, Alexey Klimov wrote:
> Add cpuhotplug support for Exynos850 platforms. This SoC requires
> its own specific set of writes/updates to PMU and PMU interrupts
> generation block in order to put a CPU or a group of CPUs into
> a different sleep states or prepare these entities for a CPU_OFF
> or wake-up out of idle state or after CPU online.
> Without these writes/updates the CPU(s) wake-up or online fails.
> While at this, also add description of Exynos850 PMU registers.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  drivers/soc/samsung/Makefile                |  2 +-
>  drivers/soc/samsung/exynos-pmu.c            |  1 +
>  drivers/soc/samsung/exynos-pmu.h            |  1 +
>  drivers/soc/samsung/exynos850-pmu.c         | 78 +++++++++++++++++++++++++++++
>  include/linux/soc/samsung/exynos-regs-pmu.h |  5 ++
>  5 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
> index 636a762608c9..7f544e3c1fcc 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -7,7 +7,7 @@ exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
>  obj-$(CONFIG_EXYNOS_USI)	+= exynos-usi.o
>  
>  obj-$(CONFIG_EXYNOS_PMU)	+= exynos_pmu.o
> -exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o
> +exynos_pmu-y			+= exynos-pmu.o gs101-pmu.o exynos850-pmu.o
>  
>  obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
>  					exynos5250-pmu.o exynos5420-pmu.o
> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> index 4e5fcc01e5e0..daa870ba88f5 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
> @@ -133,6 +133,7 @@ static const struct of_device_id exynos_pmu_of_device_ids[] = {
>  		.compatible = "samsung,exynos7-pmu",
>  	}, {
>  		.compatible = "samsung,exynos850-pmu",
> +		.data = &exynos850_pmu_data,
>  	},
>  	{ /*sentinel*/ },
>  };
> diff --git a/drivers/soc/samsung/exynos-pmu.h b/drivers/soc/samsung/exynos-pmu.h
> index 186299a049a8..4202d3cd94c9 100644
> --- a/drivers/soc/samsung/exynos-pmu.h
> +++ b/drivers/soc/samsung/exynos-pmu.h
> @@ -102,6 +102,7 @@ extern const struct exynos_pmu_data exynos5250_pmu_data;
>  extern const struct exynos_pmu_data exynos5420_pmu_data;
>  #endif
>  extern const struct exynos_pmu_data gs101_pmu_data;
> +extern const struct exynos_pmu_data exynos850_pmu_data;
>  
>  extern void pmu_raw_writel(u32 val, u32 offset);
>  extern u32 pmu_raw_readl(u32 offset);
> diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/exynos850-pmu.c
> new file mode 100644
> index 000000000000..b3841547577a
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos850-pmu.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026 Linaro Ltd.
> + *
> + * Exynos850 PMU support
> + */
> +
> +#include <linux/soc/samsung/exynos-pmu.h>
> +#include <linux/soc/samsung/exynos-regs-pmu.h>
> +#include <linux/regmap.h>
> +
> +#include "exynos-pmu.h"
> +
> +static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_context, unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +	unsigned int cpuhint = smp_processor_id();
> +	u32 reg, mask;
> +
> +	/* set cpu inform hint */
> +	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +		     CPU_INFORM_C2);
> +
> +	mask = BIT(cpu);
> +	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +			   mask, BIT(cpu));
> +
> +	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +		     reg & mask);
> +
> +	mask = (BIT(cpu + 8));
> +	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_UPEND, &reg);
> +	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP1_INTR_BID_CLEAR,
> +		     reg & mask);
> +
> +	regmap_update_bits(pmu_context->pmureg,
> +			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +			   1 << 3, 1 << 3);
> +	return 0;
> +}
> +
> +static int exynos850_cpu_pmu_online(struct exynos_pmu_context *pmu_context, unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	u32 this_cluster = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +	u32 cluster_cpu = MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +	unsigned int cpuhint = smp_processor_id();
> +	u32 reg, mask;
> +
> +	/* clear cpu inform hint */
> +	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +		     CPU_INFORM_CLEAR);
> +
> +	mask = BIT(cpu);
> +
> +	regmap_update_bits(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_ENABLE,
> +			   mask, (0 << cpu));
> +
> +	regmap_read(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_UPEND, &reg);
> +
> +	regmap_write(pmu_context->pmuintrgen, EXYNOS_GRP2_INTR_BID_CLEAR,
> +		     reg & mask);
> +
> +	regmap_update_bits(pmu_context->pmureg,
> +			   EXYNOS850_CLUSTER_CPU_INT_EN(this_cluster, cluster_cpu),
> +			   1 << 3, 0 << 3);
> +	return 0;
> +}
> +
> +const struct exynos_pmu_data exynos850_pmu_data = {
> +	.pmu_cpuhp = true,
> +	.cpu_pmu_offline = exynos850_cpu_pmu_offline,
> +	.cpu_pmu_online = exynos850_cpu_pmu_online,
> +};
> +
> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
> index 9c4d3da41dbf..93c4d724c8ea 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
> @@ -1015,6 +1015,11 @@
>  #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
>  #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
>  
> +/* Exynos850 PMU Alive */
> +#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
> +#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + ((cl * 0x400) + ((cpu) * 0x80)))
> +#define EXYNOS850_CLUSTER_CPU_INT_EN(cl, cpu)	(EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu) + 0x44)
> +
>  /* exynosautov920 */
>  #define EXYNOSAUTOV920_PHY_CTRL_USB20				(0x0710)
>  #define EXYNOSAUTOV920_PHY_CTRL_USB31				(0x0714)
> 
> -- 
> 2.51.0
> 
> 
