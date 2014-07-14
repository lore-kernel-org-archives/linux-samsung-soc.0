From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH] cpuidle: big.LITTLE: add MCPM dependency
Date: Mon, 14 Jul 2014 11:18:09 -0400 (EDT)
Message-ID: <alpine.LFD.2.11.1407141115500.3647@knanqh.ubzr>
References: <4345351.RJRQd7ghCF@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:55780 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756033AbaGNPSM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 11:18:12 -0400
Received: by mail-qg0-f43.google.com with SMTP id a108so3496842qge.30
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 08:18:11 -0700 (PDT)
In-Reply-To: <4345351.RJRQd7ghCF@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, Chander Kashyap <chander.kashyap@linaro.org>

On Mon, 14 Jul 2014, Arnd Bergmann wrote:

> 662322fcb6d ("cpuidle: big.LITTLE: Add ARCH_EXYNOS entry in config")
> made it possible for the big-little cpuidle driver to run on exynos,
> which may or may not include MCPM support at compile time, so we
> run into a link error when it is disabled:
> 
> drivers/built-in.o: In function `bl_enter_powerdown':
> :(.text+0x1889a0): undefined reference to `mcpm_cpu_powered_up'
> drivers/built-in.o: In function `bl_powerdown_finisher':
> :(.text+0x1889e8): undefined reference to `mcpm_set_entry_vector'
> :(.text+0x1889ec): undefined reference to `mcpm_cpu_suspend'
> 
> This adds an explicit dependency to CONFIG_MCPM to avoid that
> case.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: Chander Kashyap <chander.kashyap@linaro.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
> I believe the broken commit is only present in the samsung/for-next
> tree (through v3.17-next/cpuidle-exynos), so it should be fixed there.
> 
> On a side note, I wonder if we should have platform dependencies at
> all, or just the MCPM dependency by itself.

This was discussed in some other thread already but I'm too lazy to dig 
a reference to it.

Only a dependency on MCPM alone is needed here.  And then:

Acked-by: Nicolas Pitre <nico@linaro.org>

> 
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index 2f6b33ea6e08..459b7c91407a 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -10,6 +10,7 @@ config ARM_ARMADA_370_XP_CPUIDLE
>  config ARM_BIG_LITTLE_CPUIDLE
>  	bool "Support for ARM big.LITTLE processors"
>  	depends on ARCH_VEXPRESS_TC2_PM || ARCH_EXYNOS
> +	depends on MCPM
>  	select ARM_CPU_SUSPEND
>  	select CPU_IDLE_MULTIPLE_DRIVERS
>  	help
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> 
