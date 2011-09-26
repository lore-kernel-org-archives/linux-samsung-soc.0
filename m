From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] SPI: S3C64XX: Use bus clocks created using clkdev
Date: Tue, 27 Sep 2011 08:22:46 +0900
Message-ID: <003301cc7ca3$3314dae0$993e90a0$%kim@samsung.com>
References: <1316778827-24694-1-git-send-email-padma.v@samsung.com>
 <1316778827-24694-2-git-send-email-padma.v@samsung.com>
 <20110923231233.GE24631@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18352 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752327Ab1IZXWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 19:22:52 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS500J5YKWVEWB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 08:22:46 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS500EBHKXYW120@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Sep 2011 08:22:46 +0900 (KST)
In-reply-to: <20110923231233.GE24631@ponder.secretlab.ca>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Grant Likely' <grant.likely@secretlab.ca>, 'Padmavathi Venna' <padma.v@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, jassisinghbrar@gmail.com, ben-linux@fluff.org, s.nawrocki@samsung.com

Grant Likely wrote:
> 
> On Fri, Sep 23, 2011 at 05:23:41PM +0530, Padmavathi Venna wrote:
> > This patch modifies the driver to stop depending on the
> > clock names being passed from platform and switch over
> > to lookup clocks generic names using clkdev
> >
> > Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> 
> Looks okay to me.
> 
> Acked-by: Grant Likely <grant.likely@secretlab.ca>
> 
> This series I imagine should go in via the arm-soc tree.
> 
OK, if others ok to me, I will pick up this series so that it will be sent
to upstream via arm-soc.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> > ---
> >  drivers/spi/spi-s3c64xx.c |   14 +++++---------
> >  1 files changed, 5 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> > index 019a716..dcf7e10 100644
> > --- a/drivers/spi/spi-s3c64xx.c
> > +++ b/drivers/spi/spi-s3c64xx.c
> > @@ -971,6 +971,7 @@ static int __init s3c64xx_spi_probe(struct
> platform_device *pdev)
> >  	struct s3c64xx_spi_info *sci;
> >  	struct spi_master *master;
> >  	int ret;
> > +	char clk_name[16];
> >
> >  	if (pdev->id < 0) {
> >  		dev_err(&pdev->dev,
> > @@ -984,11 +985,6 @@ static int __init s3c64xx_spi_probe(struct
> platform_device *pdev)
> >  	}
> >
> >  	sci = pdev->dev.platform_data;
> > -	if (!sci->src_clk_name) {
> > -		dev_err(&pdev->dev,
> > -			"Board init must call s3c64xx_spi_set_info()\n");
> > -		return -EINVAL;
> > -	}
> >
> >  	/* Check for availability of necessary resource */
> >
> > @@ -1073,17 +1069,17 @@ static int __init s3c64xx_spi_probe(struct
> platform_device *pdev)
> >  		goto err4;
> >  	}
> >
> > -	sdd->src_clk = clk_get(&pdev->dev, sci->src_clk_name);
> > +	sprintf(clk_name, "spi_busclk%d", sci->src_clk_nr);
> > +	sdd->src_clk = clk_get(&pdev->dev, clk_name);
> >  	if (IS_ERR(sdd->src_clk)) {
> >  		dev_err(&pdev->dev,
> > -			"Unable to acquire clock '%s'\n",
sci->src_clk_name);
> > +			"Unable to acquire clock '%s'\n", clk_name);
> >  		ret = PTR_ERR(sdd->src_clk);
> >  		goto err5;
> >  	}
> >
> >  	if (clk_enable(sdd->src_clk)) {
> > -		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n",
> > -							sci->src_clk_name);
> > +		dev_err(&pdev->dev, "Couldn't enable clock '%s'\n",
clk_name);
> >  		ret = -EBUSY;
> >  		goto err6;
> >  	}
> > --
> > 1.7.4.4
> >
