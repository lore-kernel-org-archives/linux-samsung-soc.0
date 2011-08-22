From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH v6 03/15] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Mon, 22 Aug 2011 20:48:00 +0900
Message-ID: <002a01cc60c1$584a4a00$08dede00$%kim@samsung.com>
References: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
 <1313744097-27289-4-git-send-email-boojin.kim@samsung.com>
 <CABb+yY0T70-LFmf2hso1nJbeJop+0GNwLNcYAHuBJguScWreLw@mail.gmail.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22723 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491Ab1HVLsE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 07:48:04 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQB00GM8VFZR130@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2011 20:48:01 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQB00G7UVG1BA@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Aug 2011 20:48:01 +0900 (KST)
In-reply-to: <CABb+yY0T70-LFmf2hso1nJbeJop+0GNwLNcYAHuBJguScWreLw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Russell King' <linux@arm.linux.org.uk>

Jassi Brar wrote:
> Sent: Monday, August 22, 2011 7:14 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; Vinod Koul; Kukjin Kim; Dan Williams; Mark Brown;
> Grant Likely; Russell King
> Subject: Re: [PATCH v6 03/15] DMA: PL330: Support DMA_SLAVE_CONFIG
> command
>
> On Fri, Aug 19, 2011 at 2:24 PM, Boojin Kim <boojin.kim@samsung.com>
> wrote:
> > Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> > Acked-by: Vinod Koul <vinod.koul@intel.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  drivers/dma/pl330.c |   56 ++++++++++++++++++++++++++++++++++++++---
> ---------
> >  1 files changed, 42 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index d5829c7..59943ec 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -73,6 +73,7 @@ struct dma_pl330_chan {
> >
> >        /* For D-to-M and M-to-D channels */
> >        int burst_sz; /* the peripheral fifo width */
> > +       int burst_len; /* the number of burst */
> >        dma_addr_t fifo_addr;
> >  };
> >
> > @@ -261,25 +262,52 @@ static int pl330_alloc_chan_resources(struct
> dma_chan *chan)
> >  static int pl330_control(struct dma_chan *chan, enum dma_ctrl_cmd
> cmd, unsigned long arg)
> >  {
> >        struct dma_pl330_chan *pch = to_pchan(chan);
> > -       struct dma_pl330_desc *desc;
> > +       struct dma_pl330_desc *desc, *_dt;
> >        unsigned long flags;
> > +       struct dma_pl330_dmac *pdmac = pch->dmac;
> > +       struct dma_slave_config *slave_config;
> > +       LIST_HEAD(list);
> >
> > -       /* Only supports DMA_TERMINATE_ALL */
> > -       if (cmd != DMA_TERMINATE_ALL)
> > -               return -ENXIO;
> > -
> > -       spin_lock_irqsave(&pch->lock, flags);
> > -
> > -       /* FLUSH the PL330 Channel thread */
> > -       pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
> > +       switch (cmd) {
> > +       case DMA_TERMINATE_ALL:
> > +               spin_lock_irqsave(&pch->lock, flags);
> >
> > -       /* Mark all desc done */
> > -       list_for_each_entry(desc, &pch->work_list, node)
> > -               desc->status = DONE;
> > +               /* FLUSH the PL330 Channel thread */
> > +               pl330_chan_ctrl(pch->pl330_chid, PL330_OP_FLUSH);
> >
> > -       spin_unlock_irqrestore(&pch->lock, flags);
> > +               /* Mark all desc done */
> > +               list_for_each_entry_safe(desc, _dt, &pch->work_list ,
> node) {
> > +                       desc->status = DONE;
> > +                       pch->completed = desc->txd.cookie;
> > +                       list_move_tail(&desc->node, &list);
> > +               }
> >
> > -       pl330_tasklet((unsigned long) pch);
> > +               list_splice_tail_init(&list, &pdmac->desc_pool);
> > +               spin_unlock_irqrestore(&pch->lock, flags);
> > +               break;
> > +       case DMA_SLAVE_CONFIG:
> > +               slave_config = (struct dma_slave_config *)arg;
> > +
> > +               if (slave_config->direction == DMA_TO_DEVICE) {
> > +                       if (slave_config->dst_addr)
> > +                               pch->fifo_addr = slave_config->dst_addr;
> > +                       if (slave_config->dst_addr_width)
> > +                               pch->burst_sz = __ffs(slave_config-
> >dst_addr_width);
> > +                       if (slave_config->dst_maxburst)
> > +                               pch->burst_len = slave_config-
> >dst_maxburst;
> > +               } else if (slave_config->direction == DMA_FROM_DEVICE)
> {
> > +                       if (slave_config->src_addr)
> > +                               pch->fifo_addr = slave_config->src_addr;
> > +                       if (slave_config->src_addr_width)
> > +                               pch->burst_sz = __ffs(slave_config-
> >src_addr_width);
> > +                       if (slave_config->src_maxburst)
> > +                               pch->burst_len = slave_config-
> >src_maxburst;
> > +               }
> > +               break;
> > +       default:
> > +               dev_err(pch->dmac->pif.dev, "Not supported
> command.\n");
> > +               return -ENXIO;
> > +       }
>
> Apart from the alleged purpose "Support DMA_SLAVE_CONFIG command"
> this patch also modifies the behavior of DMA_TERMINATE_ALL.
> If the change is intended, please split it into two patches and
> explain the reason.
> Otherwise, restore the behavior.
I will address your comment.
