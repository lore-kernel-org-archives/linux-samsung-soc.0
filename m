From: Vinod Koul <vinod.koul@linux.intel.com>
Subject: Re: [PATCH] dma: pl330: assign a new cookie when restarting tx
 descriptors in cyclic mode
Date: Fri, 04 May 2012 09:14:19 +0530
Message-ID: <1336103059.1593.28.camel@vkoul-udesk3>
References: <1336092630-20627-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:19843 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753775Ab2EDDuD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 May 2012 23:50:03 -0400
In-Reply-To: <1336092630-20627-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk, jassisinghbrar@gmail.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On Thu, 2012-05-03 at 17:50 -0700, Thomas Abraham wrote:
> The cookie of completed transfer descriptors are marked as zero. In case of
> cyclic transfers, a new cookie needs to be assigned to the transfer descriptors
> which are picked up from the work_list list before they are re-enabled for
> transfer. This prevents hitting BUG_ON in dma_cookie_complete function when
> transfer descriptors are recycled from the work_list list.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  drivers/dma/pl330.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 2ee6e23..7f8f422 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -2265,6 +2265,7 @@ static inline void handle_cyclic_desc_list(struct list_head *list)
>  		dma_async_tx_callback callback;
>  
>  		/* Change status to reload it */
> +		dma_cookie_assign(&desc->txd);
>  		desc->status = PREP;
>  		pch = desc->pchan;
>  		callback = desc->txd.callback;
Nope, this doesn't seem correct to me for two reasons:
1. client doesnt know this new descriptor, so how will it keep track
2. What does marking cyclic descriptor complete mean... Nothing IMO

So it is better *NOT* to mark the descriptor complete.
And below is a better fix this for you, Please test.

----------

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 2ee6e23..fa3fb21 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2322,7 +2322,8 @@ static void pl330_tasklet(unsigned long data)
 	/* Pick up ripe tomatoes */
 	list_for_each_entry_safe(desc, _dt, &pch->work_list, node)
 		if (desc->status == DONE) {
-			dma_cookie_complete(&desc->txd);
+			if (pch->cyclic)
+				dma_cookie_complete(&desc->txd);
 			list_move_tail(&desc->node, &list);
 		}
 

-- 
~Vinod
