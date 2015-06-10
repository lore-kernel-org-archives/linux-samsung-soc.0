From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH v10 00/17] drm/exynos: atomic modesetting support
Date: Wed, 10 Jun 2015 10:36:44 -0300
Message-ID: <20150610133644.GC13493@joana>
References: <1433171095-23773-1-git-send-email-gustavo@padovan.org>
 <55780B62.1060005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:51094 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753877AbbFJNgv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 09:36:51 -0400
Content-Disposition: inline
In-Reply-To: <55780B62.1060005@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Andrzej Hajda <a.hajda@samsung.com>

Hi Marek,

2015-06-10 Marek Szyprowski <m.szyprowski@samsung.com>:

> Hello,
> 
> On 2015-06-01 17:04, Gustavo Padovan wrote:
> >From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> >Hi,
> >
> >Here goes the full support for atomic modesetting on exynos. I've
> >split the patches in the various phases of atomic support.
> 
> Thanks for this patchses, however I've noticed a problem after applying
> them.
> The issue gets revealed when support for IOMMU is enabled. I've did my tests
> with Exynos HDMI driver on Odroid U3 board.
> 
> To demonstrated the issue I've added following additional debug in the
> exynos
> mixer driver in mixer_graph_buffer() function:
> pr_info("dma addr %pad plane->src_width %d plane->src_height %d\n",
> &plane->dma_addr[0], plane->src_width, plane->src_height);
> 
> Before applying patches setting 640x480 mode and getting back to 1920x1080
> console generates following log:
> 
> # modetest -M exynos -s 23:640x480
> setting mode 640x480-60Hz@XR24 on connectors 23, crtc 21
> [ 3860.617151] dma 0xbc500000 plane->src_width 640 plane->src_height 480
> ^C
> [ 3870.555232] dma 0xbbd00000 plane->src_width 1920 plane->src_height 1080
> [ 3870.565696] dma 0xbbd00000 plane->src_width 1920 plane->src_height 1080
> 
> After applying atomic modesetting patchset:
> # modetest -M exynos -s 24:640x480
> [  142.540122] dma 0xbbd00000 plane->src_width 1920 plane->src_height 1080
> [  142.550726] dma 0xbbd00000 plane->src_width 1920 plane->src_height 1080
> setting mode 640x480-60Hz@XR24 on connectors 24, crtc 22
> [  142.643672] dma 0xbc500000 plane->src_width 1920 plane->src_height 1080
> [  142.759982] dma 0xbc500000 plane->src_width 640 plane->src_height 480
> ^C
> [  154.986040] dma 0xbbd00000 plane->src_width 1920 plane->src_height 1080
> 
> As you can see from the above log, mixer_graph_buffer function is called
> several times. 0xbbd00000 is the DMA address of the 1920x1080 framebuffer
> and 0xbc500000 is the DMA address of the allocated 640x480 buffer.
> mixer_graph_buffer() is first called with the new DMA address of the
> framebuffer, but with the old mode parameters (1920x1080 size) and then
> in the next call it updates the plane parameters to the correct values
> (size changed to 640x480). When IOMMU is not used, this can be easily
> missed, but after enabling IOMMU support, any DMA access to unallocated
> address causes IOMMU PAGE FAULT. Here it will happen after changing DMA
> address of the buffer without changing the size.
> 
> A quick workaround to resolve this multiple calls to mixer_graph_buffer()
> with partially updated mode values is to remove calls to
> mixer_window_suspend/mixer_window_resume from mixer_disable and
> mixer_disable functions, but I expect that this is not the right
> approach.
> 
> Probably the same problem can be observed with Exynos FIMD driver.
> 
> Gustavo: could you check if mixer_enable functions should really
> call mixer_window_resume function, which in turn calls mixer_win_commit,
> which calls mixer_graph_buffer with partially updated display buffer
> data?

It should not, you are right. This is actually the correct fix. Atomic
modesetting should not do chained calls, e.g., crtc_disable calling
plane_disable. This change was already in my plan actually, but as I had
IOMMU disabled I didn't see it here, and I didn't create this patch yet.

	Gustavo
