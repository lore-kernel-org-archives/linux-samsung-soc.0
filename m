From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS4: Setup consistent dma size at boot time
Date: Thu, 13 Oct 2011 10:34:15 +0530
Message-ID: <4E96714F.3030207@linaro.org>
References: <1315806945-3102-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:43119 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214Ab1JMFEY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Oct 2011 01:04:24 -0400
Received: by qyk7 with SMTP id 7so790215qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Oct 2011 22:04:23 -0700 (PDT)
In-Reply-To: <1315806945-3102-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, Jon Medhurst <tixy@yxit.co.uk>

Hi Kukjin,

On Monday 12 September 2011 11:25 AM, Tushar Behera wrote:
> Some of the boards under mach-exynos4 initialize frame-buffers
> for which the memory requirement is more than 2MB (Nuri board requires
> around 4MB, Origen requires around 2.6MB), hence the default dma pool
> allocation size of 2MB is not sufficient. The consistent dma size is
> hence increased to successfully allocate memory for those boards.
>
> Depends on "ARM: Add init_consistent_dma_size()"
> by Jon Medhurst (99d1717dd7fecf2b10195b0d864323b952b4eba0).
>
> CC: Jon Medhurst<tixy@yxit.co.uk>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
>   arch/arm/mach-exynos4/cpu.c |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index 2d8a40c..45d8bfa 100644
> --- a/arch/arm/mach-exynos4/cpu.c
> +++ b/arch/arm/mach-exynos4/cpu.c
> @@ -10,6 +10,7 @@
>
>   #include<linux/sched.h>
>   #include<linux/sysdev.h>
> +#include<linux/dma-mapping.h>
>
>   #include<asm/mach/map.h>
>   #include<asm/mach/irq.h>
> @@ -136,6 +137,7 @@ static void exynos4_idle(void)
>   void __init exynos4_map_io(void)
>   {
>   	iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
> +	init_consistent_dma_size(SZ_8M);
>
>   	/* initialize device information early */
>   	exynos4_default_sdhci0();

Would you please consider this patch for 3.2?

-- 
Tushar Behera
