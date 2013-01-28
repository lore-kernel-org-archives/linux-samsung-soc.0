From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] DMA: PL330: Register the DMA controller with the generic DMA helpers
Date: Mon, 28 Jan 2013 14:51:00 +0000
Message-ID: <201301281451.00364.arnd@arndb.de>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <1358508824-20352-3-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:59375 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751580Ab3A1OvQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 09:51:16 -0500
In-Reply-To: <1358508824-20352-3-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Padmavathi Venna <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, jassisinghbrar@gmail.com, kgene.kim@samsung.com, swarren@nvidia.com, boojin.kim@samsung.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, vinod.koul@intel.com

On Friday 18 January 2013, Padmavathi Venna wrote:
> +       pfi = devm_kzalloc(&adev->dev, sizeof(*pfi), GFP_KERNEL);
> +       if (!pfi) {
> +               dev_err(&adev->dev, "unable to allocate mem\n");
> +               return -ENOMEM;
> +       }
> +
> +       pfi->dma_cap = pd->cap_mask;
> +       pfi->filter_fn = pl330_filter;
> +
> +       ret = of_dma_controller_register(adev->dev.of_node,
> +                                        of_dma_pl330_xlate, pfi);

Why do you pass a 'struct of_dma_filter_info' here? I would
expect that you pass the pdmac object as the third argument.

	Arnd
