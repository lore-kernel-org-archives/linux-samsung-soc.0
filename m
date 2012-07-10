From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung devel-dma ops for v3.6
Date: Tue, 10 Jul 2012 12:42:41 +0000
Message-ID: <201207101242.41867.arnd@arndb.de>
References: <0c5001cd5e41$87daa1b0$978fe510$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:62372 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752144Ab2GJMmt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jul 2012 08:42:49 -0400
In-Reply-To: <0c5001cd5e41$87daa1b0$978fe510$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, w.sang@pengutronix.de, Boojin Kim <boojin.kim@samsung.com>, Kyoungil Kim <ki0351.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Ben Dooks <ben@simtec.co.uk>

On Tuesday 10 July 2012, Kukjin Kim wrote:
> Hi Arnd, Olof,
> 
> Here is updating DMA common operation for Samsung SoCs.
> 
> Since some DMA client driver such as spi needs to change the configuration
> after dma_request() so this branch adds dma_config() can configure DMA
> transmit option which is included in dma_request() after that.
> 
> Note, according to the changes, needs to update spi and ASoC drivers for
> Samsung SoCs and only got the ack from Mark Brown not Grant Likely and as I
> know, he is busy for moving. But I think, the spi change has no problem and
> it is simple.
> 
> If any problems, please kindly let me know.

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next/devel-dma-ops

I've applied this to a new next/dma branch for now, as it sounds that you
need these changes.

However, my feeling is that the s3c-dma-ops support is moving in the wrong
direction, or at least I do not see where you're heading with it.

>From what I see, there is the 

* arch/arm/plat-s3c24xx/dma.c driver with a proprietary s3c2410_dma_*
  interface, used by s3cmci and some asoc drivers.
* arch/arm/mach-s3c64xx/dma.c implementing the same interface and exporting
  the same symbols.
* The arch/arm/plat-samsung/dma-ops.c which is a wrapper around the generic
  dmaengine API, hardcoding the pl330 DMA driver
* The arch/arm/plat-samsung/include/plat/dma-ops.h interface abstraction
  that gets used to pick between the two at compile time, and being used by
  the spi driver and again other asoc drivers

Can you (or someone on the Cc list) explain what the plan is for this?
Are you moving over the s3c2410_dma*() function to a dmaengine driver
eventually? Do you expect to see more users of the nonstandard intefaces
in the samsung code, or are they going away?

	Arnd
