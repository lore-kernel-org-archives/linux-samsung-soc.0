From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 2/7] clk: samsung: exynos5410: Expose the peripheral DMA
 gate clocks
Date: Wed, 07 Sep 2016 13:30:57 +0900
Message-ID: <57CF9801.3080107@samsung.com>
References: <1473163496-17820-1-git-send-email-s.nawrocki@samsung.com>
 <CGME20160906120548epcas1p3b2313939979423df06127e02ee640fa4@epcas1p3.samsung.com>
 <1473163496-17820-3-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1473163496-17820-3-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 2016년 09월 06일 21:04, Sylwester Nawrocki wrote:
> These clocks are needed in order to use the PL330 peripheral
> DMA controllers.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5410.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index 54ec486..cf6fb41 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -176,6 +176,8 @@ static const struct samsung_gate_clock exynos5410_gate_clks[] __initconst = {
>  	GATE(CLK_MMC0, "sdmmc0", "aclk200", GATE_BUS_FSYS0, 12, 0, 0),
>  	GATE(CLK_MMC1, "sdmmc1", "aclk200", GATE_BUS_FSYS0, 13, 0, 0),
>  	GATE(CLK_MMC2, "sdmmc2", "aclk200", GATE_BUS_FSYS0, 14, 0, 0),
> +	GATE(CLK_PDMA1, "pdma1", "aclk200", GATE_BUS_FSYS0, 2, 0, 0),
> +	GATE(CLK_PDMA0, "pdma0", "aclk200", GATE_BUS_FSYS0, 1, 0, 0),
> 
>  	GATE(CLK_SCLK_USBPHY301, "sclk_usbphy301", "dout_usbphy301",
>  	     GATE_TOP_SCLK_FSYS, 7, CLK_SET_RATE_PARENT, 0),

Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
