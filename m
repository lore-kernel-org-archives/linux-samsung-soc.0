From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 5/6] spi: s3c64xx: Remove the 'set_level' callback from controller data
Date: Sat, 19 May 2012 23:07:07 -0600
Message-ID: <20120520050707.A3B8C3E03B8@localhost>
References: <1337333613-6216-1-git-send-email-thomas.abraham@linaro.org> <1337333613-6216-6-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41729 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab2ETFHJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 May 2012 01:07:09 -0400
Received: by pbbrp8 with SMTP id rp8so5570583pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 22:07:09 -0700 (PDT)
In-Reply-To: <1337333613-6216-6-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, kgene.kim@samsung.com, jaswinder.singh@linaro.org, broonie@opensource.wolfsonmicro.com

On Fri, 18 May 2012 15:03:32 +0530, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> The set_level callback in the controller data, which is used to configure
> the slave select line, cannot be supported when migrating the driver to
> device tree based discovery. Since all the platforms currently use gpio
> as the slave select line, this callback can be removed from the
> controller data and replaced with call to gpio_set_value in the driver.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 --
>  drivers/spi/spi-s3c64xx.c                        |    8 ++++----
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> index a733ce9..48a6495 100644
> --- a/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> +++ b/arch/arm/plat-samsung/include/plat/s3c64xx-spi.h
> @@ -18,7 +18,6 @@ struct platform_device;
>   * @fb_delay: Slave specific feedback delay.
>   *            Refer to FB_CLK_SEL register definition in SPI chapter.
>   * @line: Custom 'identity' of the CS line.
> - * @set_level: CS line control.
>   *
>   * This is per SPI-Slave Chipselect information.
>   * Allocate and initialize one in machine init code and make the
> @@ -27,7 +26,6 @@ struct platform_device;
>  struct s3c64xx_spi_csinfo {
>  	u8 fb_delay;
>  	unsigned line;
> -	void (*set_level)(unsigned line_id, int lvl);
>  };
>  
>  /**
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index f6bc0e3..d84ce7f 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -406,14 +406,14 @@ static inline void enable_cs(struct s3c64xx_spi_driver_data *sdd,
>  		if (sdd->tgl_spi != spi) { /* if last mssg on diff device */
>  			/* Deselect the last toggled device */
>  			cs = sdd->tgl_spi->controller_data;
> -			cs->set_level(cs->line,
> -					spi->mode & SPI_CS_HIGH ? 0 : 1);
> +			gpio_set_value(cs->line,
> +				spi->mode & SPI_CS_HIGH ? 0 : 1);
>  		}
>  		sdd->tgl_spi = NULL;
>  	}
>  
>  	cs = spi->controller_data;
> -	cs->set_level(cs->line, spi->mode & SPI_CS_HIGH ? 1 : 0);
> +	gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 1 : 0);
>  }
>  
>  static int wait_for_xfer(struct s3c64xx_spi_driver_data *sdd,
> @@ -499,7 +499,7 @@ static inline void disable_cs(struct s3c64xx_spi_driver_data *sdd,
>  	if (sdd->tgl_spi == spi)
>  		sdd->tgl_spi = NULL;
>  
> -	cs->set_level(cs->line, spi->mode & SPI_CS_HIGH ? 0 : 1);
> +	gpio_set_value(cs->line, spi->mode & SPI_CS_HIGH ? 0 : 1);
>  }
>  
>  static void s3c64xx_spi_config(struct s3c64xx_spi_driver_data *sdd)
> -- 
> 1.6.6.rc2
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
