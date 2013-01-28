From: Jon Hunter <jon-hunter@ti.com>
Subject: Re: [PATCH 2/4] DMA: PL330: Register the DMA controller with the
 generic DMA helpers
Date: Mon, 28 Jan 2013 11:54:36 -0600
Message-ID: <5106BB5C.1010302@ti.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <1358508824-20352-3-git-send-email-padma.v@samsung.com> <201301281451.00364.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:34513 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757655Ab3A1Ryx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 12:54:53 -0500
In-Reply-To: <201301281451.00364.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: devicetree-discuss@lists.ozlabs.org, boojin.kim@samsung.com, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, swarren@nvidia.com, Padmavathi Venna <padma.v@samsung.com>, sbkim73@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, kgene.kim@samsung.com, broonie@opensource.wolfsonmicro.com


On 01/28/2013 08:51 AM, Arnd Bergmann wrote:
> On Friday 18 January 2013, Padmavathi Venna wrote:
>> +       pfi = devm_kzalloc(&adev->dev, sizeof(*pfi), GFP_KERNEL);
>> +       if (!pfi) {
>> +               dev_err(&adev->dev, "unable to allocate mem\n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       pfi->dma_cap = pd->cap_mask;
>> +       pfi->filter_fn = pl330_filter;
>> +
>> +       ret = of_dma_controller_register(adev->dev.of_node,
>> +                                        of_dma_pl330_xlate, pfi);
> 
> Why do you pass a 'struct of_dma_filter_info' here? I would
> expect that you pass the pdmac object as the third argument.

I believe it is because that is the data that the xlate function is
using. Are you suggesting the data should be stored in the pdmac object
and extracted from there? That could be done too given that this
controller has its own xlate.

Cheers
Jon
