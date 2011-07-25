From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 03/14] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Mon, 25 Jul 2011 21:51:37 +0900
Message-ID: <002401cc4ac9$97737570$c65a6050$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-4-git-send-email-boojin.kim@samsung.com>
 <1311589617.27357.3.camel@vkoul-mobl4>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45260 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751113Ab1GYMvj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 08:51:39 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOW009DB3Q1KRO0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 21:51:38 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOW00GWO3Q1D7@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 21:51:38 +0900 (KST)
In-reply-to: <1311589617.27357.3.camel@vkoul-mobl4>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vinod Koul' <vkoul@infradead.org>
Cc: vinod.koul@intel.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>

Vinod Koul Wrote:
> Sent: Monday, July 25, 2011 7:27 PM
> To: Boojin Kim
> Cc: vinod.koul@intel.com; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; Kukjin Kim; Jassi Brar; Grant Likely;
> Mark Brown; Dan Williams
> Subject: Re: [PATCH V4 03/14] DMA: PL330: Support DMA_SLAVE_CONFIG
> command
>
> On Mon, 2011-07-25 at 10:28 +0900, Boojin Kim wrote:
> > This patch adds support DMA_SLAVE_CONFIG command.
> >
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > ---
> >  drivers/dma/pl330.c |   53 +++++++++++++++++++++++++++++++++++++----
> ---------
> >  1 files changed, 39 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index 586ab39..880f010 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -256,25 +256,50 @@ static int pl330_alloc_chan_resources(struct
> dma_chan *chan)
> >  static int pl330_control(struct dma_chan *chan, enum dma_ctrl_cmd
> cmd, unsigned long arg)
> >  {
> >  	struct dma_pl330_chan *pch = to_pchan(chan);
> > -	struct dma_pl330_desc *desc;
> > +	struct dma_pl330_desc *desc, *_dt;
> >  	unsigned long flags;
> > +	struct dma_pl330_dmac *pdmac = pch->dmac;
> > +	struct dma_slave_config *slave_config;
> > +	struct dma_pl330_peri *peri;
> > +	LIST_HEAD(list);
> >
> > -	/* Only supports DMA_TERMINATE_ALL */
> > -	if (cmd != DMA_TERMINATE_ALL)
> > -		return -ENXIO;
> > -
> > -	spin_lock_irqsave(&pch->lock, flags);
> > -
> > -	/* FLUSH the PL330 Channel thread */
> > -	pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
> > +	switch (cmd) {
> > +	case DMA_TERMINATE_ALL:
> > +		spin_lock_irqsave(&pch->lock, flags);
> >
> > -	/* Mark all desc done */
> > -	list_for_each_entry(desc, &pch->work_list, node)
> > -		desc->status = DONE;
> > +		/* FLUSH the PL330 Channel thread */
> > +		pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
> >
> > -	spin_unlock_irqrestore(&pch->lock, flags);
> > +		/* Mark all desc done */
> > +		list_for_each_entry_safe(desc, _dt, &pch->work_list , node)
> {
> > +			desc->status = DONE;
> > +			pch->completed = desc->txd.cookie;
> > +			list_move_tail(&desc->node, &list);
> > +		}
> >
> > -	pl330_tasklet((unsigned long) pch);
> > +		list_splice_tail_init(&list, &pdmac->desc_pool);
> > +		spin_unlock_irqrestore(&pch->lock, flags);
> > +		break;
> > +	case DMA_SLAVE_CONFIG:
> > +		slave_config = (struct dma_slave_config *)arg;
> > +		peri = pch->chan.private;
> > +
> > +		if (slave_config->direction == DMA_TO_DEVICE) {
> > +			if (slave_config->dst_addr)
> > +				peri->fifo_addr = slave_config->dst_addr;
> > +			if (slave_config->dst_addr_width)
> > +				peri->burst_sz = __ffs(slave_config-
> >dst_addr_width);
> This doesn't sound right, why can't you use xxx_maxburst field instead?
Can you explain the problem in more detail?
Do you mean that 'xxx_maxburst' takes place of 'xxx_addr_width' or __ffs() 
isn't proper here?

Additionally, I will modify this code to consider '_maxburst' field.

>
> > +		} else if (slave_config->direction == DMA_FROM_DEVICE) {
> > +			if (slave_config->src_addr)
> > +				peri->fifo_addr = slave_config->src_addr;
> > +			if (slave_config->src_addr_width)
> > +				peri->burst_sz = __ffs(slave_config-
> >src_addr_width);
> ditto...
> > +		}
> > +		break;
> > +	default:
> > +		dev_err(pch->dmac->pif.dev, "Not supported command.\n");
> > +		return -ENXIO;
> > +	}
> >
> >  	return 0;
> >  }
>
> --
> ~Vinod Koul
> Intel Corp.
