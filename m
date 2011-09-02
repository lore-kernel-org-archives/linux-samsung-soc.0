From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH] ARM: S5P64X0: Fix mask value for S5P64X0 CPU IDs
Date: Fri, 02 Sep 2011 19:32:21 +0530
Message-ID: <1314972141-14387-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35270 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752413Ab1IBOBO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Sep 2011 10:01:14 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQW00MTBEY0Z820@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Sep 2011 23:01:12 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQW000X8EXWLP@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 02 Sep 2011 23:01:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Ajay Kumar <ajaykumar.rs@samsung.com>

The current value for S5P64XX_CPU_MASK does not include the necessary
bits, which causes detection failure.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/plat-samsung/include/plat/cpu.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index aa1f69b..897d161 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -30,7 +30,7 @@ extern unsigned long samsung_cpu_id;
 
 #define S5P6440_CPU_ID		0x56440000
 #define S5P6450_CPU_ID		0x36450000
-#define S5P64XX_CPU_MASK	0x1FF40000
+#define S5P64XX_CPU_MASK	0x7FFF0000
 
 #define S5PC100_CPU_ID		0x43100000
 #define S5PC100_CPU_MASK	0xFFFFF000
-- 
1.7.2.3
