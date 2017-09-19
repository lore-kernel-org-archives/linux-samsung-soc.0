From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] clk: samsung: exynos4: Enable VPLL and EPLL clocks for
 suspend/resume cycle
Date: Tue, 19 Sep 2017 08:40:20 +0200
Message-ID: <CAJKOXPewCQEea19hPcu9b45pSfnru7bcZ+rRUkGMbb-wUG=GHA@mail.gmail.com>
References: <CGME20170915094209eucas1p1c959442cce50aea9553e4b73a36ab8a0@eucas1p1.samsung.com>
 <1505468516-3324-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:40086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750823AbdISGkV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Sep 2017 02:40:21 -0400
In-Reply-To: <1505468516-3324-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org

On Fri, Sep 15, 2017 at 11:41 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
> PLL36XX clocks") added enable/disable operations to PLL clocks. Prior that
> VPLL and EPPL clocks were always enabled because the enable bit was never
> touched. Those clocks have to be enabled during suspend/resume cycle,
> because otherwise board fails to enter sleep mode. This patch enables them
> unconditionally before entering system suspend state. System restore
> function will set them to the previous state saved in the register cache
> done before that unconditional enable.
>
> Fixes: 6edfa11cb396 ("clk: samsung: Add enable/disable operation for PLL36XX clocks")
> CC: stable@vger.kernel.org # v4.13
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - wait until PLL is properly locked
> ---
>  drivers/clk/samsung/clk-exynos4.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index e40b77583c47..d8d3cb67b402 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -294,6 +294,18 @@ enum exynos4_plls {
>  #define PLL_ENABLED    (1 << 31)
>  #define PLL_LOCKED     (1 << 29)
>
> +static void exynos4_clk_enable_pll(u32 reg)
> +{
> +       u32 pll_con = readl(reg_base + reg);
> +       pll_con |= PLL_ENABLED;
> +       writel(pll_con, reg_base + reg);
> +
> +       while (!(pll_con & PLL_LOCKED)) {
> +               cpu_relax();
> +               pll_con = readl(reg_base + reg);
> +       }

Looks good:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

As a follow up for the fix (separate patch) we could consider adding
timeouts to both busy-loops (waiting on PLL_LOCKED). Also the busy
loop itself could be factored out (less code duplicate). However both
should not be part of this fix.

Best regards,
Krzysztof
