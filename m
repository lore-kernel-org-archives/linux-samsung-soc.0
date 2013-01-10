From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] spi/s3c64xx: Complain if we fail to set a transfer speed
Date: Wed, 09 Jan 2013 17:17:52 -0800
Message-ID: <00cf01cdeed0$51d193b0$f574bb10$@samsung.com>
References: <1357335189-17398-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18626 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932323Ab3AJBSH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 20:18:07 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGD00FUSY9SC8E0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 10:18:05 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGD002B1YA3UBB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Jan 2013 10:18:05 +0900 (KST)
In-reply-to: <1357335189-17398-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>
Cc: linux-samsung-soc@vger.kernel.org, spi-devel-general@lists.sourceforge.net

Mark Brown wrote:
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

> ---
>  drivers/spi/spi-s3c64xx.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c index
> ad93231..6495352 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -957,6 +957,8 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>  		if (spi->max_speed_hz >= speed) {
>  			spi->max_speed_hz = speed;
>  		} else {
> +			dev_err(&spi->dev, "Can't set %dHz transfer
> speed\n",
> +				spi->max_speed_hz);
>  			err = -EINVAL;
>  			goto setup_exit;
>  		}
> --
> 1.7.10.4
