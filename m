From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3] dmaengine: s3c24xx: Add dma_slave_map for s3c2440
 devices
Date: Mon, 26 Sep 2016 23:13:35 +0530
Message-ID: <20160926174335.GG2467@localhost>
References: <1474570275-7238-1-git-send-email-sam.van.den.berge@telenet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:55727 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1034469AbcIZRfO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2016 13:35:14 -0400
Content-Disposition: inline
In-Reply-To: <1474570275-7238-1-git-send-email-sam.van.den.berge@telenet.be>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sam Van Den Berge <sam.van.den.berge@telenet.be>
Cc: dmaengine@vger.kernel.org, k.kozlowski@samsung.com, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 22, 2016 at 08:51:15PM +0200, Sam Van Den Berge wrote:
> This patch updates the s3c24xx dma driver to be able to pass a
> dma_slave_map array via the platform data. This is needed to
> be able to use the new, simpler dmaengine API [1].
> I used the virtual DMA channels as a parameter for the dma_filter
> function. By doing that, I could reuse the existing filter function in
> drivers/dma/s3c24xx-dma.c.
> 
> I have tested this on my mini2440 board with the audio driver.
> According to my observations, dma_request_slave_channel in the
> function dmaengine_pcm_new in the file
> sound/soc/soc-generic-dmaengine-pcm.c now returns a valid DMA channel
> whereas before no DMA channel was returned at that point.
> 
> Entries for DMACH_XD0, DMACH_XD1 and DMACH_TIMER are missing because I
> don't realy know which driver to use for these.

Applied, thanks

-- 
~Vinod
