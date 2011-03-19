From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH 6/6] ARM: Remove clkdev.o build in arch/arm/common/Makefile
Date: Sat, 19 Mar 2011 13:20:19 +0530
Message-ID: <1300521019-13612-7-git-send-email-thomas.ab@samsung.com>
References: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:11495 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754185Ab1CSHwE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Mar 2011 03:52:04 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LIA001G9OIRMO60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:52:03 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LIA00APIOIIEL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 19 Mar 2011 16:52:03 +0900 (KST)
In-reply-to: <1300521019-13612-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

clkdev.c is moved to drivers/clk. So build for clkdev.o can
be removed from arch/arm/common/Makefile.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/common/Makefile |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/arm/common/Makefile b/arch/arm/common/Makefile
index e7521bc..6ea9b6f 100644
--- a/arch/arm/common/Makefile
+++ b/arch/arm/common/Makefile
@@ -16,5 +16,4 @@ obj-$(CONFIG_SHARP_SCOOP)	+= scoop.o
 obj-$(CONFIG_ARCH_IXP2000)	+= uengine.o
 obj-$(CONFIG_ARCH_IXP23XX)	+= uengine.o
 obj-$(CONFIG_PCI_HOST_ITE8152)  += it8152.o
-obj-$(CONFIG_COMMON_CLKDEV)	+= clkdev.o
 obj-$(CONFIG_ARM_TIMER_SP804)	+= timer-sp.o
-- 
1.6.6.rc2
