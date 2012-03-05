From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [RESEND 4/4] onenand: samsung: Enable support OneNAND support at
 Samsung's Exynos4210
Date: Mon, 05 Mar 2012 17:41:31 +0100
Message-ID: <1330965691-10301-5-git-send-email-l.majewski@samsung.com>
References: <1320914477-27885-1-git-send-email-l.majewski@samsung.com>
 <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:17341 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751806Ab2CEQlh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Mar 2012 11:41:37 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0M0F00JZD7PC8P00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0F00DCR7PBSP@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Mar 2012 16:41:36 +0000 (GMT)
In-reply-to: <1330965691-10301-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Scott Wood <scottwood@freescale.com>, Minkyu Kang <mk7.kang@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Enable OneNAND support for Exynos4210 (C210 universal).

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Minkyu Kang <mk7.kang@samsung.com>
---
 include/configs/s5pc210_universal.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/configs/s5pc210_universal.h b/include/configs/s5pc210_universal.h
index 8286680..1301275 100644
--- a/include/configs/s5pc210_universal.h
+++ b/include/configs/s5pc210_universal.h
@@ -233,6 +233,7 @@
 #define CONFIG_SYS_MONITOR_LEN		(256 << 10)	/* Reserve 2 sectors */
 
 #define CONFIG_USE_ONENAND_BOARD_INIT
+#define CONFIG_SAMSUNG_ONENAND
 #define CONFIG_SYS_ONENAND_BASE		0x0C000000
 
 #define CONFIG_ENV_IS_IN_MMC		1
-- 
1.7.2.3
