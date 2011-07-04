From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Mon, 4 Jul 2011 09:56:29 -0700
Message-ID: <20110704165625.GB28726@opensource.wolfsonmicro.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
 <1309781915-31549-7-git-send-email-kgene.kim@samsung.com>
 <20110704164251.GC28042@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:58005 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757393Ab1GDQ4l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 12:56:41 -0400
Content-Disposition: inline
In-Reply-To: <20110704164251.GC28042@ponder.secretlab.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Boojin Kim <boojin.kim@samsung.com>

On Mon, Jul 04, 2011 at 10:42:51AM -0600, Grant Likely wrote:

> Wow.  A lot of #ifdefs here.  It does not look multiplatform friendly
> at all.  Are the s3c2410_dma functions obsolete when DMADEV_PL330 is
> selected?  If so, can they be removed entirely, or are they required
> to support certain hardware?

My question was going to be if we should split this up into two
different drivers for pretty much these reasons.
