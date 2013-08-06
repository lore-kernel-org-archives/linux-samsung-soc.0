From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos4: Make exynos4_plls static
Date: Tue, 06 Aug 2013 12:43:36 -0700
Message-ID: <20130806194336.5348.81505@quantum>
References: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:40277 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756085Ab3HFTnm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Aug 2013 15:43:42 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so602064pde.23
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Aug 2013 12:43:41 -0700 (PDT)
In-Reply-To: <1375788675-2638-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, patches@linaro.org

Quoting Sachin Kamat (2013-08-06 04:31:13)
> 'exynos4_plls' is used only in this file. Make it static.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Taken all three into clk-next. Seems like a lot of static-ization
patches for Exynos lately.

Regards,
Mike

> ---
>  drivers/clk/samsung/clk-exynos4.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 68f9a4a..fec319d 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -984,7 +984,7 @@ static __initdata struct of_device_id ext_clk_match[] = {
>         {},
>  };
>  
> -struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
> +static struct __initdata samsung_pll_clock exynos4_plls[nr_plls] = {
>         [apll] = PLL_A(pll_35xx, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
>                 APLL_CON0, "fout_apll", NULL),
>         [mpll] = PLL_A(pll_35xx, fout_mpll, "fout_mpll", "fin_pll",
> -- 
> 1.7.9.5
