From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 2/7] clocksource: Rename CLOCKSOURCE_OF_DECLARE
Date: Tue, 30 May 2017 09:36:00 -0700
Message-ID: <1cc18f5a-2181-7be9-183d-270ae093b844@synopsys.com>
References: <1495879129-28109-1-git-send-email-daniel.lezcano@linaro.org>
 <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:43036 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751085AbdE3QgR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2017 12:36:17 -0400
In-Reply-To: <1495879129-28109-2-git-send-email-daniel.lezcano@linaro.org>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:RALINK MIPS ARCHITECTURE" <linux-mips@linux-mips.org>, Baruch Siach <baruch@tkos.co.il>, Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/OXNAS platform support" <linux-oxnas@lists.tuxfamily.org>, Patrice Chotard <patrice.chotard@st.com>, Eric Anholt <eric@anholt.net>, Thierry Reding <thierry.reding@gmail.com>, Ingo Molnar <mingo@kernel.org>, "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>, Alexandre Courbot <gnurou@gmail.com>, "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, Floria

On 05/27/2017 02:58 AM, Daniel Lezcano wrote:

...

> So instead of dealing with a named clocksource macro, let's use a more generic
> one: TIMER_OF_DECLARE.
> 
> The patch has not functional changes.
> 
...

>   drivers/clocksource/arc_timer.c           |  6 +++---

...

> diff --git a/drivers/clocksource/arc_timer.c b/drivers/clocksource/arc_timer.c
> index 2164973..4927355 100644
> --- a/drivers/clocksource/arc_timer.c
> +++ b/drivers/clocksource/arc_timer.c
> @@ -99,7 +99,7 @@ static int __init arc_cs_setup_gfrc(struct device_node *node)
>   
>   	return clocksource_register_hz(&arc_counter_gfrc, arc_timer_freq);
>   }
> -CLOCKSOURCE_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
> +TIMER_OF_DECLARE(arc_gfrc, "snps,archs-timer-gfrc", arc_cs_setup_gfrc);
>   
>   #define AUX_RTC_CTRL	0x103
>   #define AUX_RTC_LOW	0x104
> @@ -158,7 +158,7 @@ static int __init arc_cs_setup_rtc(struct device_node *node)
>   
>   	return clocksource_register_hz(&arc_counter_rtc, arc_timer_freq);
>   }
> -CLOCKSOURCE_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
> +TIMER_OF_DECLARE(arc_rtc, "snps,archs-timer-rtc", arc_cs_setup_rtc);
>   
>   #endif
>   
> @@ -333,4 +333,4 @@ static int __init arc_of_timer_init(struct device_node *np)
>   
>   	return ret;
>   }
> -CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);
> +TIMER_OF_DECLARE(arc_clkevt, "snps,arc-timer", arc_of_timer_init);

Acked-by: Vineet Gupta vgupta@snyopsys.com

Thx,
-Vineet
