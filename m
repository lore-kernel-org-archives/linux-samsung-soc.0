From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [RESEND 2/4] onenand:samsung OneNAND chip probe functions added for
 GONI and Exynos4210
Date: Mon, 05 Mar 2012 17:41:29 +0100
Message-ID: <1330965691-10301-3-git-send-email-l.majewski@samsung.com>
References: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
 <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22343 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754235Ab2CEQli (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Mar 2012 11:41:38 -0500
Received: from euspt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0F00K5S7PBZ210@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0F00IW97PBC7@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:35 +0000 (GMT)
In-reply-to: <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Scott Wood <scottwood@freescale.com>, Minkyu Kang <mk7.kang@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Separate callback for probing OneNAND memory chip.

Tested at:
       Samsung S5PC110 GONI
       Samsung Exynos4210 (S5PC210 Universal)

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Minkyu Kang <mk7.kang@samsung.com>
---
 board/samsung/goni/onenand.c           |    1 +
 board/samsung/universal_c210/onenand.c |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/board/samsung/goni/onenand.c b/board/samsung/goni/onenand.c
index 8d3769b..9dd80fa 100644
--- a/board/samsung/goni/onenand.c
+++ b/board/samsung/goni/onenand.c
@@ -33,4 +33,5 @@ void onenand_board_init(struct mtd_info *mtd)
 
 	this->base = (void *)CONFIG_SYS_ONENAND_BASE;
 	this->options |= ONENAND_RUNTIME_BADBLOCK_CHECK;
+	this->chip_probe = s5pc110_chip_probe;
 }
diff --git a/board/samsung/universal_c210/onenand.c b/board/samsung/universal_c210/onenand.c
index 20e1dc5..5b92308 100644
--- a/board/samsung/universal_c210/onenand.c
+++ b/board/samsung/universal_c210/onenand.c
@@ -24,6 +24,7 @@
 #include <common.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/onenand.h>
+#include <linux/mtd/samsung_onenand.h>
 
 void onenand_board_init(struct mtd_info *mtd)
 {
@@ -31,4 +32,5 @@ void onenand_board_init(struct mtd_info *mtd)
 
 	this->base = (void *)CONFIG_SYS_ONENAND_BASE;
 	this->options |= ONENAND_RUNTIME_BADBLOCK_CHECK;
+	this->chip_probe = s5pc210_chip_probe;
 }
-- 
1.7.2.3
