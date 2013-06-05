From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] clk: samsung: Fix pll36xx_recalc_rate to handle kdiv
 properly
Date: Wed, 05 Jun 2013 20:51:29 +0900
Message-ID: <08e301ce61e3$045828c0$0d087a40$%kim@samsung.com>
References: <1370026725-22910-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30815 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752384Ab3FELvb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 07:51:31 -0400
In-reply-to: <1370026725-22910-1-git-send-email-dianders@chromium.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Olof Johansson' <olof@lixom.net>, 'Vikas Sajjan' <vikas.sajjan@linaro.org>, 'Yadwinder Singh Brar' <yadi.brar01@gmail.com>, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Mike Turquette' <mturquette@linaro.org>, 'Tomasz Figa' <t.figa@samsung.com>, linux-kernel@vger.kernel.org

Doug Anderson wrote:
> 
> The KDIV value is often listed as unsigned but it needs to be treated
> as a 16-bit signed value when using it in calculations.  Fix our rate
> recalculation to do this correctly.
> 
> Before doing this, I tried setting EPLL on exynos5250 to:
>   rate, m, p, s, k = 80000000, 107, 2, 4, 43691
> 
> This rate is exactly from the table in the exynos5250 user manual.
> 
> I read this back as 80750003 with:
>   cat /sys/kernel/debug/clk/fin_pll/fout_epll/clk_rate
> 
> After this patch, it reads back as 80000003
> 
>   mw 0x10020130 a06b0204
>   mw 0x10020134 0000aaab
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>

Yeah,

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Mike, please apply in your fixes.

Thanks.

- Kukjin

> ---
> This patch is based upon another in-flight patch to avoid conflicts:
>   clk: samsung: Use clk->base instead of directly using clk->con0 for
> PLL3xxx
>   https://patchwork.kernel.org/patch/2629751/
> 
>  drivers/clk/samsung/clk-pll.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 01f17cf..26416bb 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -115,7 +115,8 @@ static unsigned long
> samsung_pll36xx_recalc_rate(struct clk_hw *hw,
>  				unsigned long parent_rate)
>  {
>  	struct samsung_clk_pll *pll = to_clk_pll(hw);
> -	u32 mdiv, pdiv, sdiv, kdiv, pll_con0, pll_con1;
> +	u32 mdiv, pdiv, sdiv, pll_con0, pll_con1;
> +	s16 kdiv;
>  	u64 fvco = parent_rate;
> 
>  	pll_con0 = pll_readl(pll, PLL36XX_CON0_OFFSET);
> @@ -123,7 +124,7 @@ static unsigned long
> samsung_pll36xx_recalc_rate(struct clk_hw *hw,
>  	mdiv = (pll_con0 >> PLL36XX_MDIV_SHIFT) & PLL36XX_MDIV_MASK;
>  	pdiv = (pll_con0 >> PLL36XX_PDIV_SHIFT) & PLL36XX_PDIV_MASK;
>  	sdiv = (pll_con0 >> PLL36XX_SDIV_SHIFT) & PLL36XX_SDIV_MASK;
> -	kdiv = pll_con1 & PLL36XX_KDIV_MASK;
> +	kdiv = (s16)(pll_con1 & PLL36XX_KDIV_MASK);
> 
>  	fvco *= (mdiv << 16) + kdiv;
>  	do_div(fvco, (pdiv << sdiv));
> --
> 1.8.2.1
