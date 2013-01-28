From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] DMA: PL330: Add xlate function
Date: Mon, 28 Jan 2013 14:58:15 +0000
Message-ID: <201301281458.15219.arnd@arndb.de>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <1358508824-20352-2-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:60870 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750760Ab3A1O6Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 09:58:24 -0500
In-Reply-To: <1358508824-20352-2-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Padmavathi Venna <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, swarren@nvidia.com, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com

On Friday 18 January 2013, Padmavathi Venna wrote:
> +struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
> +                                               struct of_dma *ofdma)
> +{
> +       int count = dma_spec->args_count;
> +       struct of_dma_filter_info *info = ofdma->of_dma_data;
> +
> +       if (!info || !info->filter_fn)
> +               return NULL;
> +
> +       if (count != 1)
> +               return NULL;
> +
> +       return dma_request_channel(info->dma_cap, info->filter_fn, dma_spec);
> +}
> +EXPORT_SYMBOL_GPL(of_dma_pl330_xlate);

It seems a little sad that we still have to use dma_request_channel()
to implement this, when that function will go off searching all channels
and pass them tino the filter, which then has to look for the device node
and match it with each channel. We already know the controller and should
just be able to get a channel for it, although I don't exactly know how
that is done.

Further, your function is almost identical to the of_dma_simple_xlate
function. Can't you use that one instead?

	Arnd
