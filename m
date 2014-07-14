From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] cpuidle: big.LITTLE: add MCPM dependency
Date: Mon, 14 Jul 2014 20:44:50 +0200
Message-ID: <53C42522.9060907@linaro.org>
References: <4345351.RJRQd7ghCF@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:59035 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754872AbaGNSox (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 14:44:53 -0400
Received: by mail-wi0-f169.google.com with SMTP id n3so2944182wiv.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 11:44:51 -0700 (PDT)
In-Reply-To: <4345351.RJRQd7ghCF@wuerfel>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, kgene.kim@samsung.com
Cc: Chander Kashyap <chander.kashyap@linaro.org>, Tomasz Figa <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 07/14/2014 01:23 PM, Arnd Bergmann wrote:
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
> tree (through v3.17-next/cpuidle-exynos), so it should be fixed there=
=2E
>
> On a side note, I wonder if we should have platform dependencies at
> all, or just the MCPM dependency by itself.
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.ar=
m
> index 2f6b33ea6e08..459b7c91407a 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -10,6 +10,7 @@ config ARM_ARMADA_370_XP_CPUIDLE
>   config ARM_BIG_LITTLE_CPUIDLE
>   	bool "Support for ARM big.LITTLE processors"
>   	depends on ARCH_VEXPRESS_TC2_PM || ARCH_EXYNOS
> +	depends on MCPM

Why do we want to depend on MCPM ? If I want to enable the cpuidle=20
driver, the Kconfig should select the dependencies instead of letting=20
the user to figure out what dependency is missing in order to enable th=
e=20
cpuidle option, no ?

+	select MCPM

>   	select ARM_CPU_SUSPEND
>   	select CPU_IDLE_MULTIPLE_DRIVERS
>   	help
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
