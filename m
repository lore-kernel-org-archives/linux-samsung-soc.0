From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH V2 2/2] spi: s3c64xx: fix checkpatch error and warnings
Date: Mon, 15 Jul 2013 16:37:08 -0700
Message-ID: <1373931428.2062.51.camel@joe-AO722>
References: <000101ce8122$3621f7b0$a265e710$@samsung.com>
	 <1373890206.2062.4.camel@joe-AO722>
	 <002e01ce81b2$5825d800$08718800$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from perches-mx.perches.com ([206.117.179.246]:57050 "EHLO
	labridge.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757698Ab3GOXhK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jul 2013 19:37:10 -0400
In-Reply-To: <002e01ce81b2$5825d800$08718800$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Mark Brown' <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On Tue, 2013-07-16 at 08:23 +0900, Jingoo Han wrote:
> On Monday, July 15, 2013 9:10 PM, Joe Perches wrote:
> > On Mon, 2013-07-15 at 15:11 +0900, Jingoo Han wrote:
> > []
> > > diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> > []
> > > @@ -338,8 +338,10 @@ static int acquire_dma(struct s3c64xx_spi_driver_data *sdd)
> > []
> > > -	sdd->rx_dma.ch = (void *)sdd->ops->request(sdd->rx_dma.dmach, &req, dev, "rx");
> > > -	sdd->tx_dma.ch = (void *)sdd->ops->request(sdd->tx_dma.dmach, &req, dev, "tx");
> > > +	sdd->rx_dma.ch = (void *)sdd->ops->request(sdd->rx_dma.dmach,
> > > +						&req, dev, "rx");
> > > +	sdd->tx_dma.ch = (void *)sdd->ops->request(sdd->tx_dma.dmach,
> > > +						&req, dev, "tx");
> > 
> > There should be sparse errors here.
> > sdd->ops->request is unsigned int, not unsigned long.
> > Care to fix the cast of unsigned to pointer too?
> 
> OK, I will fix it as below:
> 
> sdd->rx_dma.ch = (unsigned long *)sdd->ops->request(sdd->rx_dma.dmach,
> 							&req, dev, "rx");
> sdd->tx_dma.ch = (unsigned long *)sdd->ops->request(sdd->tx_dma.dmach,
> 							&req, dev, "tx");

Which should give you a different error.

The canonical (Small C, not the Ubuntu company)
way to do this is to first cast to unsigned long
then cast to pointer type.

sdd->tx_dma.ch = (unsigned long *)(unsigned long)sdd->ops->request(etc...)

> > It seems unsigned to pointer conversions are pretty
> > rampant in this code.
> 
> It seems so.
> I will look into it, later.

No worries.  Whenever you get 'round to it.
