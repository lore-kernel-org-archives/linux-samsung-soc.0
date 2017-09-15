From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4: Enable VPLL and EPLL clocks for
 suspend/resume cycle
Date: Fri, 15 Sep 2017 12:03:48 +0900
Message-ID: <59BB4314.7070405@samsung.com>
References: <CGME20170914143749eucas1p1f3206ff81fabc945ffc79cbddb45afc9@eucas1p1.samsung.com>
        <1505399852-4787-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1505399852-4787-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Marek,

On 2017년 09월 14일 23:37, Marek Szyprowski wrote:
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
>  drivers/clk/samsung/clk-exynos4.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index e40b77583c47..d2fa36bef7d1 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -294,6 +294,15 @@ enum exynos4_plls {
>  #define PLL_ENABLED	(1 << 31)
>  #define PLL_LOCKED	(1 << 29)
>  
> +static void exynos4_clk_enable_pll(u32 reg)
> +{
> +	u32 pll_con;
> +
> +	pll_con = readl(reg_base + reg);
> +	pll_con |= PLL_ENABLED;
> +	writel(pll_con, reg_base + reg);


The original PLL3xx enable function waits for lock time
after enabling the PLL in drivers/clk/samsung/clk-pll.c as following:
But, this patch just sets the bit of PLL_ENABLED without waiting.
You need to wait the lock time.

Or if possible, you better to use the pll enable function
in order to remove the duplicate code.

static int samsung_pll3xxx_enable(struct clk_hw *hw)
{
       struct samsung_clk_pll *pll = to_clk_pll(hw);
       u32 tmp;

       tmp = readl_relaxed(pll->con_reg);
       tmp |= BIT(pll->enable_offs);
       writel_relaxed(tmp, pll->con_reg);

       /* wait lock time */
       do {
               cpu_relax();
               tmp = readl_relaxed(pll->con_reg);
       } while (!(tmp & BIT(pll->lock_offs)));

       return 0;
}

> +}
> +
>  static void exynos4_clk_wait_for_pll(u32 reg)
>  {
>  	u32 pll_con;
> @@ -315,6 +324,9 @@ static int exynos4_clk_suspend(void)
>  	samsung_clk_save(reg_base, exynos4_save_pll,
>  				ARRAY_SIZE(exynos4_clk_pll_regs));
>  
> +	exynos4_clk_enable_pll(EPLL_CON0);
> +	exynos4_clk_enable_pll(VPLL_CON0);
> +
>  	if (exynos4_soc == EXYNOS4210) {
>  		samsung_clk_save(reg_base, exynos4_save_soc,
>  					ARRAY_SIZE(exynos4210_clk_save));
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
