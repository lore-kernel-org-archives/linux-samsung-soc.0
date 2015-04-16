From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] i2c: s3c2410: Don't enable PM runtime on the adapter device
Date: Thu, 16 Apr 2015 12:33:08 +0200
Message-ID: <552F8FE4.7040905@samsung.com>
References: <1429179025-5352-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32109 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756939AbbDPKdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Apr 2015 06:33:23 -0400
In-reply-to: <1429179025-5352-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: wsa@the-dreams.de, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, lars@metafoo.de

On 16/04/15 12:10, Charles Keepax wrote:
> Commit 523c5b89640e ("i2c: Remove support for legacy PM") removed the PM
> ops from the bus type, which causes the pm operations on the s3c2410
> adapter device to fail (-ENOSUPP in rpm_callback). The adapter device
> doesn't get bound to a driver and as such can't have its own pm_runtime
> callbacks. Previously this was fine as the bus callbacks would have been
> used, but now this can cause devices which use PM runtime and are
> attached over I2C to fail to resume.
> 
> This commit fixes this issue by just doing the PM operations directly on
> the I2C device, rather than the adapter device in the driver and adding
> some stub callbacks for runtime suspend and resume.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |   21 ++++++++++++++++-----
>  1 files changed, 16 insertions(+), 5 deletions(-)

> @@ -1253,7 +1253,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, i2c);
>  

Wouldn't adding

	pm_runtime_no_callbacks(&pdev->dev);

here let us avoid the runtime resume/suspend stubs?

>  	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_enable(&i2c->adap.dev);
>  
>  	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
>  	return 0;
> @@ -1270,7 +1269,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>  
>  	clk_unprepare(i2c->clk);
>  
> -	pm_runtime_disable(&i2c->adap.dev);
>  	pm_runtime_disable(&pdev->dev);
>  
>  	s3c24xx_i2c_deregister_cpufreq(i2c);
> @@ -1318,6 +1316,16 @@ static int s3c24xx_i2c_resume_noirq(struct device *dev)
>  #endif
>  
>  #ifdef CONFIG_PM
> +static int s3c24xx_runtime_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int s3c24xx_runtime_suspend(struct device *dev)
> +{
> +	return 0;
> +}

--
Thanks,
Sylwester
