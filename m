From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2] ARM: exynos_defconfig: Increase CONFIG_BLK_DEV_RAM_SIZE to
 64MiB
Date: Mon, 19 Oct 2015 17:29:39 +0530
Message-ID: <1445255979-22217-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43928 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752842AbbJSMJE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 08:09:04 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NWG03008V33I140@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Oct 2015 21:09:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, linux-arm-kernel@lists.infradead.org

CONFIG_BLK_DEV_RAM_SIZE is currently set to 8MiB, which is a bit on the
smaller side, lets bump it up to 64MiB so that a bigger RAM_DISK can
be used with defconfig.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/configs/exynos_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa2e183..fa5dfa92d294 100644
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
