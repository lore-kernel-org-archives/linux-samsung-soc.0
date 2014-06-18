From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clocksource: exynos-mct: Register the timer for stable udelay
Date: Wed, 18 Jun 2014 16:17:01 -0700
Message-ID: <CAD=FV=WHK7TDdqcAd6aVs2g8rcHJx834im_4nTKHJAkUisWq4A@mail.gmail.com>
References: <1403091060-5054-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403091060-5054-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Riley <davidriley@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Amit,

Thanks for posting!

On Wed, Jun 18, 2014 at 4:31 AM, Amit Daniel Kachhap
<amit.daniel@samsung.com> wrote:
> This patch register the exynos mct clocksource as the current timer
> as it has constant clock rate. This will generate correct udelay for the
> exynos platform and avoid using unnecessary calibrated jiffies. This change
> have been tested on exynos5420 based board.
>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>
> Patches from David Riley confirmed that udelay is broken in exynos5420.
> Link to those patches are,
> 1) https://patchwork.kernel.org/patch/4344911/
> 2) https://patchwork.kernel.org/patch/4344881/
>
>  drivers/clocksource/exynos_mct.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 8d64200..57cb3dc 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -198,10 +198,21 @@ static u64 notrace exynos4_read_sched_clock(void)
>         return exynos4_frc_read(&mct_frc);
>  }
>
> +static struct delay_timer exynos4_delay_timer;
> +
> +static unsigned long exynos4_read_current_timer(void)
> +{
> +       return exynos4_frc_read(&mct_frc);

This is terribly inefficient to read all 64-bits and then cast back to
a 32-bit value.  Replace with:

return __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);


> +}
> +
>  static void __init exynos4_clocksource_init(void)
>  {
>         exynos4_mct_frc_start(0, 0);

Please rebase atop (1d80415 clocksource: exynos_mct: Don't reset the
counter during boot and resume), which is in linuxnext among other
places.

>
> +       exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
> +       exynos4_delay_timer.freq = clk_rate;
> +       register_current_timer_delay(&exynos4_delay_timer);
> +
>         if (clocksource_register_hz(&mct_frc, clk_rate))
>                 panic("%s: can't register clocksource\n", mct_frc.name);

It does seem to work for me though.  :)
