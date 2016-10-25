From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk/samsung: Clear OF_POPULATED flag from clkout node in
 init callback
Date: Tue, 25 Oct 2016 13:30:58 -0700
Message-ID: <20161025203058.GZ26139@codeaurora.org>
References: <CGME20161025123519eucas1p1f8d2efba82ebd101e8fa0697a5708a28@eucas1p1.samsung.com>
 <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/25, Marek Szyprowski wrote:
> diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
> index 96fab6cfb202..57303cfec7d4 100644
> --- a/drivers/clk/samsung/clk-exynos-clkout.c
> +++ b/drivers/clk/samsung/clk-exynos-clkout.c
> @@ -116,6 +116,12 @@ static void __init exynos_clkout_init(struct device_node *node, u32 mux_mask)
>  
>  	register_syscore_ops(&exynos_clkout_syscore_ops);
>  
> +	/*
> +	 * Clear the OF_POPULATED flag set in of_irq_init so that

This comment is incorrect. This code is clearing the flag set in
of_clk_init() right?

> +	 * later the Exynos PMU platform device won't be skipped.
> +	 */
> +	of_node_clear_flag(node, OF_POPULATED);
> +
>  	return;
>  

We have a macro for this in clk land. CLK_OF_DECLARE_DRIVER. Can
you use that instead please? It makes things like grep much
easier.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
