From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] Add generic DMA DT binding support
Date: Mon, 28 Jan 2013 15:16:00 +0000
Message-ID: <201301281516.00498.arnd@arndb.de>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com> <20130128134305.GU26562@intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:51347 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751165Ab3A1PQL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 10:16:11 -0500
In-Reply-To: <20130128134305.GU26562@intel.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org

On Monday 28 January 2013, Vinod Koul wrote:
> On Fri, Jan 18, 2013 at 05:03:40PM +0530, Padmavathi Venna wrote:
> > This patch set adds support for generic dma device tree bindings for
> > Samsung platforms and is dependent on the following patches from
> > Vinod Koul next branch
> > 1)of: Add generic device tree DMA helpers
> > 2)dmaengine: add helper function to request a slave DMA channel
> Changes look fairly decent. I need somone with better knowldge of DT to akc this
> before this is applied. Arnd...?

Thanks for the pointer, it seems everthing is coming together today ;-)

The binding looks good, aside from the wording on some of the properties
in there that could be a little clearer.

The method of calling dma_request_channel() from the xlate() function
is a little bit clumsy IMHO, but it does work and is the easiest way
to retrofit generic DT support to this driver, given that it already
provides a global filter function. It's also apparently what Jon had
in mind, and what Matt is doing on AM33XX.

I'll probably propose something similar on dw_dma, since I was just
(this hour, actually) looking at the same problem there. I believe
you had something smarter in mind when we discussed it in San Diego,
but I don't remember what the idea was.  I would need something
like

	struct dma_chan *dma_channel_get(struct dma_device *);

and I assume that there is a reason for why I can't call this
from the xlate() function but instead have to go through
dma_request_channel(), but I don't completely understand that part
of the puzzle.

	Arnd
