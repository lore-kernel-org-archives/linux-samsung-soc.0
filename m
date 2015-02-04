From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 1/2] drm/exynos: fix DMA_ATTR_NO_KERNEL_MAPPING usage
Date: Wed, 4 Feb 2015 10:29:53 +0000
Message-ID: <20150204102953.GD8656@n2100.arm.linux.org.uk>
References: <1423041800-27859-1-git-send-email-carlo@caione.org>
 <1423041800-27859-2-git-send-email-carlo@caione.org>
 <54D1F263.4000006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:47448 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932682AbbBDKaM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Feb 2015 05:30:12 -0500
Content-Disposition: inline
In-Reply-To: <54D1F263.4000006@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, jstpierre@mecheye.net, drake@endlessm.com, robdclark@gmail.com, inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com, kgene@kernel.org, jy0922.shim@samsung.com, lauraa@codeaurora.org

On Wed, Feb 04, 2015 at 11:20:19AM +0100, Marek Szyprowski wrote:
> >diff --git a/drivers/gpu/drm/exynos/exynos_drm_buf.c b/drivers/gpu/drm/exynos/exynos_drm_buf.c
> >index 9c80884..24994ba 100644
> >--- a/drivers/gpu/drm/exynos/exynos_drm_buf.c
> >+++ b/drivers/gpu/drm/exynos/exynos_drm_buf.c
> >@@ -63,11 +63,11 @@ static int lowlevel_buffer_allocate(struct drm_device *dev,
> >  			return -ENOMEM;
> >  		}
> >-		buf->kvaddr = (void __iomem *)dma_alloc_attrs(dev->dev,
> >+		buf->cookie = dma_alloc_attrs(dev->dev,
> >  					buf->size,
> >  					&buf->dma_addr, GFP_KERNEL,
> >  					&buf->dma_attrs);
> >-		if (!buf->kvaddr) {
> >+		if (!buf->cookie) {
> >  			DRM_ERROR("failed to allocate buffer.\n");
> >  			ret = -ENOMEM;
> >  			goto err_free;

I wonder whether anyone has looked at what exynos is doing with this.

                start_addr = buf->dma_addr;
                while (i < nr_pages) {
                        buf->pages[i] = phys_to_page(start_addr);
                        start_addr += PAGE_SIZE;
                        i++;
                }

There is no guarantee that DMA addresses are the same as physical addresses
in the kernel, so this is a layering violation.  If you want to do this,
then a better way to do this on ARM would be:

			buf->pages[i] = pfn_to_page(dma_to_pfn(dev, start_addr));

The difference here is that dma_to_pfn() knows how to convert a dma_addr_t
to a PFN which can then be converted to a struct page (provided it is
backed by kernel managed system memory.)

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
