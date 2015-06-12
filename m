From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: fimd: fix page fault issue with iommu
Date: Fri, 12 Jun 2015 22:35:17 +0900
Message-ID: <1434116117-8897-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54985 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752818AbbFLNfU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 09:35:20 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NPU02WD532USE80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Jun 2015 22:35:18 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch resolves page fault issue with iommu and atomic feature
when modetest test application is terminated.

ENWIN_F field of WINCONx register enables or disable a dma channel to
each hardware overlay - the value of the field will be updated to real
register after vsync.

So this patch makes sure the dma channel is disabled by waiting for vsync
one time after clearing shadow registers to all dma channels.

Below shows the page fault issue:
setting mode 720x1280-60Hz@XR24 on connectors 31, crtc 29
freq: 59.99Hz

[   34.831025] PAGE FAULT occurred at 0x20400000 by 11e20000.sysmmu(Page
		table base: 0x6e324000)
[   34.838072]  Lv1 entry: 0x6e92dc01
[   34.841489] ------------[ cut here ]------------
[   34.846058] kernel BUG at drivers/iommu/exynos-iommu.c:364!
[   34.851614] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[   34.857428] Modules linked in:
<--snip-->
[   35.210894] [<c02880d0>] (exynos_sysmmu_irq) from [<c00608f8>]
(handle_irq_event_percpu+0x78/0x134)
[   35.219914] [<c00608f8>] (handle_irq_event_percpu) from [<c00609f0>]
(handle_irq_event+0x3c/0x5c)
[   35.228768] [<c00609f0>] (handle_irq_event) from [<c0063698>]
(handle_level_irq+0xc4/0x13c)
[   35.237101] [<c0063698>] (handle_level_irq) from [<c005ff7c>]
(generic_handle_irq+0x2c/0x3c)
[   35.245521] [<c005ff7c>] (generic_handle_irq) from [<c02214ec>]
(combiner_handle_cascade_irq+0x94/0x100)
[   35.254980] [<c02214ec>] (combiner_handle_cascade_irq) from
[<c005ff7c>] (generic_handle_irq+0x2c/0x3c)
[   35.264353] [<c005ff7c>] (generic_handle_irq) from [<c0060248>]
(__handle_domain_irq+0x7c/0xec)
[   35.273034] [<c0060248>] (__handle_domain_irq) from [<c0009434>]
(gic_handle_irq+0x30/0x68)
[   35.281366] [<c0009434>] (gic_handle_irq) from [<c0012ec0>]
(__irq_svc+0x40/0x74)

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index fda62da..4bac303 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -813,6 +813,10 @@ static void fimd_disable(struct exynos_drm_crtc *crtc)
 	for (i = 0; i < WINDOWS_NR; i++)
 		fimd_win_disable(crtc, i);
 
+	fimd_enable_vblank(crtc);
+	fimd_wait_for_vblank(crtc);
+	fimd_disable_vblank(crtc);
+
 	writel(0, ctx->regs + VIDCON0);
 
 	clk_disable_unprepare(ctx->lcd_clk);
-- 
1.7.9.5
