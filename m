From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 16:52:58 +0100
Message-ID: <4F1ADF5A.6000806@gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com> <1327152527-11364-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:60947 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752234Ab2AUPxD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 10:53:03 -0500
In-Reply-To: <1327152527-11364-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-i2c@vger.kernel.org
Cc: Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 01/21/2012 02:28 PM, Mark Brown wrote:
> Add stub runtime_pm calls which go through the flow of enabling and
> disabling but don't actually do anything with the device itself as
> there's nothing useful we can do. This provides the core PM framework
> with information about when the device is idle, enabling chip wide
> power savings.
> 
> Signed-off-by: Mark Brown<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> Acked-by: Heiko Stuebner<heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>   drivers/i2c/busses/i2c-s3c2410.c |   10 ++++++++++
>   1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index e6f982b..737f721 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -31,6 +31,7 @@
>   #include<linux/errno.h>
>   #include<linux/err.h>
>   #include<linux/platform_device.h>
> +#include<linux/pm_runtime.h>
>   #include<linux/clk.h>
>   #include<linux/cpufreq.h>
>   #include<linux/slab.h>
> @@ -564,6 +565,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>   	int retry;
>   	int ret;
> 
> +	pm_runtime_get_sync(&adap->dev);
>   	clk_enable(i2c->clk);

It looks a bit strange to have pm_runtime* and manual clock control side
by side. How about implementing proper runtime_suspend/resume calls and
moving clk_enable/disable to these handlers ?

It might also make sense to check return value of pm_runtime_get_sync().
 
>   	for (retry = 0; retry<  adap->retries; retry++) {
> @@ -572,6 +574,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
> 
>   		if (ret != -EAGAIN) {
>   			clk_disable(i2c->clk);
> +			pm_runtime_put_sync(&adap->dev);

I would go for just pm_runtime_put() here...
	
>   			return ret;
>   		}
> 
> @@ -581,6 +584,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>   	}
> 
>   	clk_disable(i2c->clk);
> +	pm_runtime_put_sync(&adap->dev);

.. and here as well.

>   	return -EREMOTEIO;
>   }
> 
> @@ -1013,6 +1017,9 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>   	of_i2c_register_devices(&i2c->adap);
>   	platform_set_drvdata(pdev, i2c);
> 
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_enable(&i2c->adap.dev);

Why do we need pm_runtime_enable() on i2c->adap.dev ?
AFAIK enabling runtime PM on the platform device only should do.

> +
>   	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
>   	clk_disable(i2c->clk);
>   	return 0;
> @@ -1047,6 +1054,9 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>   {
>   	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
> 
> +	pm_runtime_disable(&i2c->adap.dev);
> +	pm_runtime_disable(&pdev->dev);

Ditto.

> +
>   	s3c24xx_i2c_deregister_cpufreq(i2c);
> 
>   	i2c_del_adapter(&i2c->adap);

--

Thanks,
Sylwester
