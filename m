From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 2/3] spi: s3c64xx: validate s3c64xx_spi_csinfo before using
Date: Tue, 15 Jul 2014 19:49:28 +0200
Message-ID: <53C569A8.1000103@samsung.com>
References: <1405426860-18404-1-git-send-email-ch.naveen@samsung.com>
 <1405426860-18404-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8592 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752298AbaGORuN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 13:50:13 -0400
In-reply-to: <1405426860-18404-3-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>

Hi Naveen,

Please see my comments inline.

On 15.07.2014 14:20, Naveen Krishna Chatradhi wrote:
> This patch validates the cs->line (Chip select gpio) and
> struct s3c64xx_spi_csinfo *cs object for both DT and NON-DT
> platforms before using in .setup().
> 
> Also, check gpio_is_valid(spi->cs_gpio) in cleanup() before
> freeing up.

Missing reason of the change.

> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
>  drivers/spi/spi-s3c64xx.c |   15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 72bfba6..8971076 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -773,12 +773,6 @@ static struct s3c64xx_spi_csinfo *s3c64xx_get_slave_ctrldata(
>  	/* The CS line is asserted/deasserted by the gpio pin */
>  	cs->line = spi->cs_gpio;
>  
> -	if (!gpio_is_valid(cs->line)) {
> -		dev_err(&spi->dev, "chip select gpio is not specified or invalid\n");
> -		kfree(cs);
> -		return ERR_PTR(-EINVAL);
> -	}
> -
>  	data_np = of_get_child_by_name(slave_np, "controller-data");
>  	if (!data_np) {
>  		dev_err(&spi->dev, "child node 'controller-data' not found\n");
> @@ -805,15 +799,14 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>  	int err;
>  
>  	sdd = spi_master_get_devdata(spi->master);
> -	if (!cs && spi->dev.of_node) {
> +	if (spi->dev.of_node)

This check is equivalent, i.e. cs will always be NULL whenever
spi->dev.of_node is not.

>  		cs = s3c64xx_get_slave_ctrldata(spi);
> -		spi->controller_data = cs;
> -	}
>  
> -	if (IS_ERR_OR_NULL(cs)) {
> +	if (IS_ERR_OR_NULL(cs) || !gpio_is_valid(cs->line)) {

I'm not sure this is correct. It will error out even if hardware chip
select is used.

Otherwise you need to free cs here if wrong GPIO was the cause of
entering this block, so if this extra check is to stay, I'd suggest
splitting this into two separate if blocks.

>  		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
>  		return -ENODEV;
>  	}
> +	spi->controller_data = cs;

I'm not sure what's the point of moving this assignment here.

>  
>  	if (!spi_get_ctldata(spi)) {
>  		/* Request gpio only if cs line is asserted by gpio pins */
> @@ -898,7 +891,7 @@ static void s3c64xx_spi_cleanup(struct spi_device *spi)
>  	struct s3c64xx_spi_driver_data *sdd;
>  
>  	sdd = spi_master_get_devdata(spi->master);
> -	if (spi->cs_gpio) {
> +	if (gpio_is_valid(spi->cs_gpio)) {
>  		gpio_free(spi->cs_gpio);
>  		if (spi->dev.of_node)
>  			kfree(cs);

I believe this is completely wrong. cs is allocated even if GPIO chip
select is not used, so the only thing that should be done conditionally
is gpio_free().

In general, I liked previous version of this series much more, as it was
doing what it should as opposed to this one.

Best regards,
Tomasz
