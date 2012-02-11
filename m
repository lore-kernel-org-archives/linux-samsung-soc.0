From: Huisung Kang <hs1218.kang@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Fixup prevent bug related to 'Unchecked return
 value'
Date: Sat, 11 Feb 2012 16:01:46 +0900
Message-ID: <018e01cce88b$0501bd40$0f0537c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31861 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752486Ab2BKHBs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Feb 2012 02:01:48 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ700E01VIUETC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 16:01:47 +0900 (KST)
Received: from NOHS1218KAN01 ([12.23.118.150])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ700EOSVIYZA30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 11 Feb 2012 16:01:46 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com


[prevent bug]
In s5p_pmu_init(): Value returned from a function is not checked for
erros before being used.

Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
---
 arch/arm/plat-samsung/devs.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 3e38dc4..3e6e1f2 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -1092,7 +1092,14 @@ struct platform_device s5p_device_pmu = {
 
 static int __init s5p_pmu_init(void)
 {
-	platform_device_register(&s5p_device_pmu);
+	int ret;
+
+	ret = platform_device_register(&s5p_device_pmu);
+	if (ret) {
+		pr_warning("s5p_pmu_init: pmu device not registered.\n");
+		return ret;
+	}
+
 	return 0;
 }
 arch_initcall(s5p_pmu_init);
-- 
1.7.1
