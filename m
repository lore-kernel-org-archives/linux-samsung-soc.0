From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/4] watchdog: s3c2410_wdt: parse watchdog dt node to read
 PMU registers adresses
Date: Tue, 17 Sep 2013 15:30:55 +0200
Message-ID: <3395282.rv7qzo3E3P@amdc1227>
References: <1379414623-26329-1-git-send-email-l.krishna@samsung.com>
 <1379414623-26329-4-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1379414623-26329-4-git-send-email-l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Leela,

Please see my comments below.

On Tuesday 17 of September 2013 16:13:42 Leela Krishna Amudala wrote:
> This patch parses the watchdog node to read pmu wdt sys registers
> addresses and do mask/unmask enable/disable of WDT in probe and s2r
> scenarios.
> 
> Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |   14 ++++-
>  drivers/watchdog/s3c2410_wdt.c                     |   56
> ++++++++++++++++++++ 2 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt index
> 2aa486c..4c798e3 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> @@ -7,8 +7,20 @@ occurred.
>  Required properties:
>  - compatible : should be "samsung,s3c2410-wdt"

Since the WDT block of Exynos 5420 needs some extra configuration in PMU 
registers, it is no longer compatible with samsung.s3c2410-wdt. Please 
introduce separate compatible ("samsung,exynos5420-wdt") and make the 
driver handle the additional configuration only if running on a device with 
this compatible value.

I'd suggest introducing quirk system to the driver and adding a 
NEEDS_PMU_CONFIG quirk selected by DT match entry with "samsung,exynos5420-
wdt" compatible.

>  - reg : base physical address of the controller and length of memory
> mapped -	region.
> +	region and the optional (addresses and length of memory mapped regions
> +	of) PMU registers for masking/unmasking WDT.
>  - interrupts : interrupt number to the cpu.
> 
>  Optional properties:
>  - timeout-sec : contains the watchdog timeout in seconds.
> +- reset-mask-bit: bit number in the PMU registers to program mask/unmask
> WDT. +

I believe this is mandatory on Exynos 5420 and unused on previous SoCs. It 
should be handled depending on compatible value.

>
[...]
> +static void s3c2410wdt_mask_and_disable_reset(int mask, struct
> s3c2410_wdt *wdt) +{
> +	unsigned int value;
> +
> +	if (IS_ERR(wdt->pmu_disable_reg) || IS_ERR(wdt->pmu_mask_reset_reg)
> +					 || (wdt->pmu_mask_bit < 0))
> +		return;

This function could be called only if respective quirk is active and the 
check above could be dropped.

> +
> +	if (mask) {
> +		value = readl(wdt->pmu_disable_reg);
> +		value |= (1 << wdt->pmu_mask_bit);
> +		writel(value, wdt->pmu_disable_reg);
> +
> +		value = readl(wdt->pmu_mask_reset_reg);
> +		value |= (1 << wdt->pmu_mask_bit);
> +		writel(value, wdt->pmu_mask_reset_reg);
> +	} else {
> +		value = readl(wdt->pmu_disable_reg);
> +		value &= ~(1 << wdt->pmu_mask_bit);
> +		writel(value, wdt->pmu_disable_reg);
> +
> +		value = readl(wdt->pmu_mask_reset_reg);
> +		value &= ~(1 << wdt->pmu_mask_bit);
> +		writel(value, wdt->pmu_mask_reset_reg);
> +	}

This can be greatly simplified by moving readl and writel outside the 
conditional block, i.e.

	u32 disable, mask_reset;

	disable = readl(wdt->pmu_disable_reg);
	mask_reset = readl(wdt->pmu_mask_reset_reg);

	if (mask) {
		disable |= (1 << wdt->pmu_mask_bit);
		mask_reset |= (1 << wdt->pmu_mask_bit);
	} else {
		disable &= ~(1 << wdt->pmu_mask_bit);
		mask_reset &= ~(1 << wdt->pmu_mask_bit);
	}

	writel(disable, wdt->pmu_disable_reg);
	writel(mask_reset, wdt->pmu_mask_reset_reg);

> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> @@ -341,6 +371,8 @@ static int s3c2410wdt_probe(struct platform_device
> *pdev) unsigned int wtcon;
>  	int started = 0;
>  	int ret;
> +	struct resource *res;
> +	unsigned int mask_bit;
> 
>  	DBG("%s: probe=%p\n", __func__, pdev);
> 
> @@ -369,6 +401,25 @@ static int s3c2410wdt_probe(struct platform_device
> *pdev) goto err;
>  	}

The code added below could be handled conditionally and missing PMU 
registers could simply trigger an error.

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	wdt->pmu_disable_reg = devm_ioremap_resource(&pdev->dev, res);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> +	wdt->pmu_mask_reset_reg = devm_ioremap_resource(&pdev->dev, res);
> +
> +	if (!IS_ERR(wdt->pmu_disable_reg) && !IS_ERR(wdt->pmu_mask_reset_reg))
> { +		if (pdev->dev.of_node) {
> +			if (of_property_read_u32(pdev->dev.of_node,
> +							"reset-mask-bit",
> +							&mask_bit)) {
> +				dev_warn(dev, "reset-mask-bit not specified\n");
> +				wdt->pmu_mask_bit = -EINVAL;
> +			} else {
> +				wdt->pmu_mask_bit = mask_bit;
> +			}
> +		}
> +	}
> +
>  	DBG("probe: mapped reg_base=%p\n", wdt->reg_base);
> 
>  	wdt->clock = devm_clk_get(dev, "watchdog");
> @@ -444,6 +495,7 @@ static int s3c2410wdt_probe(struct platform_device
> *pdev) (wtcon & S3C2410_WTCON_RSTEN) ? "en" : "dis",
>  		 (wtcon & S3C2410_WTCON_INTEN) ? "en" : "dis");
> 
> +	s3c2410wdt_mask_and_disable_reset(0, wdt);

The call above (and further call to this function bellow) could happen 
conditionally.

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
