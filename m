From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] clk: exynos4: Staticize local symbols
Date: Wed, 05 Jun 2013 21:14:09 +0900
Message-ID: <08f401ce61e6$2ecc33f0$8c649bd0$%kim@samsung.com>
References: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65461 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753685Ab3FEMOL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 08:14:11 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNX00BHK5ZGCVW0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Jun 2013 21:14:09 +0900 (KST)
In-reply-to: <1366106719-26342-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, thomas.abraham@linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> These symbols are used only in this file and hence should be
> static.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos4.c |   26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-
> exynos4.c
> index 7104669..26f2a85 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -339,24 +339,26 @@ PNAME(mout_user_aclk200_p4x12) = {"fin_pll",
> "div_aclk200", };
>  PNAME(mout_user_aclk266_gps_p4x12) = {"fin_pll", "div_aclk266_gps", };
> 
>  /* fixed rate clocks generated outside the soc */
> -struct samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata
> = {
> +static struct
> +samsung_fixed_rate_clock exynos4_fixed_rate_ext_clks[] __initdata = {

Any reason to use double lines?

>  	FRATE(xxti, "xxti", NULL, CLK_IS_ROOT, 0),
>  	FRATE(xusbxti, "xusbxti", NULL, CLK_IS_ROOT, 0),
>  };

[...]

> -struct samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata =
> {
> +static struct
> +samsung_fixed_rate_clock exynos4210_fixed_rate_clks[] __initdata = {

Same as above.

>  	FRATE(none, "sclk_usbphy1", NULL, CLK_IS_ROOT, 48000000),
>  };
> 
[...]

Others look good to me,
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Mike, please pick this into the clk tree if you're ok.

Thanks.

- Kukjin
