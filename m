From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 1/3] dmaengine: pl330: Set residue in tx_status callback.
Date: Fri, 13 Sep 2013 08:33:13 +0530
Message-ID: <CAAgF-BctHjFaSM7N4Nrpyixv_sLpUMxfMnFcnZqTvymN4hVanw@mail.gmail.com>
References: <1378879685-5352-1-git-send-email-padma.v@samsung.com>
	<1378879685-5352-2-git-send-email-padma.v@samsung.com>
	<00b401ceafac$e3a88170$aaf98450$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:35066 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867Ab3IMDDO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Sep 2013 23:03:14 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq15so194096wib.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Sep 2013 20:03:13 -0700 (PDT)
In-Reply-To: <00b401ceafac$e3a88170$aaf98450$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>, Vinod Koul <vinod.koul@intel.com>, "broonie@kernel.org" <broonie@kernel.org>, dgreid@chromium.org, olofj@chromium.org

Hi Chanho,

On Thu, Sep 12, 2013 at 5:10 PM, Chanho Park <chanho61.park@samsung.com> wrote:
> Hi Padmavathi,
>
>> -----Original Message-----
>> From: linux-arm-kernel [mailto:linux-arm-kernel-
>> bounces@lists.infradead.org] On Behalf Of Padmavathi Venna
>> Sent: Wednesday, September 11, 2013 3:08 PM
>> To: linux-samsung-soc@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; padma.v@samsung.com; padma.kvr@gmail.com
>> Cc: kgene.kim@samsung.com; arnd@arndb.de; sbkim73@samsung.com;
>> vinod.koul@intel.com; broonie@kernel.org; dgreid@chromium.org;
>> olofj@chromium.org
>> Subject: [PATCH 1/3] dmaengine: pl330: Set residue in tx_status callback.
>>
>> From: Dylan Reid <dgreid@chromium.org>
>>
>> Fill txstate.residue with the amount of bytes remaining in the current
>> transfer if the transfer is not complete.  This will be of particular use
>> to i2s DMA transfers, providing more accurate hw_ptr values to ASoC.
>>
>> Signed-off-by: Dylan Reid <dgreid@chromium.org>
>> Reviewed-by: Olof Johansson <olofj@chromium.org>
>> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
>> ---
>>  drivers/dma/pl330.c |   55
>> ++++++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 files changed, 54 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c index
>> 593827b..7ab9136 100644
>> --- a/drivers/dma/pl330.c
>> +++ b/drivers/dma/pl330.c
>> @@ -2476,11 +2476,64 @@ static void pl330_free_chan_resources(struct
>> dma_chan *chan)
>>       spin_unlock_irqrestore(&pch->lock, flags);  }
>>
>> +static inline int
>> +pl330_src_addr_in_desc(struct dma_pl330_desc *desc, unsigned int sar) {
>> +     return ((desc->px.src_addr <= sar) &&
>> +             (sar <= (desc->px.src_addr + desc->px.bytes))); }
>> +
>> +static inline int
>> +pl330_dst_addr_in_desc(struct dma_pl330_desc *desc, unsigned int dar) {
>> +     return ((desc->px.dst_addr <= dar) &&
>> +             (dar <= (desc->px.dst_addr + desc->px.bytes))); }
>> +
>> +static unsigned int pl330_tx_residue(struct dma_chan *chan) {
>> +     struct dma_pl330_chan *pch = to_pchan(chan);
>> +     void __iomem *regs = pch->dmac->pif.base;
>> +     struct pl330_thread *thrd = pch->pl330_chid;
>> +     struct dma_pl330_desc *desc;
>> +     unsigned int sar, dar;
>> +     unsigned int residue = 0;
>> +     unsigned long flags;
>> +
>> +     sar = readl(regs + SA(thrd->id));
>> +     dar = readl(regs + DA(thrd->id));
>> +
>> +     spin_lock_irqsave(&pch->lock, flags);
>> +
>> +     /* Find the desc related to the current buffer. */
>> +     list_for_each_entry(desc, &pch->work_list, node) {
>> +             if (desc->rqcfg.src_inc && pl330_src_addr_in_desc(desc,
>> sar)) {
>> +                     residue = desc->px.bytes - (sar -
> desc->px.src_addr);
>> +                     goto found_unlock;
>> +             }
>> +             if (desc->rqcfg.dst_inc && pl330_dst_addr_in_desc(desc,
>> dar)) {
>> +                     residue = desc->px.bytes - (dar -
> desc->px.dst_addr);
>> +                     goto found_unlock;
>> +             }
>> +     }
>> +
>> +found_unlock:
>> +     spin_unlock_irqrestore(&pch->lock, flags);
>> +
>> +     return residue;
>> +}
>> +
>>  static enum dma_status
>>  pl330_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
>>                struct dma_tx_state *txstate)
>>  {
>> -     return dma_cookie_status(chan, cookie, txstate);
>> +     enum dma_status ret;
>> +
>> +     ret = dma_cookie_status(chan, cookie, txstate);
>> +     if (ret != DMA_SUCCESS) /* Not complete, check amount left. */
>> +             dma_set_residue(txstate, pl330_tx_residue(chan));
>> +
>> +     return ret;
>
> Why didn't you use a cookie value to track the request?
> The cookie is assigned when each transfer is submitted.
> If you save the value in the desc, we can find the request easily.

Ok. I will check this and modify the code in the next version of patches.

Thanks for the suggestion.

>
> Thanks,
>
> Best  Regards,
> Chanho Park
>

Best Regards
Padma
