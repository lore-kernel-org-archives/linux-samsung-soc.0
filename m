From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] spi: s3c64xx: Fix pm_runtime_get_sync() return value check
Date: Mon, 10 Jun 2013 18:10:46 +0200
Message-ID: <51B5FA86.5090705@samsung.com>
References: <1369666560-12436-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1369666560-12436-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@opensource.wolfsonmicro.com
Cc: grant.likely@linaro.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 05/27/2013 04:56 PM, Sylwester Nawrocki wrote:
> If the device is already in a runtime PM enabled state
> pm_runtime_get_sync() will return 1, so a test for negative
> value should be used to check for errors.
> 
> Without this patch there are seen errors like:
> 
> [    8.540000] s3c64xx-spi 13930000.spi: Failed to enable device: 1
> [    8.545000] spi_master spi1: failed to prepare transfer hardware
> 
> Likely because the driver uses synchronous API to runtime enable
> the device and asychronous one to disable it.

Is there anything wrong with this patch ? I still can't see it in
Linus' tree.

> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 5000586..71cc3e6 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -444,7 +444,7 @@ static int s3c64xx_spi_prepare_transfer(struct spi_master *spi)
>  	}
>  
>  	ret = pm_runtime_get_sync(&sdd->pdev->dev);
> -	if (ret != 0) {
> +	if (ret < 0) {
>  		dev_err(dev, "Failed to enable device: %d\n", ret);
>  		goto out_tx;
>  	}
> 

Thanks,
Sylwester
