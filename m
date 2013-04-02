From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V2] DMA: PL330: Add check if device tree compatible
Date: Tue, 2 Apr 2013 08:28:10 +0530
Message-ID: <CAAgF-BdMgwKaVCaURwCeZcH9-H7nQBpafjZ51zJYi6AXXk72yw@mail.gmail.com>
References: <1362475531-32260-1-git-send-email-padma.v@samsung.com>
	<1362475531-32260-2-git-send-email-padma.v@samsung.com>
	<20130321093906.GL10326@intel.com>
	<CAL_Jsq+3bJDiA=rXS=WY3BGuRh5X+nyxxosrqtSD9fx-asbCKQ@mail.gmail.com>
	<20130401182151.GH10326@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:33681 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754670Ab3DBC6M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Apr 2013 22:58:12 -0400
Received: by mail-ie0-f176.google.com with SMTP id x14so2998768ief.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Apr 2013 19:58:12 -0700 (PDT)
In-Reply-To: <20130401182151.GH10326@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robherring2@gmail.com>, Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sangbeom Kim <sbkim73@samsung.com>, "Mark Brown (broonie@opensource.wolfsonmicro.com)" <broonie@opensource.wolfsonmicro.com>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@secretlab.ca>, jon-hunter@ti.com, boojin.kim@samsung.com

Hi Vinod,

I apologies for the delayed reply. Last week I was out of station and
no access to mails. I will send another patch addressing your
comments.

Thanks
Padma
On Mon, Apr 1, 2013 at 11:51 PM, Vinod Koul <vinod.koul@intel.com> wrote:
>
> On Mon, Apr 01, 2013 at 08:13:31AM -0500, Rob Herring wrote:
> > On Thu, Mar 21, 2013 at 4:39 AM, Vinod Koul <vinod.koul@intel.com> wrote:
> > > On Tue, Mar 05, 2013 at 02:55:31PM +0530, Padmavathi Venna wrote:
> > >> This patch register the dma controller with generic dma helpers only
> > >> in DT case. This also adds some extra error handling in the driver.
> > >>
> > >> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> > >> Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
> >
> > What's the status on this? It is needed for 3.9 to fix pl330 on highbank.
> Well the status is that submitter has been rude. I had few questions and
> comments on this patch and they are yet to be addressed.
>
> --
> ~Vinod
> >
> > Rob
> >
> > >> ---
> > >>
> > >> Based on Vinod Koul next branch.
> > >>
> > >> Changes since V1:
> > >>       - return silently when of_dma_controller_register fails, as
> > >>         suggested by Arnd.
> > >>
> > >>  drivers/dma/pl330.c |   38 +++++++++++++++++++++++++++-----------
> > >>  1 files changed, 27 insertions(+), 11 deletions(-)
> > >>
> > >> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> > >> index 7181531..5dbc594 100644
> > >> --- a/drivers/dma/pl330.c
> > >> +++ b/drivers/dma/pl330.c
> > >> @@ -2882,7 +2882,7 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
> > >>  {
> > >>       struct dma_pl330_platdata *pdat;
> > >>       struct dma_pl330_dmac *pdmac;
> > >> -     struct dma_pl330_chan *pch;
> > >> +     struct dma_pl330_chan *pch, *_p;
> > >>       struct pl330_info *pi;
> > >>       struct dma_device *pd;
> > >>       struct resource *res;
> > >> @@ -2984,7 +2984,16 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
> > >>       ret = dma_async_device_register(pd);
> > >>       if (ret) {
> > >>               dev_err(&adev->dev, "unable to register DMAC\n");
> > >> -             goto probe_err2;
> > >> +             goto probe_err3;
> > >> +     }
> > >> +
> > >> +     if (adev->dev.of_node) {
> > >> +             ret = of_dma_controller_register(adev->dev.of_node,
> > >> +                                      of_dma_pl330_xlate, pdmac);
> > >> +             if (ret) {
> > >> +                     dev_err(&adev->dev,
> > >> +                     "unable to register DMA to the generic DT DMA helpers\n");
> > > Indent?

Okey.
>
> > >> +             }
> > >>       }
> > >>
> > >>       dev_info(&adev->dev,
> > >> @@ -2995,16 +3004,21 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
> > >>               pi->pcfg.data_bus_width / 8, pi->pcfg.num_chan,
> > >>               pi->pcfg.num_peri, pi->pcfg.num_events);
> > >>
> > >> -     ret = of_dma_controller_register(adev->dev.of_node,
> > >> -                                      of_dma_pl330_xlate, pdmac);
> > >> -     if (ret) {
> > >> -             dev_err(&adev->dev,
> > >> -             "unable to register DMA to the generic DT DMA helpers\n");
> > >> -             goto probe_err2;
> > >> -     }
> > >> -
> > >>       return 0;
> > >> +probe_err3:
> > >> +     amba_set_drvdata(adev, NULL);
> > >>
> > >> +     /* Idle the DMAC */
> > >> +     list_for_each_entry_safe(pch, _p, &pdmac->ddma.channels,
> > >> +                     chan.device_node) {
> > >> +
> > >> +             /* Remove the channel */
> > >> +             list_del(&pch->chan.device_node);
> > >> +
> > >> +             /* Flush the channel */
> > >> +             pl330_control(&pch->chan, DMA_TERMINATE_ALL, 0);
> > >> +             pl330_free_chan_resources(&pch->chan);
> > > free_chan for error handling in probe?


Will remove this.

> > >
>
> > >> +     }
> > >>  probe_err2:
> > >>       pl330_del(pi);
> > >>  probe_err1:
> > >> @@ -3023,8 +3037,10 @@ static int pl330_remove(struct amba_device *adev)
> > >>       if (!pdmac)
> > >>               return 0;
> > >>
> > >> -     of_dma_controller_free(adev->dev.of_node);
> > >> +     if (adev->dev.of_node)
> > >> +             of_dma_controller_free(adev->dev.of_node);
> > >>
> > >> +     dma_async_device_unregister(&pdmac->ddma);
> > >>       amba_set_drvdata(adev, NULL);
> > >>
> > >>       /* Idle the DMAC */
> > >> --
> > >> 1.7.4.4
> > >>
