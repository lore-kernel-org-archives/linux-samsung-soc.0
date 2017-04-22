From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/4] clk: samsung: s5pv210-audss: Convert to the new
 clk_hw API
Date: Sat, 22 Apr 2017 17:11:15 +0200
Message-ID: <20170422151115.r3x3lyaevyh4kqp3@kozik-lap>
References: <1492694199-9553-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170420131647eucas1p2c9c0fa48776f7af4652250e3384bf52b@eucas1p2.samsung.com>
 <1492694199-9553-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1492694199-9553-5-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Apr 20, 2017 at 03:16:39PM +0200, Marek Szyprowski wrote:
> Clock providers should use the new struct clk_hw based API, so convert
> Samsung S5PV210 Audio Subsystem clock provider to the new approach.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s5pv210-audss.c | 50 +++++++++++++++++----------------
>  1 file changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
> index c66ed2d1450e..14d2e3367878 100644
> --- a/drivers/clk/samsung/clk-s5pv210-audss.c
> +++ b/drivers/clk/samsung/clk-s5pv210-audss.c
> @@ -24,9 +24,8 @@
>  #include <dt-bindings/clock/s5pv210-audss.h>
>  
>  static DEFINE_SPINLOCK(lock);
> -static struct clk **clk_table;
>  static void __iomem *reg_base;
> -static struct clk_onecell_data clk_data;
> +static struct clk_hw_onecell_data *clk_data;
>  
>  #define ASS_CLK_SRC 0x0
>  #define ASS_CLK_DIV 0x4
> @@ -71,6 +70,7 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
>  	const char *mout_audss_p[2];
>  	const char *mout_i2s_p[3];
>  	const char *hclk_p;
> +	struct clk_hw **clk_table;
>  	struct clk *hclk, *pll_ref, *pll_in, *cdclk, *sclk_audio;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> @@ -80,14 +80,16 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
>  		return PTR_ERR(reg_base);
>  	}
>  
> -	clk_table = devm_kzalloc(&pdev->dev,
> -				sizeof(struct clk *) * AUDSS_MAX_CLKS,
> +	clk_data = devm_kzalloc(&pdev->dev,
> +				sizeof(*clk_data) +
> +				sizeof(*clk_data->hws) * AUDSS_MAX_CLKS,
>  				GFP_KERNEL);
> -	if (!clk_table)
> +
> +	if (!clk_data)
>  		return -ENOMEM;
>  
> -	clk_data.clks = clk_table;
> -	clk_data.clk_num = AUDSS_MAX_CLKS;
> +	clk_data->num = AUDSS_MAX_CLKS;
> +	clk_table = clk_data->hws;
>  
>  	hclk = devm_clk_get(&pdev->dev, "hclk");
>  	if (IS_ERR(hclk)) {
> @@ -116,7 +118,7 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
>  	else
>  		mout_audss_p[0] = "xxti";
>  	mout_audss_p[1] = __clk_get_name(pll_in);
> -	clk_table[CLK_MOUT_AUDSS] = clk_register_mux(NULL, "mout_audss",
> +	clk_data->hws[CLK_MOUT_AUDSS] = clk_hw_register_mux(NULL, "mout_audss",

Shouldn't it be:
clk_table[CLK_MOUT_AUDSS]
?

Best regards,
Krzysztof

