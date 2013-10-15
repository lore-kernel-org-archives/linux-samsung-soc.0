From: Kyungmin Park <kmpark-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2] i2c: s3c2410: dont need CPU_FREQ transitions for
 exynos series
Date: Tue, 15 Oct 2013 15:56:27 +0900
Message-ID: <CAH9JG2Xo2UgbP+VA=s908FSusELERh8kvSVyiyMX1H1Ue8uPSg@mail.gmail.com>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
	<1381818232-12542-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381818232-12542-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 15, 2013 at 3:23 PM, Naveen Krishna Chatradhi
<ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> For Exynos4 and Exynos5 SoCs from Samsung the i2c clock is based
> on a fixed 66 MHz peripheral clock, and therefore is completely
> independent of the cpu frequency.
> Thus, registering for a CPU freq notifier is very wasteful.
>
> This patch modifes the code such that, i2c bus registers to
> cpu_freq_transition only if CONFIG_CPU_FREQ_S3C24XX is enabled.
>
> This change should save a bunch of cpufreq transitions calls
> which does not apply to exynos SoCs.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changes since v1:
> Use CONFIG_CPU_FREQ_S3C24XX instead of (CONFIG_CPU_FREQ & !CONFIG_EXYNOS)
> As commented by Tomasz
>
>  drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index cab1c91..97f14f7 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -123,7 +123,7 @@ struct s3c24xx_i2c {
>         struct s3c2410_platform_i2c     *pdata;
>         int                     gpios[2];
>         struct pinctrl          *pctrl;
> -#ifdef CONFIG_CPU_FREQ
> +#if defined(CONFIG_CPU_FREQ_S3C24XX)
>         struct notifier_block   freq_transition;
>  #endif
>  };
> @@ -843,7 +843,7 @@ static int s3c24xx_i2c_clockrate(struct s3c24xx_i2c *i2c, unsigned int *got)
>         return 0;
>  }
>
> -#ifdef CONFIG_CPU_FREQ
> +#if defined(CONFIG_CPU_FREQ_S3C24XX)
>
>  #define freq_to_i2c(_n) container_of(_n, struct s3c24xx_i2c, freq_transition)
>
> --
> 1.7.10.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
