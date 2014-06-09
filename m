From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/5] regulator: Add driver for Maxim 77802 PMIC regulators
Date: Tue, 10 Jun 2014 01:29:17 +0200
Message-ID: <5396434D.3020402@collabora.co.uk>
References: <1402306670-17041-1-git-send-email-javier.martinez@collabora.co.uk> <1402306670-17041-3-git-send-email-javier.martinez@collabora.co.uk> <20140609193849.GE5099@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:50228 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932349AbaFIX30 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Jun 2014 19:29:26 -0400
In-Reply-To: <20140609193849.GE5099@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Mike Turquette <mturquette@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Daniel Stone <daniels@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Mark,

Thanks a lot for your feedback.

On 06/09/2014 09:38 PM, Mark Brown wrote:
> On Mon, Jun 09, 2014 at 11:37:47AM +0200, Javier Martinez Canillas wrote:
> 
>> +	case REGULATOR_MODE_STANDBY:			/* switch off */
>> +		if (id != MAX77802_LDO1 && id != MAX77802_LDO20 &&
>> +			id != MAX77802_LDO21 && id != MAX77802_LDO3) {
>> +			val = MAX77802_OPMODE_STANDBY;
>> +			break;
>> +		}
>> +		/* no break */
> 
> This sounds very broken...
>

The problem is that not all regulators supports the same operational modes. For
instance regulators LDO 1, 20, 21 and 3 does not support REGULATOR_MODE_STANDBY
so if the condition is not met a break is not needed since the default case is
to warn that the mode is not supported.

But I'll rework that logic on v2 to make it cleaner and have a break on each
case and don't rely on case cascading.

>> +		/* OK if some GPIOs aren't defined */
>> +		if (!gpio_is_valid(gpio))
>> +			continue;
>> +
>> +		/* If a GPIO is valid, we'd better be able to claim it */
>> +		ret = devm_gpio_request_one(dev, gpio, GPIOF_OUT_INIT_HIGH,
>> +					    "max77802 selb");
>> +		if (ret) {
>> +			dev_err(dev, "can't claim gpio[%d]: %d\n", i, ret);
>> +			return ret;
>> +		}
> 
> Can this use the GPIO descriptor API?
> 

Ok, I'll use gpiod_request() on v2.

>> +static void max77802_copy_reg(struct device *dev, struct regmap *regmap,
>> +			      int from_reg, int to_reg)
>> +{
>> +	int val;
>> +	int ret;
>> +
>> +	if (from_reg == to_reg)
>> +		return;
>> +
>> +	ret = regmap_read(regmap, from_reg, &val);
>> +	if (!ret)
>> +		ret = regmap_write(regmap, to_reg, val);
>> +
>> +	if (ret)
>> +		dev_warn(dev, "Copy err %d => %d (%d)\n",
>> +			 from_reg, to_reg, ret);
>> +}
> 
> This doesn't look at all device specific, better implement it in generic
> code.
> 

Ok, will do.

>> +	if (pdata->num_regulators != MAX77802_MAX_REGULATORS) {
>> +		dev_err(&pdev->dev,
>> +			"Invalid initial data for regulator's initialiation: " \
>> +			"expected %d, pdata/dt provided %d\n",
>> +			MAX77802_MAX_REGULATORS,
>> +			pdata->num_regulators);
>> +		return -EINVAL;
>> +	}
> 
> Don't split log messages over multiple lines so people can find the log
> message in the kernel source with grep, though in any case checking for
> this is a bug - the driver should always be at least able to read the
> current state from the hardware.
> 

Ok.

>> +static int __init max77802_pmic_init(void)
>> +{
>> +	return platform_driver_register(&max77802_pmic_driver);
>> +}
>> +subsys_initcall(max77802_pmic_init);
> 
> module_platform_driver().
> 

Ok.

Best regards,
Javier
