From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2] clocksource: exynos-mct: Register the timer for stable
 udelay
Date: Thu, 19 Jun 2014 11:11:18 +0200
Message-ID: <53A2A936.3070109@linaro.org>
References: <1403167145-5267-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:58687 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757806AbaFSJLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 05:11:18 -0400
Received: by mail-we0-f178.google.com with SMTP id x48so1983610wes.23
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jun 2014 02:11:17 -0700 (PDT)
In-Reply-To: <1403167145-5267-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, David Riley <davidriley@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>

On 06/19/2014 10:39 AM, Amit Daniel Kachhap wrote:
> This patch register the exynos mct clocksource as the current timer
> as it has constant clock rate. This will generate correct udelay for =
the
> exynos platform and avoid using unnecessary calibrated jiffies. This =
change
> has been tested on exynos5420 based board and udelay is very close to
> expected.
>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
> Changes in V2:
> * Added #defines for ARM and ARM64 as pointed by Doug Anderson.
>
> Patches from David Riley confirmed that udelay is broken in exynos542=
0.
> Link to those patches are,
> 1) https://patchwork.kernel.org/patch/4344911/
> 2) https://patchwork.kernel.org/patch/4344881/
>
>   drivers/clocksource/exynos_mct.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/e=
xynos_mct.c
> index f71d55f..02927e2 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -195,10 +195,25 @@ static u64 notrace exynos4_read_sched_clock(voi=
d)
>   	return exynos4_frc_read(&mct_frc);
>   }
>
> +static struct delay_timer exynos4_delay_timer;
> +
> +static unsigned long exynos4_read_current_timer(void)
> +{
> +#ifdef ARM
> +	return __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);
> +#else /* ARM64, etc */
> +	return exynos4_frc_read(&mct_frc);
> +#endif
> +}
> +

There isn't another solution than that ? macros definitions in C file=20
are avoided as much as possible.

>   static void __init exynos4_clocksource_init(void)
>   {
>   	exynos4_mct_frc_start();
>
> +	exynos4_delay_timer.read_current_timer =3D &exynos4_read_current_ti=
mer;

&exynos4_read_current_timer ?

> +	exynos4_delay_timer.freq =3D clk_rate;
> +	register_current_timer_delay(&exynos4_delay_timer);
> +
>   	if (clocksource_register_hz(&mct_frc, clk_rate))
>   		panic("%s: can't register clocksource\n", mct_frc.name);
>
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
