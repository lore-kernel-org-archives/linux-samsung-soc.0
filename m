From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: CPUIDLE Support
Date: Tue, 15 Mar 2011 22:57:03 +0900
Message-ID: <011c01cbe318$df3d2e00$9db78a00$%kim@samsung.com>
References: <1299635302-27759-1-git-send-email-jc.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:55346 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757404Ab1CON5c (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Mar 2011 09:57:32 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LI300CCKQR7XD20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 22:57:07 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LI300GOEQR7AW@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Mar 2011 22:57:07 +0900 (KST)
In-reply-to: <1299635302-27759-1-git-send-email-jc.lee@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jaecheol Lee' <jc.lee@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, =?ks_c_5601-1987?B?udqw5rnOL01vYmlsZSBTL1cgUGxhdGZvcm0gTGFiKERNQw==?= =?ks_c_5601-1987?B?v6wpL0U1KMOlwNMpL7vvvLrA/MDa?= <kyungmin.park@samsung.com>

Jaecheol Lee wrote:
> 
> This patch supports cpuidle framework for EXYNOS4210. Currently,
> Only one idle state is possible to use, but more idle states can
> be added following by this patch.
> 
> Signed-off-by: Jaecheol Lee <jc.lee@samsung.com>
> ---
>  arch/arm/mach-exynos4/Makefile  |    1 +
>  arch/arm/mach-exynos4/cpuidle.c |   87
> +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/cpuidle.c
> 
> diff --git a/arch/arm/mach-exynos4/Makefile b/arch/arm/mach-
exynos4/Makefile
> index 461ae57..bf206fa 100644
> --- a/arch/arm/mach-exynos4/Makefile
> +++ b/arch/arm/mach-exynos4/Makefile
> @@ -16,6 +16,7 @@ obj-$(CONFIG_CPU_EXYNOS4210)	+= cpu.o init.o
clock.o
> irq-combiner.o
>  obj-$(CONFIG_CPU_EXYNOS4210)	+= cpu.o init.o clock.o irq-combiner.o
>  obj-$(CONFIG_CPU_EXYNOS4210)	+= setup-i2c0.o time.o gpiolib.o irq-eint.o
> dma.o
>  obj-$(CONFIG_CPU_FREQ)		+= cpufreq.o
> +obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> 
>  obj-$(CONFIG_SMP)		+= platsmp.o headsmp.o
>  obj-$(CONFIG_LOCAL_TIMERS)	+= localtimer.o
> diff --git a/arch/arm/mach-exynos4/cpuidle.c b/arch/arm/mach-
> exynos4/cpuidle.c
> new file mode 100644
> index 0000000..a543a18
> --- /dev/null
> +++ b/arch/arm/mach-exynos4/cpuidle.c
> @@ -0,0 +1,87 @@
> +/* linux/arch/arm/mach-exynos4/cpuidle.c
> + *
> + * Copyright (c) 2011 Samsung Electronics Co., Ltd.
> + *		http://www.samsung.com
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/cpuidle.h>
> +#include <linux/io.h>
> +
> +#include <asm/proc-fns.h>
> +
> +static int exynos4_enter_idle(struct cpuidle_device *dev,
> +			      struct cpuidle_state *state);
> +
> +static struct cpuidle_state exynos4_cpuidle_set[] = {
> +	[0] = {
> +		.enter			= exynos4_enter_idle,
> +		.exit_latency		= 1,
> +		.target_residency	= 100000,
> +		.flags			= CPUIDLE_FLAG_TIME_VALID,
> +		.name			= "IDLE",
> +		.desc			= "ARM clock gating(WFI)",
> +	},
> +};
> +
> +static DEFINE_PER_CPU(struct cpuidle_device, exynos4_cpuidle_device);
> +
> +static struct cpuidle_driver exynos4_idle_driver = {
> +	.name		= "exynos4_idle",
> +	.owner		= THIS_MODULE,
> +};
> +
> +static int exynos4_enter_idle(struct cpuidle_device *dev,
> +			      struct cpuidle_state *state)
> +{
> +	struct timeval before, after;
> +	int idle_time;
> +
> +	local_irq_disable();
> +	do_gettimeofday(&before);
> +
> +	cpu_do_idle();
> +
> +	do_gettimeofday(&after);
> +	local_irq_enable();
> +	idle_time = (after.tv_sec - before.tv_sec) * USEC_PER_SEC +
> +		    (after.tv_usec - before.tv_usec);
> +
> +	return idle_time;
> +}
> +
> +static int __init exynos4_init_cpuidle(void)
> +{
> +	int i, max_cpuidle_state, cpu_id;
> +	struct cpuidle_device *device;
> +
> +	cpuidle_register_driver(&exynos4_idle_driver);
> +
> +	for_each_cpu(cpu_id, cpu_online_mask) {
> +		device = &per_cpu(exynos4_cpuidle_device, cpu_id);
> +		device->cpu = cpu_id;
> +
> +		device->state_count = (sizeof(exynos4_cpuidle_set) /
> +					       sizeof(struct
cpuidle_state));
> +
> +		max_cpuidle_state = device->state_count;
> +
> +		for (i = 0; i < max_cpuidle_state; i++) {
> +			memcpy(&device->states[i], &exynos4_cpuidle_set[i],
> +					sizeof(struct cpuidle_state));
> +		}
> +
> +		if (cpuidle_register_device(device)) {
> +			printk(KERN_ERR "CPUidle register device
failed\n,");
> +			return -EIO;
> +		}
> +	}
> +	return 0;
> +}
> +
> +device_initcall(exynos4_init_cpuidle);
> --
> 1.7.1

Cc'ed Kyungmin Park.

Hmm...I'm thinking that we need more discussion on this CPUIDLE later,
about method, IDLE states and so on.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
