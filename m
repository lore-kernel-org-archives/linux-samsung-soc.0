From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/7] SPI: S3C64XX: Use bus clocks created using clkdev
Date: Fri, 23 Sep 2011 17:12:33 -0600
Message-ID: <20110923231233.GE24631@ponder.secretlab.ca>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
 <1316778827-24694-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:61513 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752730Ab1IWXMh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Sep 2011 19:12:37 -0400
Received: by yxl31 with SMTP id 31so3036750yxl.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Sep 2011 16:12:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1316778827-24694-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, ben-linux@fluff.org, kgene.kim@samsung.com, s.nawrocki@samsung.com

On Fri, Sep 23, 2011 at 05:23:41PM +0530, Padmavathi Venna wrote:
> This patch modifies the driver to stop depending on the
> clock names being passed from platform and switch over
> to lookup clocks generic names using clkdev
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>

Looks okay to me.

Acked-by: Grant Likely <grant.likely@secretlab.ca>

This series I imagine should go in via the arm-soc tree.

g.

> ---
>  drivers/spi/spi-s3c64xx.c |   14 +++++---------
>  1 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 019a716..dcf7e10 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -971,6 +971,7 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
>  	struct s3c64xx_spi_info *sci;
>  	struct spi_master *master;
>  	int ret;
> +	char clk_name[16];
>  
>  	if (pdev->id < 0) {
>  		dev_err(&pdev->dev,
> @@ -984,11 +985,6 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
>  	}
>  
>  	sci = pdev->dev.platform_data;
> -	if (!sci->src_clk_name) {
> -		dev_err(&pdev->dev,
> -			"Board init must call s3c64xx_spi_set_info()\n");
> -		return -EINVAL;
> -	}
>  
>  	/* Check for availability of necessary resource */
>  
> @@ -1073,17 +1069,17 @@ static int __init s3c64xx_spi_probe(struct platform_device *pdev)
>  		goto err4;
>  	}
>  
> -	sdd->src_clk = clk_get(&pdev->dev, sci->src_clk_name);
> +	sprintf(clk_name, "spi_busclk%d", sci->src_clk_nr);
> +	sdd->src_clk = clk_get(&pdev->dev, clk_name);
>  	if (IS_ERR(sdd->src_clk)) {
>  		dev_err(&pdev->dev,
> -			"Unable to acquire clock '%s'\n", sci->src_clk_name);
> +			"Unable to acquire clock '%s'\n", clk_name);
>  		ret = PTR_ERR(sdd->src_clk);
>  		goto err5;
>  	}
>  
>  	if (clk_enable(sdd->src_clk)) {
> -		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n",
> -							sci->src_clk_name);
> +		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n", clk_name);
>  		ret = -EBUSY;
>  		goto err6;
>  	}
> -- 
> 1.7.4.4
> 
