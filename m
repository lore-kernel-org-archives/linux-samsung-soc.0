From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 3/5] ARM: Exynos4: Support ADC
Date: Wed, 29 Jun 2011 22:52:01 +0900
Message-ID: <004b01cc3663$bb458760$31d09620$%kim@samsung.com>
References: <20110620101737.GA31864@opensource.wolfsonmicro.com>
 <1308621527-2457-1-git-send-email-myungjoo.ham@samsung.com>
 <1308621527-2457-4-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52891 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753963Ab1F2NwH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jun 2011 09:52:07 -0400
In-reply-to: <1308621527-2457-4-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Russell King' <linux@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, dg77.kim@samsung.com, myungjoo.ham@gmail.com

MyungJoo Ham wrote:
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> --
> v2: No changes from v1. Resubmitted as a series of patches
> ---
>  arch/arm/mach-exynos4/Kconfig             |    1 +
>  arch/arm/mach-exynos4/cpu.c               |    4 ++++
>  arch/arm/mach-exynos4/include/mach/irqs.h |    8 ++++++++
>  arch/arm/mach-exynos4/include/mach/map.h  |    5 +++++
>  4 files changed, 18 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index 1435fc3..61fdf68 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -183,6 +183,7 @@ config MACH_NURI
>  	select EXYNOS4_SETUP_SDHCI
>  	select EXYNOS4_SETUP_USB_PHY
>  	select SAMSUNG_DEV_PWM
> +	select SAMSUNG_DEV_ADC
>  	help
>  	  Machine support for Samsung Mobile NURI Board.
> 
> diff --git a/arch/arm/mach-exynos4/cpu.c b/arch/arm/mach-exynos4/cpu.c
> index 9babe44..c9af2f9 100644

(snip)

> 
> +#define IRQ_ADC0                COMBINER_IRQ(19, 0)
> +#define IRQ_PEN0                COMBINER_IRQ(19, 1)
> +#define IRQ_ADC1                COMBINER_IRQ(19, 2)
> +#define IRQ_PEN1                COMBINER_IRQ(19, 3)
> +

As you know, we need to use external GIC instead of current internal on
EXYNOS4210.
So could you please re-make this based on that?

I will make some branch or will apply external GIC patches into for-next
soon.

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
