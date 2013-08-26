From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V2] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for
 exynos5440
Date: Mon, 26 Aug 2013 16:23:03 +0200
Message-ID: <18873465.YOJHgsXmcz@amdc1032>
References: <4070794.XxjluIqBpK@amdc1032>
 <1377519363-23077-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19442 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756372Ab3HZOXb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Aug 2013 10:23:31 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MS5009ES6N6BQ10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Aug 2013 23:23:30 +0900 (KST)
In-reply-to: <1377519363-23077-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene@kernel.org>

On Monday, August 26, 2013 05:46:03 PM Amit Daniel Kachhap wrote:
> This patch skips the deep C1(AFTR -Arm off top running) state for exynos5440
> soc as this soc does not support this state. The cpu's only allows the basic
> C0 state. The C1 state is filtered by re-initialising the driver state_count
> value to 1.
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Thanks for fixing this.

> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
> 
> Changes in V2:
> * Used driver state_count variable to filter the C1 state
>  instead of device state count variable. Although this V2 patch is also
>  not complete as there are suggestions to make this driver platform driver.

I'm going to look into making it a platform driver later this week.

>  arch/arm/mach-exynos/cpuidle.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 225ee84..ac13922 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -200,6 +200,9 @@ static int __init exynos4_init_cpuidle(void)
>  	if (soc_is_exynos5250())
>  		exynos5_core_down_clk();
>  
> +	if (soc_is_exynos5440())
> +		exynos4_idle_driver.state_count = 1;
> +
>  	ret = cpuidle_register_driver(&exynos4_idle_driver);
>  	if (ret) {
>  		printk(KERN_ERR "CPUidle failed to register driver\n");

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
