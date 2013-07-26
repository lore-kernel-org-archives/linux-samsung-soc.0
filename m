From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2] clk: exynos4: Add CLK_GET_RATE_NOCACHE flag for the
 Exynos4x12 ISP clocks
Date: Fri, 26 Jul 2013 13:30:26 -0700
Message-ID: <20130726203026.7598.21711@quantum>
References: <1374786425-6697-1-git-send-email-sylvester.nawrocki@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1374786425-6697-1-git-send-email-sylvester.nawrocki@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2013-07-25 14:07:05)
> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> The ISP clock registers belong to the ISP power domain and may change
> their values if this power domain is switched off/on. Add
> CLK_GET_RATE_NOCACHE flags to ensure we do not rely on invalid cached
> data when setting or getting frequency of those clocks.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Thanks for the fix. I've taken into clk-fixes. Is there a specific
regression this fixes (besides just having wrong clock rates). I can
amend the changelog if you have an example (e.g. device X explodes).

Regards,
Mike

> ---
> 
> Rebased onto v3.11-rc2.
> 
>  drivers/clk/samsung/clk-exynos4.c |   64 +++++++++++++++++++-----------------
>  1 files changed, 34 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
> index 1bdb882..4e57397 100644
> --- a/drivers/clk/samsung/clk-exynos4.c
> +++ b/drivers/clk/samsung/clk-exynos4.c
> @@ -581,11 +581,15 @@ struct samsung_div_clock exynos4x12_div_clks[] __initdata = {
>         DIV(none, "div_spi1_isp", "mout_spi1_isp", E4X12_DIV_ISP, 16, 4),
>         DIV(none, "div_spi1_isp_pre", "div_spi1_isp", E4X12_DIV_ISP, 20, 8),
>         DIV(none, "div_uart_isp", "mout_uart_isp", E4X12_DIV_ISP, 28, 4),
> -       DIV(div_isp0, "div_isp0", "aclk200", E4X12_DIV_ISP0, 0, 3),
> -       DIV(div_isp1, "div_isp1", "aclk200", E4X12_DIV_ISP0, 4, 3),
> +       DIV_F(div_isp0, "div_isp0", "aclk200", E4X12_DIV_ISP0, 0, 3,
> +                                               CLK_GET_RATE_NOCACHE, 0),
> +       DIV_F(div_isp1, "div_isp1", "aclk200", E4X12_DIV_ISP0, 4, 3,
> +                                               CLK_GET_RATE_NOCACHE, 0),
>         DIV(none, "div_mpwm", "div_isp1", E4X12_DIV_ISP1, 0, 3),
> -       DIV(div_mcuisp0, "div_mcuisp0", "aclk400_mcuisp", E4X12_DIV_ISP1, 4, 3),
> -       DIV(div_mcuisp1, "div_mcuisp1", "div_mcuisp0", E4X12_DIV_ISP1, 8, 3),
> +       DIV_F(div_mcuisp0, "div_mcuisp0", "aclk400_mcuisp", E4X12_DIV_ISP1,
> +                                               4, 3, CLK_GET_RATE_NOCACHE, 0),
> +       DIV_F(div_mcuisp1, "div_mcuisp1", "div_mcuisp0", E4X12_DIV_ISP1,
> +                                               8, 3, CLK_GET_RATE_NOCACHE, 0),
>         DIV(sclk_fimg2d, "sclk_fimg2d", "mout_g2d", DIV_DMC1, 0, 4),
>  };
> 
> @@ -863,57 +867,57 @@ struct samsung_gate_clock exynos4x12_gate_clks[] __initdata = {
>         GATE_DA(i2s0, "samsung-i2s.0", "i2s0", "aclk100",
>                         E4X12_GATE_IP_MAUDIO, 3, 0, 0, "iis"),
>         GATE(fimc_isp, "isp", "aclk200", E4X12_GATE_ISP0, 0,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(fimc_drc, "drc", "aclk200", E4X12_GATE_ISP0, 1,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(fimc_fd, "fd", "aclk200", E4X12_GATE_ISP0, 2,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(fimc_lite0, "lite0", "aclk200", E4X12_GATE_ISP0, 3,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(fimc_lite1, "lite1", "aclk200", E4X12_GATE_ISP0, 4,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(mcuisp, "mcuisp", "aclk200", E4X12_GATE_ISP0, 5,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(gicisp, "gicisp", "aclk200", E4X12_GATE_ISP0, 7,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(smmu_isp, "smmu_isp", "aclk200", E4X12_GATE_ISP0, 8,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(smmu_drc, "smmu_drc", "aclk200", E4X12_GATE_ISP0, 9,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(smmu_fd, "smmu_fd", "aclk200", E4X12_GATE_ISP0, 10,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(smmu_lite0, "smmu_lite0", "aclk200", E4X12_GATE_ISP0, 11,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(smmu_lite1, "smmu_lite1", "aclk200", E4X12_GATE_ISP0, 12,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(ppmuispmx, "ppmuispmx", "aclk200", E4X12_GATE_ISP0, 20,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(ppmuispx, "ppmuispx", "aclk200", E4X12_GATE_ISP0, 21,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(mcuctl_isp, "mcuctl_isp", "aclk200", E4X12_GATE_ISP0, 23,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(mpwm_isp, "mpwm_isp", "aclk200", E4X12_GATE_ISP0, 24,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(i2c0_isp, "i2c0_isp", "aclk200", E4X12_GATE_ISP0, 25,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(i2c1_isp, "i2c1_isp", "aclk200", E4X12_GATE_ISP0, 26,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(mtcadc_isp, "mtcadc_isp", "aclk200", E4X12_GATE_ISP0, 27,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(pwm_isp, "pwm_isp", "aclk200", E4X12_GATE_ISP0, 28,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(wdt_isp, "wdt_isp", "aclk200", E4X12_GATE_ISP0, 30,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(uart_isp, "uart_isp", "aclk200", E4X12_GATE_ISP0, 31,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(asyncaxim, "asyncaxim", "aclk200", E4X12_GATE_ISP1, 0,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(smmu_ispcx, "smmu_ispcx", "aclk200", E4X12_GATE_ISP1, 4,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(spi0_isp, "spi0_isp", "aclk200", E4X12_GATE_ISP1, 12,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(spi1_isp, "spi1_isp", "aclk200", E4X12_GATE_ISP1, 13,
> -                       CLK_IGNORE_UNUSED, 0),
> +                       CLK_IGNORE_UNUSED | CLK_GET_RATE_NOCACHE, 0),
>         GATE(g2d, "g2d", "aclk200", GATE_IP_DMC, 23, 0, 0),
>  };
> 
> --
> 1.7.4.1
