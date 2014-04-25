From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: exynos: register sched_clock callback
Date: Sat, 26 Apr 2014 01:22:17 +0200
Message-ID: <535AEE29.5090108@gmail.com>
References: <1398331286-2020-1-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:35447 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751581AbaDYXWT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 19:22:19 -0400
Received: by mail-ee0-f46.google.com with SMTP id t10so3158538eei.33
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Apr 2014 16:22:18 -0700 (PDT)
In-Reply-To: <1398331286-2020-1-git-send-email-vincent.guittot@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org

Hi Vincent,

On 24.04.2014 11:21, Vincent Guittot wrote:
> Use the clocksource mct-frc for sched_clock
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>   drivers/clocksource/exynos_mct.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index a6ee6d7..61b0577 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -24,6 +24,7 @@
>   #include <linux/of_irq.h>
>   #include <linux/of_address.h>
>   #include <linux/clocksource.h>
> +#include <linux/sched_clock.h>
>
>   #define EXYNOS4_MCTREG(x)		(x)
>   #define EXYNOS4_MCT_G_CNT_L		EXYNOS4_MCTREG(0x100)
> @@ -192,12 +193,19 @@ struct clocksource mct_frc = {
>   	.resume		= exynos4_frc_resume,
>   };
>
> +static u64 notrace exynos4_read_sched_clock(void)
> +{
> +	return exynos4_frc_read(&mct_frc);
> +}
> +
>   static void __init exynos4_clocksource_init(void)
>   {
>   	exynos4_mct_frc_start(0, 0);
>
>   	if (clocksource_register_hz(&mct_frc, clk_rate))
>   		panic("%s: can't register clocksource\n", mct_frc.name);
> +
> +	sched_clock_register(exynos4_read_sched_clock, 64, clk_rate);
>   }
>
>   static void exynos4_mct_comp0_stop(void)
>

Thanks for this patch.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
