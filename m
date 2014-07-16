From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3] ARM: exynos4: hotplug: Fix CPU idle clock down after
 CPU off
Date: Wed, 16 Jul 2014 15:05:57 +0200
Message-ID: <53C678B5.7080304@samsung.com>
References: <1405512467-27269-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9936 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932801AbaGPNGh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 09:06:37 -0400
In-reply-to: <1405512467-27269-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

On 16.07.2014 14:07, Krzysztof Kozlowski wrote:

[snip]

> +#ifdef CONFIG_SMP
> +extern void exynos_clear_delayed_reset_assertion(u32 core_id);
> +#endif

Is the ifdef really needed? The only difference it makes if the function
is used but not compiled in is that with it the compilation will fail,
while without it the kernel won't link.

> +
>  extern void exynos_cpu_resume(void);
>  
>  extern struct smp_operations exynos_smp_ops;

[snip]

> +/*
> + * Clear the USE_DELAYED_RESET_ASSERTION option, set on Exynos4 SoCs
> + * during hot-unplugging CPUx.
> + *
> + * It won't harm if this is called during first boot of secondary CPU.
> + *
> + * Exynos4 SoCs require setting USE_DELAYED_RESET_ASSERTION so the CPU idle
> + * clock down feature could properly detect global idle state when
> + * CPUx is off.
> + */
> +void exynos_clear_delayed_reset_assertion(u32 core_id)
> +{
> +	if (soc_is_exynos4()) {
> +		unsigned int tmp;
> +
> +		tmp = __raw_readl(EXYNOS_ARM_CORE_OPTION(core_id));
> +		tmp &= ~(S5P_USE_DELAYED_RESET_ASSERTION);
> +		__raw_writel(tmp, EXYNOS_ARM_CORE_OPTION(core_id));
> +	}
> +}

The idea to make this a helper function is quite nice, but maybe it
could be extended into exynos_set_delayed_reset_assertion() and disable
or enable delayed assertion depending on another argument?

Best regards,
Tomasz
