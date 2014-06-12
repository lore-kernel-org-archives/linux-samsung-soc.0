From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH 2/3 v4] spi: s3c64xx: for DT platofrms always get the
 chipselect info from DT node
Date: Thu, 12 Jun 2014 16:06:52 +0200
Message-ID: <5399B3FC.5030605@collabora.co.uk>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com> <1402578821-27338-2-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:51988 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752823AbaFLOG7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 10:06:59 -0400
In-Reply-To: <1402578821-27338-2-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, kgene.kim@samsung.com, cpgs@samsung.com, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hello Naveen,

On 06/12/2014 03:13 PM, Naveen Krishna Chatradhi wrote:
> Use controller_data structure only for the Non Device tree  platforms.
> For Device tree platforms, always derive the chipselect info from
> DT node.
> 
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Tomasz Figa <t.figa@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c |   11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index b888c66..f27e15d 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -795,14 +795,15 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>  	int err;
>  
>  	sdd = spi_master_get_devdata(spi->master);
> -	if (!cs && spi->dev.of_node) {
> +	if (spi->dev.of_node) {
>  		cs = s3c64xx_get_slave_ctrldata(spi);
>  		spi->controller_data = cs;
> -	}
> -
> -	/* For the non-DT platforms derive chip selects from controller data */
> -	if (!spi->dev.of_node)
> +	} else {
> +		/* For the non-DT platforms derive chip
> +		 * selects from controller data
> +		 */
>  		spi->cs_gpio = cs->line;
> +	}
>  
>  	if (IS_ERR_OR_NULL(cs)) {
>  		dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
> 

Personally I wouldn't have this change as a separate patch since it's too
related to what you changed in Patch 1. But it's just a nitpick.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Best regards,
Javier
