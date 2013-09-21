From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] clk: exynos-audss: convert to platform device
Date: Sat, 21 Sep 2013 14:50:51 +0200
Message-ID: <1530327.jvk44KuFQA@flatron>
References: <1379711637-5226-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379711637-5226-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tushar Behera <tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yadwinder Singh Brar <yadi.brar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrew,

This patch looks good overall, but I have some minor comments inline.

On Friday 20 of September 2013 14:13:52 Andrew Bresticker wrote:
> The Exynos AudioSS clock controller will later be modified to allow
> input clocks to be specified via device-tree in order to support
> multiple Exynos SoCs.  This will introduce a dependency on the core
> SoC clock controller being initialized first so that the AudioSS driver
> can look up its input clocks, but the order in which clock providers
> are probed in of_clk_init() is not guaranteed.  Since deferred probing
> is not supported in of_clk_init() and the AudioSS block is not the core
> controller, we can initialize it later as a platform device.
> 
> Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 71
> +++++++++++++++++++++++++++------- 1 file changed, 58 insertions(+), 13
> deletions(-)
[snip]
> +static int exynos_audss_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +
> +	return 0;
>  }

Don't we need to unregister all the registered clocks in remove? This also 
leads to another question: Do we even need removal support for this 
driver?

> -CLK_OF_DECLARE(exynos4210_audss_clk, "samsung,exynos4210-audss-clock",
> -		exynos_audss_clk_init);
> -CLK_OF_DECLARE(exynos5250_audss_clk, "samsung,exynos5250-audss-clock",
> -		exynos_audss_clk_init);
> +
> +static const struct of_device_id exynos_audss_clk_of_match[] = {
> +	{ .compatible = "samsung,exynos4210-audss-clock", },
> +	{ .compatible = "samsung,exynos5250-audss-clock", },
> +	{},
> +};
> +
> +static struct platform_driver exynos_audss_clk_driver = {
> +	.driver	= {
> +		.name = "exynos-audss-clk",
> +		.owner = THIS_MODULE,
> +		.of_match_table = exynos_audss_clk_of_match,
> +	},
> +	.probe = exynos_audss_clk_probe,
> +	.remove = exynos_audss_clk_remove,
> +};
> +
> +static int __init exynos_audss_clk_init(void)
> +{
> +	return platform_driver_register(&exynos_audss_clk_driver);
> +}
> +core_initcall(exynos_audss_clk_init);

Does it need to be core_initcall? Drivers depending on clocks provided by 
this driver should be able to defer probing if they are probed before this 
driver.

Then you would be able to simply use module_platform_driver() below.

> +static void __init exynos_audss_clk_exit(void)
> +{
> +	platform_driver_unregister(&exynos_audss_clk_driver);
> +}
> +module_exit(exynos_audss_clk_exit);
> +
> +MODULE_AUTHOR("Padmavathi Venna <padma.v-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
> +MODULE_DESCRIPTION("Exynos AudioSS Clock Controller");

nit: IMHO Audio Subsystem instead of AudioSS would be more meaningful.

> +MODULE_LICENSE("GPL");

This should be GPL v2.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
