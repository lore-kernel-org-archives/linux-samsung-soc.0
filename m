From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 02/14] DMA: PL330: Update PL330 DMA API driver
Date: Mon, 25 Jul 2011 18:48:42 +0900
Message-ID: <001e01cc4ab0$0a233200$1e699600$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
 <1311557312-26107-3-git-send-email-boojin.kim@samsung.com>
 <CABb+yY2YdFLua8gNEJOwCyJPz3kyLwhKLXXoc8_V59t9yLMt1g@mail.gmail.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:14771 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074Ab1GYJsp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 05:48:45 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOV000GKV97M890@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 18:48:44 +0900 (KST)
Received: from DOBOOJINKIM03 (12-23-120-72.csky.net [12.23.120.72])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOV005B7V97FI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 18:48:43 +0900 (KST)
In-reply-to: <CABb+yY2YdFLua8gNEJOwCyJPz3kyLwhKLXXoc8_V59t9yLMt1g@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jassi Brar' <jassisinghbrar@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Vinod Koul' <vinod.koul@intel.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>



> -----Original Message-----
> From: Jassi Brar [mailto:jassisinghbrar@gmail.com]
> Sent: Monday, July 25, 2011 5:58 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
> Vinod Koul; Dan Williams; Kukjin Kim; Grant Likely; Mark Brown
> Subject: Re: [PATCH V4 02/14] DMA: PL330: Update PL330 DMA API driver
>
> On Mon, Jul 25, 2011 at 6:58 AM, Boojin Kim <boojin.kim@samsung.com> wrote:
>
> > diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > index b7ecf47..586ab39 100644
> > --- a/drivers/dma/pl330.c
> > +++ b/drivers/dma/pl330.c
> > @@ -455,7 +455,7 @@ static struct dma_pl330_desc *pl330_get_desc(struct
> dma_pl330_chan *pch)
> >        async_tx_ack(&desc->txd);
> >
> >        desc->req.rqtype = peri->rqtype;
> > -       desc->req.peri = peri->peri_id;
> > +       desc->req.peri = pch->chan.chan_id;
> Btw, I plan to revert this if my patch is accepted that proposes
> to free chan_id solely for use by DMAC drivers(which we should
> employ to pass paltform assigned channel ID to client drivers)
>
> > @@ -748,17 +747,19 @@ pl330_probe(struct amba_device *adev, const struct
> amba_id *id)
> >                struct dma_pl330_peri *peri = &pdat->peri[i];
> >                pch = &pdmac->peripherals[i];
> >
> > -               switch (peri->rqtype) {
> > -               case MEMTOMEM:
> > -                       dma_cap_set(DMA_MEMCPY, pd->cap_mask);
> > -                       break;
> > -               case MEMTODEV:
> > -               case DEVTOMEM:
> > -                       dma_cap_set(DMA_SLAVE, pd->cap_mask);
> > -                       break;
> > -               default:
> > -                       dev_err(&adev->dev, "DEVTODEV Not Supported\n");
> > -                       continue;
> > +               if (peri) {
> > +                       switch (peri->rqtype) {
> > +                       case MEMTOMEM:
> > +                               dma_cap_set(DMA_MEMCPY, pd->cap_mask);
> > +                               break;
> > +                       case MEMTODEV:
> > +                       case DEVTOMEM:
> > +                               dma_cap_set(DMA_SLAVE, pd->cap_mask);
> > +                               break;
> > +                       default:
> > +                               dev_err(&adev->dev, "DEVTODEV Not
> Supported\n");
> > +                               continue;
> > +                       }
> >                }
> If you pass platform data correctly, you don't need to check against NULL
> peri.

Ok, It may be excessive error check. I will remove this point.
