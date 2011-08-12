From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/2] ARM: S5PV210: Fix build warning
Date: Fri, 12 Aug 2011 15:56:13 +0530
Message-ID: <1313144774-30607-2-git-send-email-a.kesavan@samsung.com>
References: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17835 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753041Ab1HLKZT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 06:25:19 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPT002J48Y4MVS0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:18 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.92])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPT00BTU8Y1SP@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 19:25:18 +0900 (KST)
In-reply-to: <1313144774-30607-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

Fixed the following warning for S5PV210.

arch/arm/mach-s5pv210/pm.c: In function 's5pv210_pm_add':
arch/arm/mach-s5pv210/pm.c:139: warning: assignment from incompatible
pointer type

Also, staticized the function.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/mach-s5pv210/pm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/pm.c b/arch/arm/mach-s5pv210/pm.c
index 309e388..f149d27 100644
--- a/arch/arm/mach-s5pv210/pm.c
+++ b/arch/arm/mach-s5pv210/pm.c
@@ -88,7 +88,7 @@ static struct sleep_save s5pv210_core_save[] = {
 	SAVE_ITEM(S3C2410_TCNTO(0)),
 };
 
-void s5pv210_cpu_suspend(unsigned long arg)
+static int s5pv210_cpu_suspend(unsigned long arg)
 {
 	unsigned long tmp;
 
-- 
1.7.4.1
