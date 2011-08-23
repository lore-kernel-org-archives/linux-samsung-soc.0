From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
Date: Tue, 23 Aug 2011 16:08:27 +0900
Message-ID: <001001cc6163$74cc62b0$5e652810$%kim@samsung.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
 <1313744097-27289-5-git-send-email-boojin.kim@samsung.com>
 <CABb+yY2CjmoDEmvC3S0ua3=B++jKz5g2JXGTwhNcAw5MQ06M9A@mail.gmail.com>
 <002c01cc60c3$77d18210$67748630$%kim@samsung.com>
 <CABb+yY0oQwBTc1zmow+ng+TEJTzRsjB-i1xZdLVwtT+RR6J5RQ@mail.gmail.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49791 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750748Ab1HWHI3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Aug 2011 03:08:29 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQD00J1SD60LI80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 16:08:28 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQD00MJRD63KO@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Aug 2011 16:08:28 +0900 (KST)
In-reply-to: <CABb+yY0oQwBTc1zmow+ng+TEJTzRsjB-i1xZdLVwtT+RR6J5RQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Russell King' <linux@arm.linux.org.uk>

Jassi Brar [mailto:jassisinghbrar@gmail.com]
> Sent: Tuesday, August 23, 2011 2:42 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; Vinod Koul; Kukjin Kim; Dan Williams; Mark Brown;
> Grant Likely; Russell King
> Subject: Re: [PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
>
> On Mon, Aug 22, 2011 at 5:33 PM, Boojin Kim <boojin.kim@samsung.com>
> wrote:
> >>
> >> > +static struct dma_async_tx_descriptor *pl330_prep_dma_cyclic(
> >> > +               struct dma_chan *chan, dma_addr_t dma_addr, size_t
> len,
> >> > +               size_t period_len, enum dma_data_direction
> direction)
> >> > +{
> >> > +       struct dma_pl330_desc *desc;
> >> > +       struct dma_pl330_chan *pch = to_pchan(chan);
> >> > +       dma_addr_t dst;
> >> > +       dma_addr_t src;
> >> > +
> >> > +       desc = pl330_get_desc(pch);
> >> > +       if (!desc) {
> >> > +               dev_err(pch->dmac->pif.dev, "%s:%d Unable to fetch
> >> desc\n",
> >> > +                       __func__, __LINE__);
> >> > +               return NULL;
> >> > +       }
> >> > +
> >> > +       switch (direction) {
> >> > +       case DMA_TO_DEVICE:
> >> > +               desc->rqcfg.src_inc = 1;
> >> > +               desc->rqcfg.dst_inc = 0;
> >> > +               src = dma_addr;
> >> > +               dst = pch->fifo_addr;
> >> > +               break;
> >> > +       case DMA_FROM_DEVICE:
> >> > +               desc->rqcfg.src_inc = 0;
> >> > +               desc->rqcfg.dst_inc = 1;
> >> > +               src = pch->fifo_addr;
> >> > +               dst = dma_addr;
> >> > +               break;
> >> > +       default:
> >> > +               dev_err(pch->dmac->pif.dev, "%s:%d Invalid dma
> >> direction\n",
> >> > +               __func__, __LINE__);
> >> > +               return NULL;
> >> > +       }
> >> > +
> >> > +       desc->rqcfg.brst_size = pch->burst_sz;
> >> > +       desc->rqcfg.brst_len = 1;
> >> > +
> >> > +       if (!pch->cyclic)
> >> > +               pch->cyclic = CYCLIC_PREP;
> >> The need for check here seems suspicious.
> >> Is it really needed? If not, please remove it.
> > It's required because Cyclic operation is passed from CYCLIC_PREP to
> > CYCLIC_TRIGGER.
> I don't see why you need to differentiate between PREP and TRIGGER in
> cyclic mode. I think, you should simply have 'bool cyclic' instead of
> enum.
On cyclic mode, Pl330_tasklet() operation is changed according to the value of 
'cyclic'.
In case of CYCLIC_PREP, Pl330_tasklet()operation is same with normal 
operation.
In case of CYCLIC_TRIGGER, pl330_tasklet()reloads the done data into 
work_list.
So, 'Cyclic' needs two status(CYCLIC_PREP and CYCLIC_TRIGGER) to distinguish 
the operation on pl330_tasklet().
The sequence is following.
device_prep_dma_cyclic() -> set CYCLIC_PREP -> device_issue_pending() -> 
Pl330_tasklet() with CYCLIC_PREP -> set CYCLIC_TRIGGER -> PL330 IRQ -> 
Pl330_tasklet() with CYCLIC_TRIGGER.

Thanks
Boojin
