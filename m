From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
Date: Mon, 25 Jul 2011 19:31:45 +0900
Message-ID: <002001cc4ab6$0d7cd590$287680b0$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-5-git-send-email-boojin.kim@samsung.com>
 <20110725092749.GB9653@n2100.arm.linux.org.uk>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16699 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093Ab1GYKcF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 06:32:05 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOV009RNX8XGFG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 19:31:46 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOV00747X8YSL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 19:31:46 +0900 (KST)
In-reply-to: <20110725092749.GB9653@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>

Russell King - ARM Linux Wrote:

> Sent: Monday, July 25, 2011 6:28 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org;
linux-samsung-soc@vger.kernel.org;
> Kukjin Kim; Vinod Koul; Jassi Brar; Grant Likely; Mark Brown; Dan Williams
> Subject: Re: [PATCH V4 04/14] DMA: PL330: Add DMA_CYCLIC capability
>
> On Mon, Jul 25, 2011 at 10:28:22AM +0900, Boojin Kim wrote:
> > +static void pl330_tasklet_cyclic(unsigned long data)
> > +{
> > +	struct dma_pl330_chan *pch = (struct dma_pl330_chan *)data;
> > +	struct dma_pl330_desc *desc, *_dt;
> > +	unsigned long flags;
> > +	LIST_HEAD(list);
> > +
> > +	spin_lock_irqsave(&pch->lock, flags);
> ...
> > +			callback = desc->txd.callback;
> > +			if (callback)
> > +				callback(desc->txd.callback_param);
>
> On this again - what if the callback wants to terminate the DMA activity
> because there's no more audio data to be sent/received from the device?

Do you mean what is happened if the callback() is called after channel is
terminated ?
Or What is happened if Callback() calls 'dma_release_channel()' to terminate
DMA?

>
> > +
>
> Useless blank line.
I will address your comment.
>
> > +		}
> > +
> > +	spin_unlock_irqrestore(&pch->lock, flags);
> > +}
> > +
> >  static void pl330_tasklet(unsigned long data)
> >  {
> >  	struct dma_pl330_chan *pch = (struct dma_pl330_chan *)data;
> > @@ -227,6 +267,9 @@ static void dma_pl330_rqcb(void *token, enum
> pl330_op_err err)
> >
> >  	spin_unlock_irqrestore(&pch->lock, flags);
> >
> > +	if (pch->cyclic_task)
> > +		tasklet_schedule(pch->cyclic_task);
> > +	else
> >  	tasklet_schedule(&pch->task);
>
> Indentation error.
Sorry again.. I will address your comment.

>
> >  }
> >
> > @@ -316,6 +359,15 @@ static void pl330_free_chan_resources(struct
dma_chan
> *chan)
> >  	pl330_release_channel(pch->pl330_chid);
> >  	pch->pl330_chid = NULL;
> >
> > +	if (pch->cyclic) {
> > +		pch->cyclic = false;
> > +		list_splice_tail_init(&pch->work_list,
&pch->dmac->desc_pool);
> > +		if (pch->cyclic_task) {
> > +			tasklet_kill(pch->cyclic_task);
> > +			pch->cyclic_task = NULL;
> > +		}
> > +	}
> > +
> >  	spin_unlock_irqrestore(&pch->lock, flags);
> >  }
> >
> > @@ -547,6 +599,63 @@ static inline int get_burst_len(struct
dma_pl330_desc
> *desc, size_t len)
> >  	return burst_len;
> >  }
> >
> > +static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
> > +		struct dma_chan *chan, dma_addr_t dma_addr, size_t len,
> > +		size_t period_len, enum dma_data_direction direction)
> > +{
> > +	struct dma_pl330_desc *desc;
> > +	struct dma_pl330_chan *pch = to_pchan(chan);
> > +	struct dma_pl330_peri *peri = chan->private;
> > +	dma_addr_t dst;
> > +	dma_addr_t src;
> > +
> > +	pch = to_pchan(chan);
> > +	if (!pch)
> > +		return NULL;
>
> You've already done the to_pchan() thing when declaring pch.  You've
> already dereferenced 'chan', so there's no way that pch could be NULL
> here.
I will address your comment.

>
> > +
> > +	desc = pl330_get_desc(pch);
> > +	if (!desc) {
> > +		dev_err(pch->dmac->pif.dev, "%s:%d Unable to fetch desc\n",
> > +			__func__, __LINE__);
> > +		return NULL;
> > +	}
> > +
> > +	switch (direction) {
> > +	case DMA_TO_DEVICE:
> > +		desc->rqcfg.src_inc = 1;
> > +		desc->rqcfg.dst_inc = 0;
> > +		src = dma_addr;
> > +		dst = peri->fifo_addr;
> > +		break;
> > +	case DMA_FROM_DEVICE:
> > +		desc->rqcfg.src_inc = 0;
> > +		desc->rqcfg.dst_inc = 1;
> > +		src = peri->fifo_addr;
> > +		dst = dma_addr;
> > +		break;
> > +	default:
> > +		dev_err(pch->dmac->pif.dev, "%s:%d Invalid dma direction\n",
> > +		__func__, __LINE__);
> > +		return NULL;
> > +	}
> > +
> > +	desc->rqcfg.brst_size = peri->burst_sz;
> > +	desc->rqcfg.brst_len = 1;
> > +
> > +	if (!pch->cyclic_task) {
> > +		pch->cyclic_task =
> > +			kmalloc(sizeof(struct tasklet_struct), GFP_KERNEL);
> > +		tasklet_init(pch->cyclic_task,
> > +			pl330_tasklet_cyclic, (unsigned int)pch);
>
> Here you allocate memory for the cyclic task.  Above you set this pointer
> to NULL.  That sounds like a memory leak to me.  Why are you kmallocing
> this memory - why can't it be part of the dma_pl330_chan structure?  It's
> only 28 bytes.

It's my mistake. I should have been free of the memory.

And the reason why I use kmalloc for 'cyclic_task' is following.
This memory size for 'cyclic_tasklet' is the 896 bytes ( = the number of
channel * sizeof(struct tasklet_struct)= 32*28) for each DMAC. And This
memory size is increased according to the number of DMAC.
And Samsung has the DMAC that is dedicated for Mem-to-Mem operation. If I
make 'cyclic_task' be part of dma_pl330_chan, this DMAC that is dedicated
for Mem-to-Mem operation should hold unused data.
So, I think it's loss that all dma channels hold own 'cyclic_task'.
