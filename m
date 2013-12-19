From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH Resend 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag to
 mout_apll
Date: Thu, 19 Dec 2013 11:37:08 -0800
Message-ID: <20131219193708.18119.53403@quantum>
References: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f48.google.com ([209.85.216.48]:59470 "EHLO
	mail-qa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753884Ab3LSThN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 14:37:13 -0500
Received: by mail-qa0-f48.google.com with SMTP id w5so1876356qac.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2013 11:37:12 -0800 (PST)
In-Reply-To: <1387442019-2445-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, t.figa@samsung.com, sachin.kamat@linaro.org

Quoting Sachin Kamat (2013-12-19 00:33:39)
> Add CLK_SET_RATE_PARENT flag to mout_apll clock. This will let us set the
> clock rate in the cpufreq driver.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Ack.

Regards,
Mike

> ---
>  drivers/clk/samsung/clk-exynos5250.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index 80f652053cb5..11178b1ad735 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -303,7 +303,8 @@ static struct samsung_mux_clock exynos5250_mux_clks[] __initdata = {
>         /*
>          * CMU_CPU
>          */
> -       MUX_A(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1, "mout_apll"),
> +       MUX_FA(none, "mout_apll", mout_apll_p, SRC_CPU, 0, 1,
> +                                       CLK_SET_RATE_PARENT, 0, "mout_apll"),
>         MUX_A(none, "mout_cpu", mout_cpu_p, SRC_CPU, 16, 1, "mout_cpu"),
>  
>         /*
> -- 
> 1.7.9.5
> 
