From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 2/4] devfreq: exynos-bus: convert to use
 dev_pm_opp_set_rate()
Date: Thu, 8 Aug 2019 10:21:56 +0900
Message-ID: <9dd88e2e-f9fc-aa05-4ba4-8dfb009ec9f6@samsung.com>
References: <20190807133838.14678-1-k.konieczny@partner.samsung.com>
        <CGME20190807133857eucas1p23d2618db67434fa1301585cab059fa5b@eucas1p2.samsung.com>
        <20190807133838.14678-3-k.konieczny@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807133838.14678-3-k.konieczny@partner.samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: k.konieczny@partner.samsung.com
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kamil,

On 19. 8. 7. 오후 10:38, k.konieczny@partner.samsung.com wrote:
> Reuse opp core code for setting bus clock and voltage. As a side
> effect this allow usage of coupled regulators feature (required
> for boards using Exynos5422/5800 SoCs) because dev_pm_opp_set_rate()
> uses regulator_set_voltage_triplet() for setting regulator voltage
> while the old code used regulator_set_voltage_tol() with fixed
> tolerance. This patch also removes no longer needed parsing of DT
> property "exynos,voltage-tolerance" (no Exynos devfreq DT node uses
> it). After applying changes both functions exynos_bus_passive_target()
> and exynos_bus_target() have the same code, so remove
> exynos_bus_passive_target(). In exynos_bus_probe() replace it with
> exynos_bus_target.
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
> Changes:
> v5:
> - squashed last patch into this one, as suggested by Chanwoo Choi
> v4:
> - remove unrelated changes, add newline before comment
> 
> ---
>  drivers/devfreq/exynos-bus.c | 130 +++++++----------------------------
>  1 file changed, 24 insertions(+), 106 deletions(-)
> 
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index f34fa26f00d0..2aeb6cc07960 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -25,7 +25,6 @@
>  #include <linux/slab.h>
>  
>  #define DEFAULT_SATURATION_RATIO	40
> -#define DEFAULT_VOLTAGE_TOLERANCE	2
>  
>  struct exynos_bus {
>  	struct device *dev;
> @@ -37,9 +36,8 @@ struct exynos_bus {
>  
>  	unsigned long curr_freq;
>  
> -	struct regulator *regulator;
> +	struct opp_table *opp_table;
>  	struct clk *clk;
> -	unsigned int voltage_tolerance;
>  	unsigned int ratio;
>  };
>  
> @@ -93,62 +91,29 @@ static int exynos_bus_get_event(struct exynos_bus *bus,
>  }
>  
>  /*
> - * Must necessary function for devfreq simple-ondemand governor
> + * devfreq function for both simple-ondemand and passive governor
>   */
>  static int exynos_bus_target(struct device *dev, unsigned long *freq, u32 flags)
>  {
>  	struct exynos_bus *bus = dev_get_drvdata(dev);
>  	struct dev_pm_opp *new_opp;
> -	unsigned long old_freq, new_freq, new_volt, tol;
>  	int ret = 0;
>  
> -	/* Get new opp-bus instance according to new bus clock */
> +	/* Get correct frequency for bus. */
>  	new_opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(new_opp)) {
>  		dev_err(dev, "failed to get recommended opp instance\n");
>  		return PTR_ERR(new_opp);
>  	}
>  
> -	new_freq = dev_pm_opp_get_freq(new_opp);
> -	new_volt = dev_pm_opp_get_voltage(new_opp);
>  	dev_pm_opp_put(new_opp);
>  
> -	old_freq = bus->curr_freq;
> -
> -	if (old_freq == new_freq)
> -		return 0;
> -	tol = new_volt * bus->voltage_tolerance / 100;
> -
>  	/* Change voltage and frequency according to new OPP level */
>  	mutex_lock(&bus->lock);
> +	ret = dev_pm_opp_set_rate(dev, *freq);
> +	if (!ret)
> +		bus->curr_freq = *freq;
>  
> -	if (old_freq < new_freq) {
> -		ret = regulator_set_voltage_tol(bus->regulator, new_volt, tol);
> -		if (ret < 0) {
> -			dev_err(bus->dev, "failed to set voltage\n");
> -			goto out;
> -		}
> -	}
> -
> -	ret = clk_set_rate(bus->clk, new_freq);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to change clock of bus\n");
> -		clk_set_rate(bus->clk, old_freq);
> -		goto out;
> -	}
> -
> -	if (old_freq > new_freq) {
> -		ret = regulator_set_voltage_tol(bus->regulator, new_volt, tol);
> -		if (ret < 0) {
> -			dev_err(bus->dev, "failed to set voltage\n");
> -			goto out;
> -		}
> -	}
> -	bus->curr_freq = new_freq;
> -
> -	dev_dbg(dev, "Set the frequency of bus (%luHz -> %luHz, %luHz)\n",
> -			old_freq, new_freq, clk_get_rate(bus->clk));
> -out:
>  	mutex_unlock(&bus->lock);
>  
>  	return ret;
> @@ -196,54 +161,10 @@ static void exynos_bus_exit(struct device *dev)
>  
>  	dev_pm_opp_of_remove_table(dev);
>  	clk_disable_unprepare(bus->clk);
> -	if (bus->regulator)
> -		regulator_disable(bus->regulator);
> -}
> -
> -/*
> - * Must necessary function for devfreq passive governor
> - */
> -static int exynos_bus_passive_target(struct device *dev, unsigned long *freq,
> -					u32 flags)
> -{
> -	struct exynos_bus *bus = dev_get_drvdata(dev);
> -	struct dev_pm_opp *new_opp;
> -	unsigned long old_freq, new_freq;
> -	int ret = 0;
> -
> -	/* Get new opp-bus instance according to new bus clock */
> -	new_opp = devfreq_recommended_opp(dev, freq, flags);
> -	if (IS_ERR(new_opp)) {
> -		dev_err(dev, "failed to get recommended opp instance\n");
> -		return PTR_ERR(new_opp);
> -	}
> -
> -	new_freq = dev_pm_opp_get_freq(new_opp);
> -	dev_pm_opp_put(new_opp);
> -
> -	old_freq = bus->curr_freq;
> -
> -	if (old_freq == new_freq)
> -		return 0;
> -
> -	/* Change the frequency according to new OPP level */
> -	mutex_lock(&bus->lock);
> -
> -	ret = clk_set_rate(bus->clk, new_freq);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to set the clock of bus\n");
> -		goto out;
> +	if (bus->opp_table) {
> +		dev_pm_opp_put_regulators(bus->opp_table);
> +		bus->opp_table = NULL;
>  	}
> -
> -	*freq = new_freq;
> -	bus->curr_freq = new_freq;
> -
> -	dev_dbg(dev, "Set the frequency of bus (%luHz -> %luHz, %luHz)\n",
> -			old_freq, new_freq, clk_get_rate(bus->clk));
> -out:
> -	mutex_unlock(&bus->lock);
> -
> -	return ret;
>  }
>  
>  static void exynos_bus_passive_exit(struct device *dev)
> @@ -258,21 +179,19 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>  					struct exynos_bus *bus)
>  {
>  	struct device *dev = bus->dev;
> +	struct opp_table *opp_table;
> +	const char *vdd = "vdd";
>  	int i, ret, count, size;
>  
> -	/* Get the regulator to provide each bus with the power */
> -	bus->regulator = devm_regulator_get(dev, "vdd");
> -	if (IS_ERR(bus->regulator)) {
> -		dev_err(dev, "failed to get VDD regulator\n");
> -		return PTR_ERR(bus->regulator);
> -	}
> -
> -	ret = regulator_enable(bus->regulator);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to enable VDD regulator\n");
> +	opp_table = dev_pm_opp_set_regulators(dev, &vdd, 1);
> +	if (IS_ERR(opp_table)) {
> +		ret = PTR_ERR(opp_table);
> +		dev_err(dev, "failed to set regulators %d\n", ret);
>  		return ret;
>  	}
>  
> +	bus->opp_table = opp_table;
> +
>  	/*
>  	 * Get the devfreq-event devices to get the current utilization of
>  	 * buses. This raw data will be used in devfreq ondemand governor.
> @@ -313,14 +232,11 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>  	if (of_property_read_u32(np, "exynos,saturation-ratio", &bus->ratio))
>  		bus->ratio = DEFAULT_SATURATION_RATIO;
>  
> -	if (of_property_read_u32(np, "exynos,voltage-tolerance",
> -					&bus->voltage_tolerance))
> -		bus->voltage_tolerance = DEFAULT_VOLTAGE_TOLERANCE;
> -
>  	return 0;
>  
>  err_regulator:
> -	regulator_disable(bus->regulator);
> +	dev_pm_opp_put_regulators(bus->opp_table);
> +	bus->opp_table = NULL;
>  
>  	return ret;
>  }
> @@ -471,7 +387,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  	goto out;
>  passive:
>  	/* Initialize the struct profile and governor data for passive device */
> -	profile->target = exynos_bus_passive_target;
> +	profile->target = exynos_bus_target;
>  	profile->exit = exynos_bus_passive_exit;
>  
>  	/* Get the instance of parent devfreq device */
> @@ -511,8 +427,10 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  	dev_pm_opp_of_remove_table(dev);
>  	clk_disable_unprepare(bus->clk);
>  err_reg:
> -	if (!passive)
> -		regulator_disable(bus->regulator);
> +	if (!passive) {
> +		dev_pm_opp_put_regulators(bus->opp_table);
> +		bus->opp_table = NULL;
> +	}
>  
>  	return ret;
>  }
> 

It looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
