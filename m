From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: drm/exynos: g2d userptr memory corruption
Date: Mon, 17 Aug 2015 12:26:15 +0200
Message-ID: <1439807175.3050.30.camel@pengutronix.de>
References: <55D08691.3040405@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:40502 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937AbbHQK0R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Aug 2015 06:26:17 -0400
In-Reply-To: <55D08691.3040405@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel@lists.sourceforge.net, Inki Dae <inki.dae@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

Hi Tobias,

Am Sonntag, den 16.08.2015, 14:48 +0200 schrieb Tobias Jakobi:
> Hello,
> 
> some time ago I checked whether I could use the userptr functionality to
> do zero-copy from userspace allocated buffers via the G2D. This didn't
> work out so well, so kinda put this to the bottom of my TODO list.
> 
> Now that IOMMU support has landed and Jan Kara has rewrote page pinning
> using frame vectors (see [1]) I gave userptr another try.
> 
> The results are much better. I'm not experiencing any kernel lockups or
> sysmmu pagefaults anymore. However the image now suffers from visual
> artifacts. These images show the nature of the artifacts:
> http://i.imgur.com/nzT6g3Y.jpg
> http://i.imgur.com/wkuYI6X.jpg
> 
> The corruption always manifests itself in these pixel lines of fixed
> size and wrong color.
> 
> I have written a testcase as part of libdrm for this issue:
> https://github.com/tobiasjakobi/libdrm/commit/db8bf6844436598251f67a71fc334b929bfb2b71
> 
> It allocates N (N an even number) buffers which are aligned to the
> system pagesize. Then it does this each iteration:
> 1) Fill the first N/2 buffers with random data
> 2) Copy the first half to the second half of the buffers
> 3) memcmp() first and second half (verification pass)
> 
> Usually this verification already fails on the first iteration. An
> interesting observation is that increasing (!) the buffer size (so the
> amount of pixels that have to copied per buffer grows) makes this issue
> less likely to happen.
> 
> With the default 512x512 buffers however it happens, like I said above,
> almost immediately.
> 
This is obviously a cache flush missing. The memory you get from
userspace is normal cached memory, so to make it visible to the GPU you
need to flush parts of the cache out to main memory.

The corruption you are seeing is just unflushed cachelines. This also
explains why increasing the buffer size helps: the more memory the CPU
touches the more cachelines will be flushed out to be replaced with new
data.

So you need to go and have a look at dma_map() and dma_sync_*_for_*()
and friends.

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
