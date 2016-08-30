From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 5/5] clk: samsung: Add support for exynos5410 AUDSS clock
 controller
Date: Tue, 30 Aug 2016 12:38:32 +0200
Message-ID: <94535e9f-7c13-8be2-3bdf-8c3d3354c688@samsung.com>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-6-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1471883463-1950-6-git-send-email-s.nawrocki@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
> Exynos5410 Audio Subsystem Clock Controller, comparing to the already
> supported by the driver IP block revisions, has additionally an I2S_MST
> divider so a new compatible string is added.
> While at it, the variant handling is reworked to avoid scattered testing
> for the controller's variant.

Please split it into simple changes:
1. Whitespace cleanup (below you do it).
2. Variant handling rework.
3. New compatible added.

This would make easy to spot changes and new features.

Best regards,
Krzysztof

> The I2S_MST divider clock will be added in a subsequent patch.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../devicetree/bindings/clock/clk-exynos-audss.txt |  4 +-
>  drivers/clk/samsung/clk-exynos-audss.c             | 78 ++++++++++++----------
>  2 files changed, 47 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> index 180e883..0c3d601 100644
> --- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> +++ b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> @@ -10,6 +10,8 @@ Required Properties:
>    - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
>    - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
>      SoCs.
> +  - "samsung,exynos5410-audss-clock" - controller compatible with Exynos5410
> +    SoCs.
>    - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
>      SoCs.
>  - reg: physical base address and length of the controller's register set.
> @@ -91,5 +93,5 @@ i2s0: i2s@03830000 {
>  		<&clock_audss EXYNOS_MOUT_AUDSS>,
>  		<&clock_audss EXYNOS_MOUT_I2S>;
>  	clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
> -	"mout_audss", "mout_i2s";
> +		      "mout_audss", "mout_i2s";
>  };
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index bdf8b97..328260c 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -14,18 +14,13 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  
>  #include <dt-bindings/clock/exynos-audss-clk.h>
>  
> -enum exynos_audss_clk_type {
> -	TYPE_EXYNOS4210,
> -	TYPE_EXYNOS5250,
> -	TYPE_EXYNOS5420,
> -};
> -
>  static DEFINE_SPINLOCK(lock);
>  static struct clk **clk_table;
>  static void __iomem *reg_base;
> @@ -44,9 +39,9 @@ static struct clk *epll;
>  
>  #ifdef CONFIG_PM_SLEEP
>  static unsigned long reg_save[][2] = {
> -	{ASS_CLK_SRC,  0},
> -	{ASS_CLK_DIV,  0},
> -	{ASS_CLK_GATE, 0},
> +	{ ASS_CLK_SRC,  0 },
> +	{ ASS_CLK_DIV,  0 },
> +	{ ASS_CLK_GATE, 0 },
>  };
>  
>  static int exynos_audss_clk_suspend(void)
> @@ -73,14 +68,37 @@ static struct syscore_ops exynos_audss_clk_syscore_ops = {
>  };
>  #endif /* CONFIG_PM_SLEEP */
>  
> +struct exynos_audss_clk_drvdata {
> +	unsigned int has_adma_clk:1;
> +	unsigned int enable_epll:1;
> +	unsigned int num_clks;
> +};
> +
> +static const struct exynos_audss_clk_drvdata exynos4210_drvdata = {
> +	.num_clks	= EXYNOS_AUDSS_MAX_CLKS - 1,
> +};
> +
> +static const struct exynos_audss_clk_drvdata exynos5420_drvdata = {
> +	.num_clks	= EXYNOS_AUDSS_MAX_CLKS,
> +	.has_adma_clk	= 1,
> +	.enable_epll	= 1,
> +};
> +
>  static const struct of_device_id exynos_audss_clk_of_match[] = {
> -	{ .compatible = "samsung,exynos4210-audss-clock",
> -	  .data = (void *)TYPE_EXYNOS4210, },
> -	{ .compatible = "samsung,exynos5250-audss-clock",
> -	  .data = (void *)TYPE_EXYNOS5250, },
> -	{ .compatible = "samsung,exynos5420-audss-clock",
> -	  .data = (void *)TYPE_EXYNOS5420, },
> -	{},
> +	{
> +		.compatible	= "samsung,exynos4210-audss-clock",
> +		.data		= &exynos4210_drvdata,
> +	}, {
> +		.compatible	= "samsung,exynos5250-audss-clock",
> +		.data		= &exynos4210_drvdata,
> +	}, {
> +		.compatible	= "samsung,exynos5410-audss-clock",
> +		.data		= &exynos4210_drvdata,
> +	}, {
> +		.compatible	= "samsung,exynos5420-audss-clock",
> +		.data		= &exynos5420_drvdata,
> +	},
> +	{ },
>  };
>  
>  static void exynos_audss_clk_teardown(void)
> @@ -106,19 +124,17 @@ static void exynos_audss_clk_teardown(void)
>  /* register exynos_audss clocks */
>  static int exynos_audss_clk_probe(struct platform_device *pdev)
>  {
> -	int i, ret = 0;
> -	struct resource *res;
>  	const char *mout_audss_p[] = {"fin_pll", "fout_epll"};
>  	const char *mout_i2s_p[] = {"mout_audss", "cdclk0", "sclk_audio0"};
>  	const char *sclk_pcm_p = "sclk_pcm0";
>  	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
> -	const struct of_device_id *match;
> -	enum exynos_audss_clk_type variant;
> +	const struct exynos_audss_clk_drvdata *variant;
> +	struct resource *res;
> +	int i, ret = 0;
>  
> -	match = of_match_node(exynos_audss_clk_of_match, pdev->dev.of_node);
> -	if (!match)
> +	variant = of_device_get_match_data(&pdev->dev);
> +	if (!variant)
>  		return -EINVAL;
> -	variant = (enum exynos_audss_clk_type)match->data;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	reg_base = devm_ioremap_resource(&pdev->dev, res);
> @@ -126,7 +142,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  		dev_err(&pdev->dev, "failed to map audss registers\n");
>  		return PTR_ERR(reg_base);
>  	}
> -	/* EPLL don't have to be enabled for boards other than Exynos5420 */
> +
>  	epll = ERR_PTR(-ENODEV);
>  
>  	clk_table = devm_kzalloc(&pdev->dev,
> @@ -136,10 +152,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	clk_data.clks = clk_table;
> -	if (variant == TYPE_EXYNOS5420)
> -		clk_data.clk_num = EXYNOS_AUDSS_MAX_CLKS;
> -	else
> -		clk_data.clk_num = EXYNOS_AUDSS_MAX_CLKS - 1;
> +	clk_data.clk_num = variant->num_clks;
>  
>  	pll_ref = devm_clk_get(&pdev->dev, "pll_ref");
>  	pll_in = devm_clk_get(&pdev->dev, "pll_in");
> @@ -148,13 +161,13 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  	if (!IS_ERR(pll_in)) {
>  		mout_audss_p[1] = __clk_get_name(pll_in);
>  
> -		if (variant == TYPE_EXYNOS5420) {
> +		if (variant->enable_epll) {
>  			epll = pll_in;
>  
>  			ret = clk_prepare_enable(epll);
>  			if (ret) {
>  				dev_err(&pdev->dev,
> -						"failed to prepare the epll clock\n");
> +					"failed to prepare the epll clock\n");
>  				return ret;
>  			}
>  		}
> @@ -210,7 +223,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  				sclk_pcm_p, CLK_SET_RATE_PARENT,
>  				reg_base + ASS_CLK_GATE, 5, 0, &lock);
>  
> -	if (variant == TYPE_EXYNOS5420) {
> +	if (variant->has_adma_clk) {
>  		clk_table[EXYNOS_ADMA] = clk_register_gate(NULL, "adma",
>  				"dout_srp", CLK_SET_RATE_PARENT,
>  				reg_base + ASS_CLK_GATE, 9, 0, &lock);
> @@ -234,9 +247,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  	register_syscore_ops(&exynos_audss_clk_syscore_ops);
>  #endif
> -
> -	dev_info(&pdev->dev, "setup completed\n");
> -
>  	return 0;
>  
>  unregister:
> 

