From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 4/7] v4l: videobuf2: add IOMMU based DMA memory
	allocator
Date: Tue, 19 Apr 2011 10:21:35 +0100
Message-ID: <20110419092135.GD22799@n2100.arm.linux.org.uk>
References: <1303118804-5575-1-git-send-email-m.szyprowski@samsung.com> <1303118804-5575-5-git-send-email-m.szyprowski@samsung.com> <201104181615.49009.arnd@arndb.de> <00ea01cbfe70$860ca900$9225fb00$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:54286 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921Ab1DSJVw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Apr 2011 05:21:52 -0400
Content-Disposition: inline
In-Reply-To: <00ea01cbfe70$860ca900$9225fb00$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

On Tue, Apr 19, 2011 at 11:02:34AM +0200, Marek Szyprowski wrote:
> On Monday, April 18, 2011 4:16 PM Arnd Bergmann wrote:
> > My feeling is that this is not the right abstraction. Why can't you
> > just implement the regular dma-mapping.h interfaces for your IOMMU
> > so that the videobuf code can use the existing allocators?
> 
> I'm not really sure which existing videobuf2 allocators might transparently
> support IOMMU interface yet
> 
> Do you think that all iommu operations can be hidden behind dma_map_single 
> and dma_unmap_single?

That is one of the intentions of the DMA API.
