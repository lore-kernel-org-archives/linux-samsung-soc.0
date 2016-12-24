From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dmaengine: pl330: Fix runtime PM support for terminated
 transfers
Date: Sat, 24 Dec 2016 13:13:18 +0200
Message-ID: <20161224111318.GA8343@kozik-lap>
References: <1481884751-21411-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161223023344epcas2p19d61e2e9749b2a5d2a910bef89a08616@epcas2p1.samsung.com>
 <20161223023324.GA3860@kozik-lap>
 <6b2f2e51-3fac-02d7-5827-b08b97c894c0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34427 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753130AbcLXLN0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Dec 2016 06:13:26 -0500
Content-Disposition: inline
In-Reply-To: <6b2f2e51-3fac-02d7-5827-b08b97c894c0@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Vinod Koul <vinod.koul@intel.com>

On Fri, Dec 23, 2016 at 10:52:28AM +0100, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> 
> On 2016-12-23 03:33, Krzysztof Kozlowski wrote:
> >On Fri, Dec 16, 2016 at 11:39:11AM +0100, Marek Szyprowski wrote:
> >>PL330 DMA engine driver is leaking a runtime reference after any terminated
> >>DMA transactions. This patch fixes this issue by tracking runtime PM state
> >>of the device and making additional call to pm_runtime_put() in terminate_all
> >>callback if needed.
> >>
> >>Fixes: ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
> >>Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>---
> >>  drivers/dma/pl330.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >>diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> >>index 030fe05ed43b..9f3dbc8c63d2 100644
> >>--- a/drivers/dma/pl330.c
> >>+++ b/drivers/dma/pl330.c
> >>@@ -448,6 +448,9 @@ struct dma_pl330_chan {
> >>  	/* for cyclic capability */
> >>  	bool cyclic;
> >>+
> >>+	/* for runtime pm tracking */
> >>+	bool active;
> >>  };
> >>  struct pl330_dmac {
> >>@@ -2031,6 +2034,7 @@ static void pl330_tasklet(unsigned long data)
> >>  		_stop(pch->thread);
> >>  		spin_unlock(&pch->thread->dmac->lock);
> >>  		power_down = true;
> >>+		pch->active = false;
> >>  	} else {
> >>  		/* Make sure the PL330 Channel thread is active */
> >>  		spin_lock(&pch->thread->dmac->lock);
> >>@@ -2050,6 +2054,7 @@ static void pl330_tasklet(unsigned long data)
> >>  			desc->status = PREP;
> >>  			list_move_tail(&desc->node, &pch->work_list);
> >>  			if (power_down) {
> >>+				pch->active = true;
> >It's been a while since I was playign with the driver so I don't
> >remember everything... but I can't get the logic behind this.
> >
> >The device is marked as inactive and scheduled to power down. But you
> >mark chanel as active.
> 
> Please look 3 lines further. The channel is started again (because this
> is cyclic request), so setting active to true is justified. Even power_down
> is then set to false.

Ahhh, damn the missing context. I looked at full source and it makes
sense now.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
