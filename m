From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [RFC PATCH] ARM: exynos_defconfig: Increase CONFIG_BLK_DEV_RAM_SIZE to
 64K
Date: Mon, 19 Oct 2015 16:18:35 +0530
Message-ID: <1445251715-9725-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58776 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753385AbbJSK6H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 06:58:07 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWG004XXRSTVQ70@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Oct 2015 19:58:05 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, linux-arm-kernel@lists.infradead.org

CONFIG_BLK_DEV_RAM_SIZE is currently set to 8K, which is a bit on the
smaller side, lets bump it up to 64K so that a bigger RAM_DISK can
be used with defconfig.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
Every time I build exynos_defconfig, I need to manually change RAM_SIZE
to match my ramdisk image size. I am not sure what is the best ramdisk size
might be, but bumping it to 64K might be a reasonable one.

 arch/arm/configs/exynos_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 3349713e6c63..e692aaa2cb8c 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -52,7 +52,7 @@ CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_CRYPTOLOOP=y
 CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
+CONFIG_BLK_DEV_RAM_SIZE=65536
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
-- 
1.7.10.4
