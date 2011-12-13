From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] i2c-s3c2410: Add stub runtime power management
Date: Tue, 13 Dec 2011 15:53:48 +0100
Message-ID: <201112131553.49270.heiko@sntech.de>
References: <1323093966-9045-1-git-send-email-broonie@opensource.wolfsonmicro.com> <1323093966-9045-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:33140 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754869Ab1LMOx5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Dec 2011 09:53:57 -0500
In-Reply-To: <1323093966-9045-2-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Jean Delvare <khali@linux-fr.org>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, patches@opensource.wolfsonmicro.com

Am Montag, 5. Dezember 2011, 15:06:06 schrieb Mark Brown:
> Add stub runtime_pm calls which go through the flow of enabling and
> disabling but don't actually do anything with the device itself as
> there's nothing useful we can do. This provides the core PM framework
> with information about when the device is idle, enabling chip wide
> power savings.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>

Kgene, Jean, Ben: could we move this forward please?

Thanks
Heiko

> ---
>  drivers/i2c/busses/i2c-s3c2410.c |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c
> b/drivers/i2c/busses/i2c-s3c2410.c index ed62a7f..065c316 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -31,6 +31,7 @@
>  #include <linux/errno.h>
>  #include <linux/err.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/clk.h>
>  #include <linux/cpufreq.h>
>  #include <linux/slab.h>
> @@ -563,6 +564,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>  	int retry;
>  	int ret;
> 
> +	pm_runtime_get_sync(&adap->dev);
>  	clk_enable(i2c->clk);
> 
>  	for (retry = 0; retry < adap->retries; retry++) {
> @@ -571,6 +573,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
> 
>  		if (ret != -EAGAIN) {
>  			clk_disable(i2c->clk);
> +			pm_runtime_put_sync(&adap->dev);
>  			return ret;
>  		}
> 
> @@ -580,6 +583,7 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>  	}
> 
>  	clk_disable(i2c->clk);
> +	pm_runtime_put_sync(&adap->dev);
>  	return -EREMOTEIO;
>  }
> 
> @@ -1012,6 +1016,9 @@ static int s3c24xx_i2c_probe(struct platform_device
> *pdev) of_i2c_register_devices(&i2c->adap);
>  	platform_set_drvdata(pdev, i2c);
> 
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_enable(&i2c->adap.dev);
> +
>  	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
>  	clk_disable(i2c->clk);
>  	return 0;
> @@ -1046,6 +1053,9 @@ static int s3c24xx_i2c_remove(struct platform_device
> *pdev) {
>  	struct s3c24xx_i2c *i2c = platform_get_drvdata(pdev);
> 
> +	pm_runtime_disable(&i2c->adap.dev);
> +	pm_runtime_disable(&pdev->dev);
> +
>  	s3c24xx_i2c_deregister_cpufreq(i2c);
> 
>  	i2c_del_adapter(&i2c->adap);
