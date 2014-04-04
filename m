From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 06/17] ARM: exynos: cpuidle: Fix S5P_WAKEUP_STAT call
Date: Fri, 4 Apr 2014 14:23:02 +0530
Message-ID: <CAKohpo=Tke09Qn=khuSB92mHEs+YEK7ejtkC7g58TvcJZwUW5g@mail.gmail.com>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>
	<1396597683-6969-7-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:32851 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752084AbaDDIxD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 04:53:03 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so3276815oag.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 01:53:02 -0700 (PDT)
In-Reply-To: <1396597683-6969-7-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> This function should be called only when the powerdown sequence fails.
>
> Even if the current code does not hurt, by moving this line, we have the same
> code than the one in pm.c.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm/mach-exynos/cpuidle.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/cpuidle.c
> index 9cd1ed9..a1e1882 100644
> --- a/arch/arm/mach-exynos/cpuidle.c
> +++ b/arch/arm/mach-exynos/cpuidle.c
> @@ -135,11 +135,10 @@ static int exynos_enter_core0_aftr(struct cpuidle_device *dev,
>         if (!(tmp & S5P_CENTRAL_LOWPWR_CFG)) {
>                 tmp |= S5P_CENTRAL_LOWPWR_CFG;
>                 __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
> +               /* Clear wakeup state register */
> +               __raw_writel(0x0, S5P_WAKEUP_STAT);
>         }
>
> -       /* Clear wakeup state register */
> -       __raw_writel(0x0, S5P_WAKEUP_STAT);
> -
>         return index;
>  }

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
