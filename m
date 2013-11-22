From: Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH] clk: samsung: exynos4: Correct SRC_MFC register
Date: Fri, 22 Nov 2013 14:21:08 +0900
Message-ID: <1385097668-24620-1-git-send-email-sw0312.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29280 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722Ab3KVFVL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Nov 2013 00:21:11 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MWN005PHG6RUMC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 Nov 2013 14:21:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mturquette@linaro.org, kgene.kim@samsung.com, kyungmin.park@samsung.com
Cc: sw0312.kim@samsung.com

The SRC_MFC register was incorrect. This patch corrects it.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index ad5ff50..1a7c1b9 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -39,7 +39,7 @@
 #define SRC_TOP1		0xc214
 #define SRC_CAM			0xc220
 #define SRC_TV			0xc224
-#define SRC_MFC			0xcc28
+#define SRC_MFC			0xc228
 #define SRC_G3D			0xc22c
 #define E4210_SRC_IMAGE		0xc230
 #define SRC_LCD0		0xc234
-- 
1.7.4.1
