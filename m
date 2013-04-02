From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Use wfi macro in platform_do_lowpower
Date: Tue, 02 Apr 2013 13:59:36 +0530
Message-ID: <515A96F0.2090504@linaro.org>
References: <1362740988-16483-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:48120 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761313Ab3DBI3l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 04:29:41 -0400
Received: by mail-pb0-f41.google.com with SMTP id mc17so117430pbc.14
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Apr 2013 01:29:41 -0700 (PDT)
In-Reply-To: <1362740988-16483-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: linux@arm.linux.org.uk, kgene.kim@samsung.com, patches@linaro.org

Ping !!!

On 03/08/2013 04:39 PM, Tushar Behera wrote:
> As per commit b3377d186572 ("ARM: 7064/1: vexpress: Use wfi macro
> in platform_do_lowpower."), wfi macro should be used instead
> of the hardcoded WFI instruction.
> 
> This fixes following oops when the kernel is compiled in Thumb-2 mode
> on EXYNOS5. (Tested on EXYNOS5250 based Arndale board)
> 
> $ reboot
> Disabling non-boot CPUs ...
> IRQ153 no longer affine to CPU1
> CPU1: shutdown
> Internal error: Oops - undefined instruction: 0 [#1] PREEMPT SMP THUMB2
> Modules linked in:
> CPU: 1    Not tainted  (3.9.0-rc1-00015-gce76372 #1)
> PC is at 0xc065858e
> LR is at exynos_cpu_die+0x53/0xc0
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
>  arch/arm/mach-exynos/hotplug.c |    8 +-------
>  1 files changed, 1 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/hotplug.c b/arch/arm/mach-exynos/hotplug.c
> index c3f825b..d9712fe 100644
> --- a/arch/arm/mach-exynos/hotplug.c
> +++ b/arch/arm/mach-exynos/hotplug.c
> @@ -99,13 +99,7 @@ static inline void platform_do_lowpower(unsigned int cpu, int *spurious)
>  		if (cpu == 1)
>  			__raw_writel(0, S5P_ARM_CORE1_CONFIGURATION);
>  
> -		/*
> -		 * here's the WFI
> -		 */
> -		asm(".word	0xe320f003\n"
> -		    :
> -		    :
> -		    : "memory", "cc");
> +		wfi();
>  
>  		if (pen_release == cpu_logical_map(cpu)) {
>  			/*
> 


-- 
Tushar Behera
