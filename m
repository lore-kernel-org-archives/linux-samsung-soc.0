From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2] spi: s3c64xx: fix casting warning
Date: Mon, 22 Jul 2013 19:09:27 +0200
Message-ID: <10928386.fNethLYWc8@amdc1227>
References: <008101ce82cb$34f0eea0$9ed2cbe0$@samsung.com>
 <20130717100816.GK22506@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:15892 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757501Ab3GVRJc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 13:09:32 -0400
In-reply-to: <20130717100816.GK22506@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jingoo Han <jg1.han@samsung.com>, linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Joe Perches' <joe@perches.com>

On Wednesday 17 of July 2013 11:08:16 Mark Brown wrote:
> On Wed, Jul 17, 2013 at 05:54:11PM +0900, Jingoo Han wrote:
> > sdd->ops->request is unsigned int, not unsigned long.
> > Also, sdd->rx_dma.ch is a 'struct dma_chan *'.
> > Thus, (void *) is converted to (struct dma_chan *)(unsigned long),
> > in order to fix possible sparse warnings.
> 
> Applied, though only the cast to unsigned long should actually be needed
> - casting to void * should be good for any pointer so changing to the
> specific struct shouldn't be essential (might catch issues due to
> future API changes though).

Well, hopefully the old S3C DMA API with all its brokenness will get 
removed soon and we switch to generic DMA engine API. (I already have 
patches to migrate Samsung ASoC and SPI is being worked on.)

Best regards,
Tomasz
