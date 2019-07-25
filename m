From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 1/5] devfreq: exynos-bus: correct clock enable
 sequence
Date: Thu, 25 Jul 2019 18:58:43 +0900
Message-ID: <9c29db92-2452-0ff3-3ffa-d861e4327bc9@samsung.com>
References: <20190719150535.15501-1-k.konieczny@partner.samsung.com>
        <CGME20190719150553eucas1p1665462f3fc0e06fc9c082e258be3a851@eucas1p1.samsung.com>
        <20190719150535.15501-2-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719150535.15501-2-k.konieczny@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kamil,

On 19. 7. 20. 오전 12:05, k.konieczny@partner.samsung.com wrote:
> Regulators should be enabled before clocks to avoid h/w hang. This
> require change in exynos_bus_probe() to move exynos_bus_parse_of()
> after exynos_bus_parent_parse_of() and change in enabling sequence
> of regulator and clock in exynos_bus_parse_of(). Similar change is
> needed in exynos_bus_exit() where clock should be disabled first.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
> This patch is new to this series.
> 
> ---
>  drivers/devfreq/exynos-bus.c | 58 ++++++++++++++++++++----------------
>  1 file changed, 32 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 486cc5b422f1..f391044aa39d 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -194,11 +194,11 @@ static void exynos_bus_exit(struct device *dev)
>  	if (ret < 0)
>  		dev_warn(dev, "failed to disable the devfreq-event devices\n");
>  
> +	clk_disable_unprepare(bus->clk);
>  	if (bus->regulator)
>  		regulator_disable(bus->regulator);
>  
>  	dev_pm_opp_of_remove_table(dev);
> -	clk_disable_unprepare(bus->clk);
>  }
>  
>  /*
> @@ -326,8 +326,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>  	return ret;
>  }
>  
> -static int exynos_bus_parse_of(struct device_node *np,
> -			      struct exynos_bus *bus)
> +static int exynos_bus_parse_of(struct exynos_bus *bus)
>  {
>  	struct device *dev = bus->dev;
>  	struct dev_pm_opp *opp;
> @@ -341,36 +340,35 @@ static int exynos_bus_parse_of(struct device_node *np,
>  		return PTR_ERR(bus->clk);
>  	}
>  
> -	ret = clk_prepare_enable(bus->clk);
> +	/* Get the freq and voltage from OPP table to scale the bus freq */
> +	ret = dev_pm_opp_of_add_table(dev);
>  	if (ret < 0) {
> -		dev_err(dev, "failed to get enable clock\n");
> +		dev_err(dev, "failed to get OPP table\n");
>  		return ret;
>  	}
>  
> -	/* Get the freq and voltage from OPP table to scale the bus freq */
> -	ret = dev_pm_opp_of_add_table(dev);
> +	ret = clk_prepare_enable(bus->clk);
>  	if (ret < 0) {
> -		dev_err(dev, "failed to get OPP table\n");
> +		dev_err(dev, "failed to enable clock\n");
>  		goto err_clk;
>  	}
> -
>  	rate = clk_get_rate(bus->clk);
>  
>  	opp = devfreq_recommended_opp(dev, &rate, 0);
>  	if (IS_ERR(opp)) {
>  		dev_err(dev, "failed to find dev_pm_opp\n");
>  		ret = PTR_ERR(opp);
> -		goto err_opp;
> +		goto err;
>  	}
>  	bus->curr_freq = dev_pm_opp_get_freq(opp);
>  	dev_pm_opp_put(opp);
>  
>  	return 0;
>  
> -err_opp:
> -	dev_pm_opp_of_remove_table(dev);
> -err_clk:
> +err:
>  	clk_disable_unprepare(bus->clk);
> +err_clk:
> +	dev_pm_opp_of_remove_table(dev);
>  
>  	return ret;
>  }
> @@ -386,6 +384,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  	struct exynos_bus *bus;
>  	int ret, max_state;
>  	unsigned long min_freq, max_freq;
> +	bool passive = false;
>  
>  	if (!np) {
>  		dev_err(dev, "failed to find devicetree node\n");
> @@ -399,27 +398,31 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  	bus->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, bus);
>  
> -	/* Parse the device-tree to get the resource information */
> -	ret = exynos_bus_parse_of(np, bus);
> -	if (ret < 0)
> -		return ret;
> -
>  	profile = devm_kzalloc(dev, sizeof(*profile), GFP_KERNEL);
> -	if (!profile) {
> -		ret = -ENOMEM;
> -		goto err;
> -	}
> +	if (!profile)
> +		return -ENOMEM;
>  
>  	node = of_parse_phandle(dev->of_node, "devfreq", 0);
>  	if (node) {
>  		of_node_put(node);
> -		goto passive;
> +		passive = true;
>  	} else {
>  		ret = exynos_bus_parent_parse_of(np, bus);
> +		if (ret < 0)
> +			return ret;
>  	}
>  
> -	if (ret < 0)
> -		goto err;
> +	/* Parse the device-tree to get the resource information */
> +	ret = exynos_bus_parse_of(bus);
> +	if (ret < 0) {
> +		if (!passive)
> +			regulator_disable(bus->regulator);
> +
> +		return ret;
> +	}
> +
> +	if (passive)
> +		goto passive;
>  
>  	/* Initialize the struct profile and governor data for parent device */
>  	profile->polling_ms = 50;
> @@ -508,8 +511,11 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err:
> -	dev_pm_opp_of_remove_table(dev);
>  	clk_disable_unprepare(bus->clk);
> +	if (!passive)
> +		regulator_disable(bus->regulator);
> +
> +	dev_pm_opp_of_remove_table(dev);
>  
>  	return ret;
>  }
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
