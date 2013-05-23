From: =?ks_c_5601-1987?B?wMzBpLyu?= <jays.lee@samsung.com>
Subject: [PATCH] ARM: EXYNOS: fix software reset logic for EXYNOS5440 SOC
Date: Thu, 23 May 2013 21:15:50 +0900
Message-ID: <003001ce57af$435c0340$ca1409c0$%lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52248 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756862Ab3EWMPw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 May 2013 08:15:52 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MN9000HI3EDHS40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 May 2013 21:15:50 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-samsung-soc@vger.kernel.org


This patch fixes software reset logic. Software reset applies only to
powered-on domains in SOC because software reset to all domains causes
reboot failure.

Signed-off-by: Jungseok Lee <jays.lee@samsung.com>
---
 arch/arm/mach-exynos/common.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 7f431dd..a22615d 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -317,9 +317,13 @@ void exynos5_restart(char mode, const char *cmd)
 		val = 0x1;
 		addr = EXYNOS_SWRESET;
 	} else if (of_machine_is_compatible("samsung,exynos5440")) {
+		u32 status;
 		np = of_find_compatible_node(NULL, NULL,
"samsung,exynos5440-clock");
+		addr = of_iomap(np, 0) + 0xbc;
+		status = __raw_readl(addr);
 		addr = of_iomap(np, 0) + 0xcc;
-		val = (0xfff << 20) | (0x1 << 16);
+		val = __raw_readl(addr);
+		val = (val & 0xffff0000) | (status & 0xffff);
 	} else {
 		pr_err("%s: cannot support non-DT\n", __func__);
 		return;
-- 
1.7.10.4
