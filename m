From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
Date: Mon, 22 Aug 2011 21:03:13 +0900
Message-ID: <002c01cc60c3$77d18210$67748630$%kim@samsung.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
 <1313744097-27289-5-git-send-email-boojin.kim@samsung.com>
 <CABb+yY2CjmoDEmvC3S0ua3=B++jKz5g2JXGTwhNcAw5MQ06M9A@mail.gmail.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:57594 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491Ab1HVMDP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 08:03:15 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQB009RYW5DSSR0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2011 21:03:13 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQB00GZVW5D7C@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2011 21:03:13 +0900 (KST)
In-reply-to: <CABb+yY2CjmoDEmvC3S0ua3=B++jKz5g2JXGTwhNcAw5MQ06M9A@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Russell King' <linux@arm.linux.org.uk>

Jassi Brar wrote:

>
> > @@ -324,6 +362,9 @@ static void pl330_free_chan_resources(struct
> dma_chan *chan)
> >        pl330_release_channel(pch->pl330_chid);
> >        pch->pl330_chid = NULL;
> >
> > +       if (pch->cyclic)
> > +               list_splice_tail_init(&pch->work_list, &pch->dmac-
> >desc_pool);
> 'cyclic' member is 'enum cyclic_mode', please observe the rule and
> compare
> it only against the enum values.
I will address your comment.

>
>
> > +static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
> > +               struct dma_chan *chan, dma_addr_t dma_addr, size_t len,
> > +               size_t period_len, enum dma_data_direction direction)
> > +{
> > +       struct dma_pl330_desc *desc;
> > +       struct dma_pl330_chan *pch = to_pchan(chan);
> > +       dma_addr_t dst;
> > +       dma_addr_t src;
> > +
> > +       desc = pl330_get_desc(pch);
> > +       if (!desc) {
> > +               dev_err(pch->dmac->pif.dev, "%s:%d Unable to fetch
> desc\n",
> > +                       __func__, __LINE__);
> > +               return NULL;
> > +       }
> > +
> > +       switch (direction) {
> > +       case DMA_TO_DEVICE:
> > +               desc->rqcfg.src_inc = 1;
> > +               desc->rqcfg.dst_inc = 0;
> > +               src = dma_addr;
> > +               dst = pch->fifo_addr;
> > +               break;
> > +       case DMA_FROM_DEVICE:
> > +               desc->rqcfg.src_inc = 0;
> > +               desc->rqcfg.dst_inc = 1;
> > +               src = pch->fifo_addr;
> > +               dst = dma_addr;
> > +               break;
> > +       default:
> > +               dev_err(pch->dmac->pif.dev, "%s:%d Invalid dma
> direction\n",
> > +               __func__, __LINE__);
> > +               return NULL;
> > +       }
> > +
> > +       desc->rqcfg.brst_size = pch->burst_sz;
> > +       desc->rqcfg.brst_len = 1;
> > +
> > +       if (!pch->cyclic)
> > +               pch->cyclic = CYCLIC_PREP;
> The need for check here seems suspicious.
> Is it really needed? If not, please remove it.
It's required because Cyclic operation is passed from CYCLIC_PREP to 
CYCLIC_TRIGGER.

Thanks
Boojin
