From: Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] i2c-s3c2410: Add stub runtime power management
Date: Sat, 21 Jan 2012 22:25:20 +0100
Message-ID: <4F1B2D40.70202@gmail.com>
References: <1327171600-5489-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327171600-5489-1-git-send-email-broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 01/21/2012 07:46 PM, Mark Brown wrote:
> Add stub runtime_pm calls which go through the flow of enabling and
> disabling but don't actually do anything with the device itself as
> there's nothing useful we can do. This provides the core PM framework
> with information about when the device is idle, enabling chip wide
> power savings.

Sorry, unless I'm missing something, currently there is no clock or
power domain drivers for the I2C controllers in any SoC versions this
driver is used with. So it seems like this patch introduces just 
an overhead of pm_runtime calls, in addition to clk_enable/disable. 

I can't see what the PM core would use the information about device's
power state for. Is there really anything else, regarding I2C controllers
power management, than can be done except individual devices' clock 
gating ?

> Signed-off-by: Mark Brown<broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
> Acked-by: Heiko Stuebner<heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> ---
>   drivers/i2c/busses/i2c-s3c2410.c |    8 ++++++++
>   1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index e6f982b..3d80bab 100644
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
> 
>   	for (retry = 0; retry<  adap->retries; retry++) {
> @@ -572,6 +574,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
> 
>   		if (ret != -EAGAIN) {
>   			clk_disable(i2c->clk);
> +			pm_runtime_put(&adap->dev);
>   			return ret;
>   		}
> 
> @@ -581,6 +584,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>   	}
> 
>   	clk_disable(i2c->clk);
> +	pm_runtime_put(&adap->dev);
>   	return -EREMOTEIO;
>   }
> 
> @@ -1013,6 +1017,8 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>   	of_i2c_register_devices(&i2c->adap);
>   	platform_set_drvdata(pdev, i2c);
> 
> +	pm_runtime_enable(&pdev->dev);
> +
>   	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
>   	clk_disable(i2c->clk);
>   	return 0;
> @@ -1047,6 +1053,8 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>   {
>   	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
> 
> +	pm_runtime_disable(&pdev->dev);
> +
>   	s3c24xx_i2c_deregister_cpufreq(i2c);
> 
>   	i2c_del_adapter(&i2c->adap);
