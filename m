From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH] Revert "drm/exynos: IOMMU support should not be selectable by user"
Date: Tue, 17 Feb 2015 16:58:14 +0000
Message-ID: <1424192294-16897-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:46627 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751548AbbBQRAa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Feb 2015 12:00:30 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com, m.szyprowski@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This reverts commit 8dcc14f82f06fce997e35f4c77ced9d4ed192f31.

This patch causes this error on Arndale:

[    1.643800] kernel BUG at drivers/iommu/exynos-iommu.c:481!
[    1.649355] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
[    1.655170] Modules linked in:
[    1.658203] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
3.19.0-07543-g3ec3f38 #1904
[    1.665683] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    1.671750] task: ee0f4000 ti: ee0f2000 task.ti: ee0f2000
[    1.677138] PC is at __exynos_sysmmu_enable+0x190/0x19c
[    1.682341] LR is at exynos_iommu_attach_device+0x54/0xc0

I am afraid I am not very familiar with either IOMMU or DRM, so
apologies if I am missing anything and fixing the underlying problem in
exynos-iommu.c is beyond my knowledge.

That said this appears to be related to the the fact archdata.iommu is
never set to anything in drivers/iommu/exynos-iommu.c.  It looks to me
like the exynos-iommu driver is broken as nothing initialises the
exynos_iommu_owner structure, this doesn't look to be the result of
recent changes either so I assume it has been broken for some time. If I
had to guess I would suggest this driver works in some out of tree
implementation, but not in mainline. Simplest solution seems
to be to revert this patch such that the IOMMU driver is not built in
on Arndale until it is fixed.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 drivers/gpu/drm/exynos/Kconfig |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index a5e7461..3fe02ca 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -12,9 +12,10 @@ config DRM_EXYNOS
 	  If M is selected the module will be called exynosdrm.
 
 config DRM_EXYNOS_IOMMU
-	bool
+	bool "EXYNOS DRM IOMMU Support"
 	depends on DRM_EXYNOS && EXYNOS_IOMMU && ARM_DMA_USE_IOMMU
-	default y
+	help
+	  Choose this option if you want to use IOMMU feature for DRM.
 
 config DRM_EXYNOS_FIMD
 	bool "Exynos DRM FIMD"
-- 
1.7.2.5
