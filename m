From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V6 10/10] dmaengine: Fix compilation error in non-DT
 case
Date: Mon, 28 Jan 2013 05:47:26 -0800
Message-ID: <20130128134726.GV26562@intel.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
 <1358509629-20471-11-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:3000 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756805Ab3A1OMm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 09:12:42 -0500
Content-Disposition: inline
In-Reply-To: <1358509629-20471-11-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

On Fri, Jan 18, 2013 at 05:17:09PM +0530, Padmavathi Venna wrote:
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  include/linux/dmaengine.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 8cd0e25..c88f302 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -992,7 +992,7 @@ static inline struct dma_chan *__dma_request_channel(dma_cap_mask_t *mask,
>  static inline struct dma_chan *dma_request_slave_channel(struct device *dev,
>  							 char *name)
>  {
> -	return NULL
> +	return NULL;
what tree was this generated against? this was fixed by 678bd8

--
~Vinod
