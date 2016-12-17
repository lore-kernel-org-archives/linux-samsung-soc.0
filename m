From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v8 6/8] ARM: EXYNOS: remove secondary startup
 initialization from smp_prepare_cpus
Date: Sat, 17 Dec 2016 20:48:06 +0200
Message-ID: <20161217184806.GB30265@kozik-lap>
References: <1481375323-29724-1-git-send-email-pankaj.dubey@samsung.com>
 <1481375323-29724-7-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:36106 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751932AbcLQSsS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 17 Dec 2016 13:48:18 -0500
Received: by mail-wj0-f195.google.com with SMTP id j10so18541481wjb.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 17 Dec 2016 10:48:17 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1481375323-29724-7-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzk@kernel.org, arnd@arndb.de, geert+renesas@glider.be, m.szyprowski@samsung.com, javier@osg.samsung.com, kgene@kernel.org, thomas.ab@samsung.com

On Sat, Dec 10, 2016 at 06:38:41PM +0530, Pankaj Dubey wrote:
> We are taking care of setting secondary cpu boot address in
> exynos_boot_secondary just before sending ipi to secondary CPUs,
> so we can safely remove this setting from smp_prepare_cpus.

Indeed setting boot address is doubled. However between them, the power
is turned on and Exynos3250 is being restarted.

It would be nice to test it on Exynos3250 (Artik5 or Gear2?) and some of
Exynos4 family. Beside that looks good to me, I just want to see some
tested-by.

Best regards,
Krzysztof

> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/platsmp.c | 25 -------------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
> index 43eec10..4de254e 100644
> --- a/arch/arm/mach-exynos/platsmp.c
> +++ b/arch/arm/mach-exynos/platsmp.c
> @@ -403,8 +403,6 @@ static int exynos_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  
>  static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
>  {
> -	int i;
> -
>  	exynos_sysram_init();
>  
>  	exynos_set_delayed_reset_assertion(true);
> @@ -414,29 +412,6 @@ static void __init exynos_smp_prepare_cpus(unsigned int max_cpus)
>  		if (exynos_scu_enable())
>  			return;
>  	}
> -	/*
> -	 * Write the address of secondary startup into the
> -	 * system-wide flags register. The boot monitor waits
> -	 * until it receives a soft interrupt, and then the
> -	 * secondary CPU branches to this address.
> -	 *
> -	 * Try using firmware operation first and fall back to
> -	 * boot register if it fails.
> -	 */
> -	for (i = 1; i < max_cpus; ++i) {
> -		unsigned long boot_addr;
> -		u32 mpidr;
> -		u32 core_id;
> -		int ret;
> -
> -		mpidr = cpu_logical_map(i);
> -		core_id = MPIDR_AFFINITY_LEVEL(mpidr, 0);
> -		boot_addr = virt_to_phys(exynos4_secondary_startup);
> -
> -		ret = exynos_set_boot_addr(core_id, boot_addr);
> -		if (ret)
> -			break;
> -	}
>  }
>  
>  #ifdef CONFIG_HOTPLUG_CPU
> -- 
> 2.7.4
> 
