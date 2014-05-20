From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] ARM: dts: exynos4210-universal_c210: add multimedia nodes
Date: Tue, 20 May 2014 14:47:00 +0200
Message-ID: <1400590021-15422-4-git-send-email-m.szyprowski@samsung.com>
References: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:21475 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752128AbaETMrK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 08:47:10 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5V007E0I6EUZ00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 May 2014 13:47:02 +0100 (BST)
In-reply-to: <1400590021-15422-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

This patch enables support for multimedia blocks - fimc in mem2mem mode,
no camera sensors support yet.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 0a32b396306c..c86a79edf367 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -448,6 +448,29 @@
 		compatible = "samsung,s5p6440-pwm";
 		status = "okay";
 	};
+
+	camera {
+		status = "okay";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <>;
+
+		fimc_0: fimc@11800000 {
+			status = "okay";
+		};
+
+		fimc_1: fimc@11810000 {
+			status = "okay";
+		};
+
+		fimc_2: fimc@11820000 {
+			status = "okay";
+		};
+
+		fimc_3: fimc@11830000 {
+			status = "okay";
+		};
+	};
 };
 
 &mdma1 {
-- 
1.9.2
