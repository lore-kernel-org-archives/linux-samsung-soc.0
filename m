From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 1/6] spi: s3c64xx: remove unused S3C64XX_SPI_ST_TRLCNTZ macro
Date: Sat, 19 May 2012 23:03:08 -0600
Message-ID: <20120520050309.224ED3E03B8@localhost>
References: <1337333613-6216-1-git-send-email-thomas.abraham@linaro.org> <1337333613-6216-2-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33942 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985Ab2ETFDL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 May 2012 01:03:11 -0400
Received: by pbbrp8 with SMTP id rp8so5568540pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 22:03:11 -0700 (PDT)
In-Reply-To: <1337333613-6216-2-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, spi-devel-general@lists.sourceforge.net, devicetree-discuss@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rob.herring@calxeda.com, kgene.kim@samsung.com, jaswinder.singh@linaro.org, broonie@opensource.wolfsonmicro.com

On Fri, 18 May 2012 15:03:28 +0530, Thomas Abraham <thomas.abraham@linaro.org> wrote:
> The macro S3C64XX_SPI_ST_TRLCNTZ is not used and hence it is removed.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Acked-by: Jaswinder Singh <jaswinder.singh@linaro.org>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  drivers/spi/spi-s3c64xx.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 972a94c..6a3d51a 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -113,10 +113,6 @@
>  
>  #define S3C64XX_SPI_FBCLK_MSK		(3<<0)
>  
> -#define S3C64XX_SPI_ST_TRLCNTZ(v, i) ((((v) >> (i)->rx_lvl_offset) & \
> -					(((i)->fifo_lvl_mask + 1))) \
> -					? 1 : 0)
> -
>  #define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & (1 << (i)->tx_st_done)) ? 1 : 0)
>  #define TX_FIFO_LVL(v, i) (((v) >> 6) & (i)->fifo_lvl_mask)
>  #define RX_FIFO_LVL(v, i) (((v) >> (i)->rx_lvl_offset) & (i)->fifo_lvl_mask)
> -- 
> 1.6.6.rc2
> 

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies, Ltd.
