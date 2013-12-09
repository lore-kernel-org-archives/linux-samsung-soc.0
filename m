From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4] i2c: s3c2410: dont need CPU_FREQ transitions for exynos
 series
Date: Mon, 09 Dec 2013 17:09:19 +0100
Message-ID: <1750845.YHGrteBMYZ@amdc1227>
References: <1381490814-20890-1-git-send-email-ch.naveen@samsung.com>
 <1385439767-18586-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1385439767-18586-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, cpgs-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Naveen,

On Tuesday 26 of November 2013 09:52:46 Naveen Krishna Chatradhi wrote:
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
> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> Changes since v3:
> As per discussion at https://patchwork.kernel.org/patch/3235091/
> Post f023f8dd59 commit we should be using
> ARM_S3C24XX_CPUFREQ instead of CPU_FREQ_S3C24XX
> 
> upstrea linux kernel and linuxsamsung already has the commit
> f023f8dd59. Hence, rebasing the patch.
> 
>  drivers/i2c/busses/i2c-s3c2410.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Wolfram, are you okay with this patch?

Best regards,
Tomasz
