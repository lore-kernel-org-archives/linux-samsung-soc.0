From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 2/2] ARM: EXYNOS: Enable platform support for I2S controllers
Date: Tue, 06 Nov 2012 10:14:44 +0530
Message-ID: <1352177084-16339-3-git-send-email-padma.v@samsung.com>
References: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48611 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751114Ab2KFEna (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 23:43:30 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD100F3AUE9W7O0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:43:29 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MD100EQOUCMW270@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:43:29 +0900 (KST)
In-reply-to: <1352177084-16339-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org
Cc: sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Add AUXDATA entries for i2s controller driver so as to set the device
name for clock lookups

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index ed37273..93e63ec 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -86,6 +86,12 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos5-hdmi", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-mixer", 0x14450000,
 				"exynos5-mixer", NULL),
+	OF_DEV_AUXDATA("samsung,samsung-i2s", EXYNOS5_PA_I2S0,
+				"samsung-i2s.0", NULL),
+	OF_DEV_AUXDATA("samsung,samsung-i2s", EXYNOS5_PA_I2S1,
+				"samsung-i2s.1", NULL),
+	OF_DEV_AUXDATA("samsung,samsung-i2s", EXYNOS5_PA_I2S2,
+				"samsung-i2s.2", NULL),
 	{},
 };
 
-- 
1.7.4.4
