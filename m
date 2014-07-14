From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH V2 3/3] clk: exynos-audss: Use samsung clock APIs to
 register/unregister clocks
Date: Mon, 14 Jul 2014 17:34:34 +0200
Message-ID: <53C3F88A.8080005@samsung.com>
References: <1405080036-6651-1-git-send-email-tushar.b@samsung.com>
 <1405080036-6651-4-git-send-email-tushar.b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:37594 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754890AbaGNPeq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 11:34:46 -0400
In-reply-to: <1405080036-6651-4-git-send-email-tushar.b@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.b@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, t.figa@samsung.com, trblinux@gmail.com

On 11/07/14 14:00, Tushar Behera wrote:
> @@ -103,17 +140,11 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  		return PTR_ERR(reg_base);
>  	}
>  
> -	clk_table = devm_kzalloc(&pdev->dev,
> -				sizeof(struct clk *) * EXYNOS_AUDSS_MAX_CLKS,
> -				GFP_KERNEL);
> -	if (!clk_table)
> +	ctx = samsung_clk_init(pdev->dev.of_node, reg_base, nr_clks);

There is an issue here that this registers the clk provider before all
its clocks are registered with the clk core. Therefore it introduces
a race condition.

Please have a look at patch [1], you may want to rebase this series
onto that patch.

> +	samsung_clk_register_div(ctx, exynos_audss_div_clks,
> +				ARRAY_SIZE(exynos_audss_div_clks));
[...]
> +	samsung_clk_register_gate(ctx, exynos_audss_gate_clks,
> +				ARRAY_SIZE(exynos_audss_gate_clks));
[...]
> -	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
> -					&clk_data);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to add clock provider\n");
> -		goto unregister;
> +		samsung_clk_register_gate(ctx, exynos5420_audss_gate_clks,
> +					ARRAY_SIZE(exynos5420_audss_gate_clks));
>  	}

[1]
https://git.kernel.org/cgit/linux/kernel/git/tfiga/samsung-clk.git/commit/?h=samsung-clk-next&id=d5e136a21b2028fb1f45143ea7112d5869bfc6c7

--
Regards,
Sylwester
