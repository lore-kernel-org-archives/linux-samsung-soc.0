From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/3] ARM: SAMSUNG: Modify pl330 channel filter function
Date: Mon, 22 Aug 2011 22:52:55 +0100
Message-ID: <20110822215255.GB3895@n2100.arm.linux.org.uk>
References: <1314050385-9617-1-git-send-email-thomas.abraham@linaro.org> <1314050385-9617-2-git-send-email-thomas.abraham@linaro.org> <1314050385-9617-3-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:51222 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204Ab1HVVxU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Aug 2011 17:53:20 -0400
Content-Disposition: inline
In-Reply-To: <1314050385-9617-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, vinod.koul@intel.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

On Tue, Aug 23, 2011 at 03:29:44AM +0530, Thomas Abraham wrote:
> With the change in dma channels private data information, the pl330
> channel filter function is modified to look for a simple u8 value
> instead of the now unused 'struct dma_pl330_peri' value.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
>  arch/arm/plat-samsung/dma-ops.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung/dma-ops.c
> index 6e3d9ab..4f1430b 100644
> --- a/arch/arm/plat-samsung/dma-ops.c
> +++ b/arch/arm/plat-samsung/dma-ops.c
> @@ -19,8 +19,8 @@
>  
>  static inline bool pl330_filter(struct dma_chan *chan, void *param)
>  {
> -	struct dma_pl330_peri *peri = chan->private;
> -	return peri->peri_id == (unsigned)param;
> +	u8 *peri_id = chan->private;
> +	return *peri_id == (unsigned)param;
>  }

As a word of warning - this will fail horribly if you have mixed DMA
engines in the system.  While we wait for a better scheme, we really
need to sort out these filter functions properly and stop poking
about in data which may not be what we expect.

One solution to that is to move pl330_filter() into drivers/dma/pl330.c
and have it check chan->device->dev->driver == &pl330_driver.driver
_before_ we start accessing chan->private.

That's not a comment against your patch - you're not really changing
the brokenness of this function.  It would be good to see a follow up
patch fixing it properly though.
