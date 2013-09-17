From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 1/3] dmaengine: pl330: Set residue in tx_status
 callback.
Date: Tue, 17 Sep 2013 12:31:34 +0530
Message-ID: <20130917070134.GR17188@intel.com>
References: <1378879685-5352-1-git-send-email-padma.v@samsung.com>
 <1378879685-5352-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:49186 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751429Ab3IQHuu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Sep 2013 03:50:50 -0400
Content-Disposition: inline
In-Reply-To: <1378879685-5352-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, arnd@arndb.de, dgreid@chromium.org, olofj@chromium.org

On Wed, Sep 11, 2013 at 11:38:03AM +0530, Padmavathi Venna wrote:
> From: Dylan Reid <dgreid@chromium.org>
> 
> Fill txstate.residue with the amount of bytes remaining in the current
> transfer if the transfer is not complete.  This will be of particular
> use to i2s DMA transfers, providing more accurate hw_ptr values to ASoC.
> 
> Signed-off-by: Dylan Reid <dgreid@chromium.org>
> Reviewed-by: Olof Johansson <olofj@chromium.org>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  drivers/dma/pl330.c |   55 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 files changed, 54 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 593827b..7ab9136 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2476,11 +2476,64 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
>  	spin_unlock_irqrestore(&pch->lock, flags);
>  }
>  
> +static inline int
> +pl330_src_addr_in_desc(struct dma_pl330_desc *desc, unsigned int sar)
> +{
> +	return ((desc->px.src_addr <= sar) &&
> +		(sar <= (desc->px.src_addr + desc->px.bytes)));
> +}
> +
> +static inline int
> +pl330_dst_addr_in_desc(struct dma_pl330_desc *desc, unsigned int dar)
> +{
> +	return ((desc->px.dst_addr <= dar) &&
> +		(dar <= (desc->px.dst_addr + desc->px.bytes)));
> +}
> +
> +static unsigned int pl330_tx_residue(struct dma_chan *chan)
> +{
> +	struct dma_pl330_chan *pch = to_pchan(chan);
> +	void __iomem *regs = pch->dmac->pif.base;
> +	struct pl330_thread *thrd = pch->pl330_chid;
> +	struct dma_pl330_desc *desc;
> +	unsigned int sar, dar;
> +	unsigned int residue = 0;
> +	unsigned long flags;
> +
> +	sar = readl(regs + SA(thrd->id));
> +	dar = readl(regs + DA(thrd->id));
> +
> +	spin_lock_irqsave(&pch->lock, flags);
> +
> +	/* Find the desc related to the current buffer. */
> +	list_for_each_entry(desc, &pch->work_list, node) {
> +		if (desc->rqcfg.src_inc && pl330_src_addr_in_desc(desc, sar)) {
> +			residue = desc->px.bytes - (sar - desc->px.src_addr);
> +			goto found_unlock;
> +		}
> +		if (desc->rqcfg.dst_inc && pl330_dst_addr_in_desc(desc, dar)) {
> +			residue = desc->px.bytes - (dar - desc->px.dst_addr);
> +			goto found_unlock;
> +		}
> +	}
> +
> +found_unlock:
> +	spin_unlock_irqrestore(&pch->lock, flags);
> +
> +	return residue;
> +}
> +
>  static enum dma_status
>  pl330_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
>  		 struct dma_tx_state *txstate)
>  {
> -	return dma_cookie_status(chan, cookie, txstate);
> +	enum dma_status ret;
> +
> +	ret = dma_cookie_status(chan, cookie, txstate);
> +	if (ret != DMA_SUCCESS) /* Not complete, check amount left. */
if will return DMA_IN_PROGRESS for two cases
a) when the descriptor is in queue
b) when the descriptor is submitted and running

You need to take different paths for these two cases. For former just return residue
as complete size of descriptor. For latter you cna read sar/dar and check
remaining bytes in sg_list.

Hint: use the cookie values to find the state

> +		dma_set_residue(txstate, pl330_tx_residue(chan));
> +
> +	return ret;
>  }
>  
>  static void pl330_issue_pending(struct dma_chan *chan)

~Vinod
-- 
