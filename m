From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: exynos4: Fix for stall in case of cpu hotplug or sleep
Date: Thu, 01 Dec 2011 19:35:22 +0900
Message-ID: <047501ccb014$edda8f60$c98fae20$%kim@samsung.com>
References: <1321616752-1233-1-git-send-email-amit.kachhap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61010 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751863Ab1LAKf0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 05:35:26 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LVI005WDTE8EBK0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 19:35:25 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LVI005NJTEZU620@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Dec 2011 19:35:24 +0900 (KST)
In-reply-to: <1321616752-1233-1-git-send-email-amit.kachhap@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.kachhap@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Amit Daniel Kachhap wrote:
> 
> This patch adds remove_irq in place of disable_irq which is
> correct equivalent function for setup_irq used in
> exynos4_mct_tick_init.
> 
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@linaro.org>
> Tested-by: Inderpal Singh <inderpal.singh@linaro.org>
> ---
>  arch/arm/mach-exynos/mct.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/mct.c b/arch/arm/mach-exynos/mct.c
> index 97343df..959f251 100644
> --- a/arch/arm/mach-exynos/mct.c
> +++ b/arch/arm/mach-exynos/mct.c
> @@ -428,9 +428,13 @@ int __cpuinit local_timer_setup(struct
> clock_event_device *evt)
> 
>  void local_timer_stop(struct clock_event_device *evt)
>  {
> +	unsigned int cpu = smp_processor_id();
>  	evt->set_mode(CLOCK_EVT_MODE_UNUSED, evt);
>  	if (mct_int_type == MCT_INT_SPI)
> -		disable_irq(evt->irq);
> +		if (cpu == 0)
> +			remove_irq(evt->irq, &mct_tick0_event_irq);
> +		else
> +			remove_irq(evt->irq, &mct_tick1_event_irq);

Hmm, how about the cpu number is 2 or 3 on Quad-core?
As you know, this should be used for all of EXYNOS SoCs.

>  	else
>  		disable_percpu_irq(IRQ_MCT_LOCALTIMER);
>  }
> --
> 1.7.1


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
