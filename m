From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/4] clk: exynos4: export sclk_hdmiphy clock
Date: Tue, 08 Apr 2014 17:48:21 +0200
Message-ID: <53441A45.5080506@samsung.com>
References: <1396623201-26000-1-git-send-email-t.stanislaws@samsung.com>
 <1396623201-26000-3-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34317 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756121AbaDHPs1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 11:48:27 -0400
In-reply-to: <1396623201-26000-3-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Stanislawski <t.stanislaws@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, rob.herring@calxeda.com, sylvester.nawrocki@gmail.com, a.hajda@samsung.com, kishon@ti.com

Hi Tomasz,

On 04.04.2014 16:53, Tomasz Stanislawski wrote:
> Export sclk_hdmiphy clock to be usable from DT.
>
> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos4.c   |    2 +-
>   include/dt-bindings/clock/exynos4.h |    1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index b4f9672..528f8eb 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -428,7 +428,7 @@ static struct samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata
>   /* fixed rate clocks generated inside the soc */
>   static struct samsung_fixed_rate_clock exynos4_fixed_rate_clks[] __initdata = {
>   	FRATE(0, "sclk_hdmi24m", NULL, CLK_IS_ROOT, 24000000),
> -	FRATE(0, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
> +	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
>   	FRATE(0, "sclk_usbphy0", NULL, CLK_IS_ROOT, 48000000),
>   };
>
> diff --git a/include/dt-bindings/clock/exynos4.h b/include/dt-bindings/clock/exynos4.h
> index 75aff33..0e245eb 100644
> --- a/include/dt-bindings/clock/exynos4.h
> +++ b/include/dt-bindings/clock/exynos4.h
> @@ -33,6 +33,7 @@
>   #define CLK_MOUT_MPLL_USER_C	18 /* Exynos4x12 only */
>   #define CLK_MOUT_CORE		19
>   #define CLK_MOUT_APLL		20
> +#define CLK_SCLK_HDMIPHY	22
>
>   /* gate for special clocks (sclk) */
>   #define CLK_SCLK_FIMC0		128
>

I believe this clock should be properly abstracted as an output of HDMI 
PHY, but I don't see any way to do this with existing infrastructure, so 
probably for now such workaround is fine.

Will apply, if nobody opposes.

Best regards,
Tomasz
