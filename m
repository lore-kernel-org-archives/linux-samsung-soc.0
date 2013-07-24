From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH] spi/s3c64xx: Remove unused message queue
Date: Wed, 24 Jul 2013 22:18:51 +0900
Message-ID: <0ef001ce8870$56ffea50$04ffbef0$@org>
References: <1373046993-1349-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27582 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751981Ab3GXNSx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:18:53 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQF0024BZN8TP00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 22:18:52 +0900 (KST)
In-reply-to: <1373046993-1349-1-git-send-email-broonie@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'Grant Likely' <grant.likely@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@linaro.org>

Mark Brown wrote:
> 
> From: Mark Brown <broonie@linaro.org>
> 
> Since the driver has been converted to use the core message pump code
> the only use of the messsage queue in the driver is a check to see if
> it is empty which will always succeed since nothing ever adds to the
> queue. Just remove the queue.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

- Kukjin

> ---
>  drivers/spi/spi-s3c64xx.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index eb53df2..def13e8 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -172,7 +172,6 @@ struct s3c64xx_spi_port_config {
>   * @master: Pointer to the SPI Protocol master.
>   * @cntrlr_info: Platform specific data for the controller this driver
> manages.
>   * @tgl_spi: Pointer to the last CS left untoggled by the cs_change hint.
> - * @queue: To log SPI xfer requests.
>   * @lock: Controller specific lock.
>   * @state: Set of FLAGS to indicate status.
>   * @rx_dmach: Controller's DMA channel for Rx.
> @@ -193,7 +192,6 @@ struct s3c64xx_spi_driver_data {
>  	struct spi_master               *master;
>  	struct s3c64xx_spi_info  *cntrlr_info;
>  	struct spi_device               *tgl_spi;
> -	struct list_head                queue;
>  	spinlock_t                      lock;
>  	unsigned long                   sfr_start;
>  	struct completion               xfer_completion;
> @@ -1053,8 +1051,6 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>  	struct s3c64xx_spi_csinfo *cs = spi->controller_data;
>  	struct s3c64xx_spi_driver_data *sdd;
>  	struct s3c64xx_spi_info *sci;
> -	struct spi_message *msg;
> -	unsigned long flags;
>  	int err;
> 
>  	sdd = spi_master_get_devdata(spi->master);
> @@ -1085,21 +1081,6 @@ static int s3c64xx_spi_setup(struct spi_device
*spi)
> 
>  	sci = sdd->cntrlr_info;
> 
> -	spin_lock_irqsave(&sdd->lock, flags);
> -
> -	list_for_each_entry(msg, &sdd->queue, queue) {
> -		/* Is some mssg is already queued for this device */
> -		if (msg->spi == spi) {
> -			dev_err(&spi->dev,
> -				"setup: attempt while mssg in queue!\n");
> -			spin_unlock_irqrestore(&sdd->lock, flags);
> -			err = -EBUSY;
> -			goto err_msgq;
> -		}
> -	}
> -
> -	spin_unlock_irqrestore(&sdd->lock, flags);
> -
>  	pm_runtime_get_sync(&sdd->pdev->dev);
> 
>  	/* Check if we can provide the requested rate */
> @@ -1146,7 +1127,6 @@ setup_exit:
>  	/* setup() returns with device de-selected */
>  	disable_cs(sdd, spi);
> 
> -err_msgq:
>  	gpio_free(cs->line);
>  	spi_set_ctldata(spi, NULL);
> 
> @@ -1439,7 +1419,6 @@ static int s3c64xx_spi_probe(struct platform_device
> *pdev)
> 
>  	spin_lock_init(&sdd->lock);
>  	init_completion(&sdd->xfer_completion);
> -	INIT_LIST_HEAD(&sdd->queue);
> 
>  	ret = devm_request_irq(&pdev->dev, irq, s3c64xx_spi_irq, 0,
>  				"spi-s3c64xx", sdd);
> --
> 1.8.3.2
