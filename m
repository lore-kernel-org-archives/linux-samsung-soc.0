From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RESEND PATCH v2] ARM: exynos4: hotplug: Fix CPU idle clock down
 after CPU off
Date: Wed, 16 Jul 2014 12:48:48 +0200
Message-ID: <53C65890.8000500@samsung.com>
References: <1405499003-9975-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34650 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751016AbaGPKtg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jul 2014 06:49:36 -0400
In-reply-to: <1405499003-9975-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

Please see my comment below.

On 16.07.2014 10:23, Krzysztof Kozlowski wrote:
> On Exynos4 USE_DELAYED_RESET_ASSERTION must be set in
> ARM_COREx_OPTION register during CPU power down. This is the proper way
> of powering down CPU on Exynos4.
> 
> Additionally on Exynos4212 without this the CPU clock down feature won't
> work after powering down some CPU and the online CPUs will work at full
> frequency chosen by CPUfreq governor.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

[snip]

> @@ -36,6 +36,14 @@ static inline void cpu_leave_lowpower(void)
>  	  : "=&r" (v)
>  	  : "Ir" (CR_C), "Ir" (0x40)
>  	  : "cc");
> +
> +	if (soc_is_exynos4()) {
> +		unsigned int tmp;
> +
> +		tmp = __raw_readl(EXYNOS_ARM_CORE_OPTION(core_id));
> +		tmp &= ~(S5P_USE_DELAYED_RESET_ASSERTION);
> +		__raw_writel(tmp, EXYNOS_ARM_CORE_OPTION(core_id));
> +	}

This code is executed only if the CPU doesn't manage to power off before
already receiving a wake-up event. Otherwise the context is lost after
wfi(), as the core power is being cut down.

The normal wake-up path goes through platsmp's exynos_boot_secondary()
and I believe that setting of S5P_USE_DELAYED_RESET_ASSERTION should be
taken care there as well.

Best regards,
Tomasz
