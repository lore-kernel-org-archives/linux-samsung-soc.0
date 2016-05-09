From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 04/22] clk: samsung: exynos5410: Provide fin_pll
 external fixed clock
Date: Mon, 9 May 2016 16:19:46 -0400
Message-ID: <e805f0d3-038b-72ce-4464-ac3605e9e5bb@osg.samsung.com>
References: <1462734367-5619-1-git-send-email-krzk@kernel.org>
 <1462734367-5619-5-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462734367-5619-5-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/08/2016 03:05 PM, Krzysztof Kozlowski wrote:
> Just like clock driver for Exynos542x/5800, provide the fixed clock here
> so the clock bindings and their consumers would be consistent and
> similar.
> 
> However a clock named "fin_pll" is already provided by generic
> fixed-clock and it is both referenced in the clock driver (by name) and
> in DT (by phandle). To make the transition smooth, first introduce the
> new external fixed clock here under temporary, different name and switch
> internal users to it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

[snip]

>  
> +/* Same as in Exynos5420 */
> +static const struct of_device_id ext_clk_match[] __initconst = {
> +	{ .compatible = "samsung,exynos5420-oscclk", .data = (void *)0, },

Since using designated initializers, I was about to say that there is no need
to explicitly set .data to 0 since omitted fields are implicitly initialized...

> +	{ },
> +};
> +
>  /* register exynos5410 clocks */
>  static void __init exynos5410_clk_init(struct device_node *np)
>  {
> @@ -192,6 +204,10 @@ static void __init exynos5410_clk_init(struct device_node *np)
>  
>  	ctx = samsung_clk_init(np, reg_base, CLK_NR_CLKS);
>  
> +	samsung_clk_of_register_fixed_ext(ctx, exynos5x_fixed_rate_ext_clks,
> +			ARRAY_SIZE(exynos5x_fixed_rate_ext_clks),
> +			ext_clk_match);
> +

... but then I noticed that .data is used as exynos5x_fixed_rate_ext_clks
array index in samsung_clk_of_register_fixed_ext(). So makes sense to set
it explicitly to make the intent clear.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
