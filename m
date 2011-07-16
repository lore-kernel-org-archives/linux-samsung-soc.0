From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V2 05/12] ARM: SAMSUNG: Add common DMA operations
Date: Fri, 15 Jul 2011 18:50:03 -0600
Message-ID: <20110716005003.GQ2833@ponder.secretlab.ca>
References: <1310546857-6304-1-git-send-email-kgene.kim@samsung.com>
 <1310546857-6304-6-git-send-email-kgene.kim@samsung.com>
 <20110715025347.GU2927@ponder.secretlab.ca>
 <001301cc4350$d4c09fa0$7e41dee0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:55621 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752028Ab1GPAuF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 20:50:05 -0400
Received: by pvg12 with SMTP id 12so1473799pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Jul 2011 17:50:05 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <001301cc4350$d4c09fa0$7e41dee0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Liam Girdwood' <lrg@ti.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Linus Walleij' <linus.walleij@linaro.org>

On Sat, Jul 16, 2011 at 09:39:31AM +0900, Boojin Kim wrote:
> Grant Likely wrote:
> > > +void *samsung_dma_get_ops(void)
> > > +{
> > > +	return (void *)&dmaeng_ops;
> > > +}
> > > +EXPORT_SYMBOL(samsung_dma_get_ops);
> > 
> > If all that is needed is a reference to the dma ops, then you could
> > simply export samsung_dmaeng_ops() without a separate function.
> 
> Grant, Thanks for your comments. I can't understand this comment well.
> Do you mean to change function name from 'samsung_dma_get_ops()' to
> 'samsung_dmaeng_ops()' ?
> Or export 'dmaeng_ops' variable instead of making this
> 'samsung_dma_get_ops()' function

I mean export dmaeng_ops instead of using a function.  You also get
some type checking by not casting it into a (void*).
