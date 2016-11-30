From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk/samsung: exynos-audss: Replace syscore PM with
 platform device PM
Date: Wed, 30 Nov 2016 09:33:47 +0900
Message-ID: <583E1E6B.7090703@samsung.com>
References: <CGME20161125094012epcas5p49d6feefb149c4bbb9937a43c1562cb72@epcas5p4.samsung.com>
 <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:45727 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755173AbcK3Adz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 19:33:55 -0500
In-reply-to: <1480066794-18713-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Dear Marek,

Looks good to me. I just proceeded the build test.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi

On 2016년 11월 25일 18:39, Marek Szyprowski wrote:
> Exynos AUDSS clock driver has beem already converted to platform driver, so
> remove the dependency on the syscore ops - the last remaining non-platform
> driver feature. Platform device's system sleep PM provides all needed
> infrastructure for replacing syscore-based PM, so do it now.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index 17e68a724945..cb7df358a27d 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -44,7 +44,7 @@
>  	{ ASS_CLK_GATE, 0 },
>  };
>  
> -static int exynos_audss_clk_suspend(void)
> +static int exynos_audss_clk_suspend(struct device *dev)
>  {
>  	int i;
>  
> @@ -54,18 +54,15 @@ static int exynos_audss_clk_suspend(void)
>  	return 0;
>  }
>  
> -static void exynos_audss_clk_resume(void)
> +static int exynos_audss_clk_resume(struct device *dev)
>  {
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(reg_save); i++)
>  		writel(reg_save[i][1], reg_base + reg_save[i][0]);
> -}
>  
> -static struct syscore_ops exynos_audss_clk_syscore_ops = {
> -	.suspend	= exynos_audss_clk_suspend,
> -	.resume		= exynos_audss_clk_resume,
> -};
> +	return 0;
> +}
>  #endif /* CONFIG_PM_SLEEP */
>  
>  struct exynos_audss_clk_drvdata {
> @@ -251,9 +248,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  		goto unregister;
>  	}
>  
> -#ifdef CONFIG_PM_SLEEP
> -	register_syscore_ops(&exynos_audss_clk_syscore_ops);
> -#endif
>  	return 0;
>  
>  unregister:
> @@ -267,10 +261,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
>  
>  static int exynos_audss_clk_remove(struct platform_device *pdev)
>  {
> -#ifdef CONFIG_PM_SLEEP
> -	unregister_syscore_ops(&exynos_audss_clk_syscore_ops);
> -#endif
> -
>  	of_clk_del_provider(pdev->dev.of_node);
>  
>  	exynos_audss_clk_teardown();
> @@ -281,10 +271,16 @@ static int exynos_audss_clk_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct dev_pm_ops exynos_audss_clk_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(exynos_audss_clk_suspend,
> +				     exynos_audss_clk_resume)
> +};
> +
>  static struct platform_driver exynos_audss_clk_driver = {
>  	.driver	= {
>  		.name = "exynos-audss-clk",
>  		.of_match_table = exynos_audss_clk_of_match,
> +		.pm = &exynos_audss_clk_pm_ops,
>  	},
>  	.probe = exynos_audss_clk_probe,
>  	.remove = exynos_audss_clk_remove,
> 
