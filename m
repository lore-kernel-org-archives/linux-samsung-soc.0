From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] clk: samsung: fix cpll clock register offsets for
 exynos5420 SoC
Date: Thu, 26 Sep 2013 13:59:13 +0900
Message-ID: <02c601ceba75$24c763b0$6e562b10$@org>
References: <1380099864-32031-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52222 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab3IZE7O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Sep 2013 00:59:14 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTP005N4V4AQUK0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Sep 2013 13:59:13 +0900 (KST)
In-reply-to: <1380099864-32031-1-git-send-email-chander.kashyap@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chander Kashyap' <chander.kashyap@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: mturquette@linaro.org, thomas.abraham@linaro.org, yadi.brar@samsung.com

Chander Kashyap wrote:
> 
> Fixes cpll control and lock register offset values for Exynos5420 SoC.
> 
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>

Just nit in the subject,
'clk: exynos5420: ...' or 'clk/exynos5420: ...' would be nice...

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

> ---
>  drivers/clk/samsung/clk-exynos5420.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c
> b/drivers/clk/samsung/clk-exynos5420.c
> index 86dfc64..892aac0 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -730,8 +730,8 @@ struct samsung_gate_clock exynos5420_gate_clks[]
> __initdata = {
>  struct __initdata samsung_pll_clock exynos5420_plls[nr_plls] = {
>  	[apll] = PLL(pll_2550, fout_apll, "fout_apll", "fin_pll", APLL_LOCK,
>  		APLL_CON0, NULL),
> -	[cpll] = PLL(pll_2550, fout_mpll, "fout_mpll", "fin_pll", MPLL_LOCK,
> -		MPLL_CON0, NULL),
> +	[cpll] = PLL(pll_2550, fout_cpll, "fout_cpll", "fin_pll", CPLL_LOCK,
> +		CPLL_CON0, NULL),
>  	[dpll] = PLL(pll_2550, fout_dpll, "fout_dpll", "fin_pll", DPLL_LOCK,
>  		DPLL_CON0, NULL),
>  	[epll] = PLL(pll_2650, fout_epll, "fout_epll", "fin_pll", EPLL_LOCK,
> --
> 1.7.9.5
