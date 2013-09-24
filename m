From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V2 1/6] clk: exynos-audss: convert to platform device
Date: Tue, 24 Sep 2013 11:35:27 +0200
Message-ID: <52415CDF.4090002@samsung.com>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
 <1379982078-23381-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1379982078-23381-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel@vg
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 24/09/13 02:21, Andrew Bresticker wrote:
> @@ -62,24 +64,29 @@ static struct syscore_ops exynos_audss_clk_syscore_ops = {
>  #endif /* CONFIG_PM_SLEEP */
>  
>  /* register exynos_audss clocks */
> -static void __init exynos_audss_clk_init(struct device_node *np)
> +static int exynos_audss_clk_probe(struct platform_device *pdev)
>  {
> -	reg_base = of_iomap(np, 0);
> -	if (!reg_base) {
> -		pr_err("%s: failed to map audss registers\n", __func__);
> -		return;
> +	struct resource *res;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	reg_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(reg_base)) {
> +		dev_err(&pdev->dev, "failed to map audss registers\n");
> +		return PTR_ERR(reg_base);
>  	}
>  
> -	clk_table = kzalloc(sizeof(struct clk *) * EXYNOS_AUDSS_MAX_CLKS,
> +	clk_table = devm_kzalloc(&pdev->dev,
> +				sizeof(struct clk *) * EXYNOS_AUDSS_MAX_CLKS,
>  				GFP_KERNEL);
>  	if (!clk_table) {
> -		pr_err("%s: could not allocate clk lookup table\n", __func__);
> -		return;
> +		dev_err(&pdev->dev, "could not allocate clk lookup table\n");

You could drop this error log, k*alloc() functions already log any errors.

> +		return -ENOMEM;
>  	}
>  
>  	clk_data.clks = clk_table;
>  	clk_data.clk_num = EXYNOS_AUDSS_MAX_CLKS;
> -	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> +	of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
> +				&clk_data);

>  	clk_table[EXYNOS_MOUT_AUDSS] = clk_register_mux(NULL, "mout_audss",
>  				mout_audss_p, ARRAY_SIZE(mout_audss_p),
> @@ -128,8 +135,53 @@ static void __init exynos_audss_clk_init(struct device_node *np)
>  #endif
>  
>  	pr_info("Exynos: Audss: clock setup completed\n");
> +
> +	return 0;
> +}
> +
> +static int exynos_audss_clk_remove(struct platform_device *pdev)
> +{
> +	int i;
> +
> +	for (i = 0; i < EXYNOS_AUDSS_MAX_CLKS; i++) {
> +		if (clk_table[i])

This would need to be:
		if (!IS_ERR(clk_table[i]))

Note the clock provider should be unregistered first, to avoid potential
race condition, where the clock provider returns an invalid pointer to
a clock, which has already been unregistered and freed.

I just noticed the sequence in probe needs to be fixed as well. i.e.
clocks should be created with clk_register() before the clock provider
is actually registered. It might warrant a separate patch but it's
probably also fine to make such change part of this patch.

> +			clk_unregister(clk_table[i]);
> +	}
> +
> +	of_clk_del_provider(pdev->dev.of_node);
> +
> +	return 0;
>  }

--
Thanks,
Sylwester
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
