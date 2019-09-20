From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [RFC PATCH v2 04/11] devfreq: exynos-bus: Clean up code
Date: Fri, 20 Sep 2019 11:22:06 +0900
Message-ID: <39db18c5-534d-ff72-0a7f-7a838c13fa7a@samsung.com>
References: <20190919142236.4071-1-a.swigon@samsung.com>
        <CGME20190919142324eucas1p1638cec2aafbfcaf03cfdfa7d0189143a@eucas1p1.samsung.com>
        <20190919142236.4071-5-a.swigon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190919142236.4071-5-a.swigon@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>, myungjoo.ham@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, georgi.djakov@linaro.org, leonard.crestez@nxp.com, m.szyprowski@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Artur,

On 19. 9. 19. 오후 11:22, Artur Świgoń wrote:
> From: Artur Świgoń <a.swigon@partner.samsung.com>
> 
> This patch adds minor improvements to the exynos-bus driver.
> 
> Signed-off-by: Artur Świgoń <a.swigon@partner.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/devfreq/exynos-bus.c | 66 ++++++++++++++----------------------
>  1 file changed, 25 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
> index 60ad4319fd80..8d44810cac69 100644
> --- a/drivers/devfreq/exynos-bus.c
> +++ b/drivers/devfreq/exynos-bus.c
> @@ -15,11 +15,10 @@
>  #include <linux/device.h>
>  #include <linux/export.h>
>  #include <linux/module.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/pm_opp.h>
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
> -#include <linux/slab.h>
>  
>  #define DEFAULT_SATURATION_RATIO	40
>  
> @@ -178,7 +177,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>  	struct device *dev = bus->dev;
>  	struct opp_table *opp_table;
>  	const char *vdd = "vdd";
> -	int i, ret, count, size;
> +	int i, ret, count;
>  
>  	opp_table = dev_pm_opp_set_regulators(dev, &vdd, 1);
>  	if (IS_ERR(opp_table)) {
> @@ -201,8 +200,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
>  	}
>  	bus->edev_count = count;
>  
> -	size = sizeof(*bus->edev) * count;
> -	bus->edev = devm_kzalloc(dev, size, GFP_KERNEL);
> +	bus->edev = devm_kcalloc(dev, count, sizeof(*bus->edev), GFP_KERNEL);
>  	if (!bus->edev) {
>  		ret = -ENOMEM;
>  		goto err_regulator;
> @@ -301,10 +299,9 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
>  	profile->exit = exynos_bus_exit;
>  
>  	ondemand_data = devm_kzalloc(dev, sizeof(*ondemand_data), GFP_KERNEL);
> -	if (!ondemand_data) {
> -		ret = -ENOMEM;
> -		goto err;
> -	}
> +	if (!ondemand_data)
> +		return -ENOMEM;
> +
>  	ondemand_data->upthreshold = 40;
>  	ondemand_data->downdifferential = 5;
>  
> @@ -314,8 +311,7 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
>  						ondemand_data);
>  	if (IS_ERR(bus->devfreq)) {
>  		dev_err(dev, "failed to add devfreq device\n");
> -		ret = PTR_ERR(bus->devfreq);
> -		goto err;
> +		return PTR_ERR(bus->devfreq);
>  	}
>  
>  	/*
> @@ -325,16 +321,13 @@ static int exynos_bus_profile_init(struct exynos_bus *bus,
>  	ret = exynos_bus_enable_edev(bus);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to enable devfreq-event devices\n");
> -		goto err;
> +		return ret;
>  	}
>  
>  	ret = exynos_bus_set_event(bus);
> -	if (ret < 0) {
> +	if (ret < 0)
>  		dev_err(dev, "failed to set event to devfreq-event devices\n");
> -		goto err;

Instead of removing 'goto err', just return err as I commented[1] on v1.
[1] https://lkml.org/lkml/2019/7/26/331

> -	}
>  
> -err:
>  	return ret;

And you just keep 'return ret' or you can change it as 'return 0'.


>  }
>  
> @@ -344,7 +337,6 @@ static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
>  	struct device *dev = bus->dev;
>  	struct devfreq_passive_data *passive_data;
>  	struct devfreq *parent_devfreq;
> -	int ret = 0;
>  
>  	/* Initialize the struct profile and governor data for passive device */
>  	profile->target = exynos_bus_target;
> @@ -352,30 +344,26 @@ static int exynos_bus_profile_init_passive(struct exynos_bus *bus,
>  
>  	/* Get the instance of parent devfreq device */
>  	parent_devfreq = devfreq_get_devfreq_by_phandle(dev, 0);
> -	if (IS_ERR(parent_devfreq)) {
> -		ret = -EPROBE_DEFER;
> -		goto err;
> -	}
> +	if (IS_ERR(parent_devfreq))
> +		return -EPROBE_DEFER;
>  
>  	passive_data = devm_kzalloc(dev, sizeof(*passive_data), GFP_KERNEL);
> -	if (!passive_data) {
> -		ret = -ENOMEM;
> -		goto err;
> -	}
> +	if (!passive_data)
> +		return -ENOMEM;
> +
>  	passive_data->parent = parent_devfreq;
>  
>  	/* Add devfreq device for exynos bus with passive governor */
> -	bus->devfreq = devm_devfreq_add_device(dev, profile, DEVFREQ_GOV_PASSIVE,
> +	bus->devfreq = devm_devfreq_add_device(dev, profile,
> +						DEVFREQ_GOV_PASSIVE,
>  						passive_data);
>  	if (IS_ERR(bus->devfreq)) {
>  		dev_err(dev,
>  			"failed to add devfreq dev with passive governor\n");
> -		ret = PTR_ERR(bus->devfreq);
> -		goto err;
> +		return PTR_ERR(bus->devfreq);
>  	}
>  
> -err:
> -	return ret;
> +	return 0;
>  }
>  
>  static int exynos_bus_probe(struct platform_device *pdev)
> @@ -393,18 +381,18 @@ static int exynos_bus_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
> +	bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
>  	if (!bus)
>  		return -ENOMEM;
>  	mutex_init(&bus->lock);
> -	bus->dev = &pdev->dev;
> +	bus->dev = dev;
>  	platform_set_drvdata(pdev, bus);
>  
>  	profile = devm_kzalloc(dev, sizeof(*profile), GFP_KERNEL);
>  	if (!profile)
>  		return -ENOMEM;
>  
> -	node = of_parse_phandle(dev->of_node, "devfreq", 0);
> +	node = of_parse_phandle(np, "devfreq", 0);
>  	if (node) {
>  		of_node_put(node);
>  		passive = true;
> @@ -461,12 +449,10 @@ static int exynos_bus_resume(struct device *dev)
>  	int ret;
>  
>  	ret = exynos_bus_enable_edev(bus);
> -	if (ret < 0) {
> +	if (ret < 0)
>  		dev_err(dev, "failed to enable the devfreq-event devices\n");
> -		return ret;

Keep the 'return ret' if error happen as I commented[1] on v1.
[1] https://lkml.org/lkml/2019/7/26/331

> -	}
>  
> -	return 0;
> +	return ret;

And you just keep 'return 0' or you can change it as 'return ret'.

>  }
>  
>  static int exynos_bus_suspend(struct device *dev)
> @@ -475,12 +461,10 @@ static int exynos_bus_suspend(struct device *dev)
>  	int ret;
>  
>  	ret = exynos_bus_disable_edev(bus);
> -	if (ret < 0) {
> +	if (ret < 0)
>  		dev_err(dev, "failed to disable the devfreq-event devices\n");
> -		return ret;

Keep the 'return ret' if error happen as I commented[1] on v1.
[1] https://lkml.org/lkml/2019/7/26/331

> -	}
>  
> -	return 0;
> +	return ret;

And you just keep 'return 0' or you can change it as 'return ret'.

>  }
>  #endif
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
