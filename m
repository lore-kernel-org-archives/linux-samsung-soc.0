From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] ARM: S5PV310: Add support for System MMU on SMDKV310
Date: Tue, 25 Jan 2011 11:25:45 +0530
Message-ID: <1295934945-29283-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:26943 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751025Ab1AYF4t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Jan 2011 00:56:49 -0500
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LFK005WZDUNQI10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jan 2011 14:56:47 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LFK00697DUC6B@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 25 Jan 2011 14:56:47 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com

This patch enables System MMU support on SMDKV310.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s5pv310/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
index 09c4c21..b2a9acc 100644
--- a/arch/arm/mach-s5pv310/Kconfig
+++ b/arch/arm/mach-s5pv310/Kconfig
@@ -122,6 +122,7 @@ config MACH_SMDKV310
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
 	select S5PV310_DEV_PD
+	select S5PV310_DEV_SYSMMU
 	select S5PV310_SETUP_I2C1
 	select S5PV310_SETUP_SDHCI
 	help
-- 
1.7.1
