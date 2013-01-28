From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] DMA: PL330: Register the DMA controller with the generic DMA helpers
Date: Mon, 28 Jan 2013 18:01:13 +0000
Message-ID: <201301281801.13865.arnd@arndb.de>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <201301281451.00364.arnd@arndb.de> <5106BB5C.1010302@ti.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:59651 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757339Ab3A1SB1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 13:01:27 -0500
In-Reply-To: <5106BB5C.1010302@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jon Hunter <jon-hunter@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, swarren@nvidia.com, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com

On Monday 28 January 2013, Jon Hunter wrote:
> On 01/28/2013 08:51 AM, Arnd Bergmann wrote:
> > On Friday 18 January 2013, Padmavathi Venna wrote:
> >> +       pfi = devm_kzalloc(&adev->dev, sizeof(*pfi), GFP_KERNEL);
> >> +       if (!pfi) {
> >> +               dev_err(&adev->dev, "unable to allocate mem\n");
> >> +               return -ENOMEM;
> >> +       }
> >> +
> >> +       pfi->dma_cap = pd->cap_mask;
> >> +       pfi->filter_fn = pl330_filter;
> >> +
> >> +       ret = of_dma_controller_register(adev->dev.of_node,
> >> +                                        of_dma_pl330_xlate, pfi);
> > 
> > Why do you pass a 'struct of_dma_filter_info' here? I would
> > expect that you pass the pdmac object as the third argument.
> 
> I believe it is because that is the data that the xlate function is
> using. Are you suggesting the data should be stored in the pdmac object
> and extracted from there? That could be done too given that this
> controller has its own xlate.

It just seems weird that we are passing a constant cap_mask in
a data structure, and that we need our own filter function still,
but don't pass the pointer to the data structure that we actually
need in the filter function (the dma_device *).

	Arnd
