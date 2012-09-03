From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] ARM: dts: exynos4: Enable serial controllers on Origen and
 SMDKV310
Date: Mon, 03 Sep 2012 15:28:05 +0200
Message-ID: <1808225.QZz0WEipT7@amdc1227>
References: <1346675674-16034-1-git-send-email-t.figa@samsung.com>
 <1346675674-16034-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63180 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754686Ab2ICN2J (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 3 Sep 2012 09:28:09 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9S009HY02STOA0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 22:28:07 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9S00H3302TXMD0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Sep 2012 22:28:07 +0900 (KST)
In-reply-to: <1346675674-16034-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, thomas.abraham@linaro.org

This patch adds status override of serial nodes to enable used serial ports
on Origen and SMDKV310 board.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts   | 16 ++++++++++++++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index d1a1101..c7295fb 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -57,6 +57,22 @@
 		status = "okay";
 	};
 
+	serial@13800000 {
+		status = "okay";
+	};
+
+	serial@13810000 {
+		status = "okay";
+	};
+
+	serial@13820000 {
+		status = "okay";
+	};
+
+	serial@13830000 {
+		status = "okay";
+	};
+
 	gpio_keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4210-smdkv310.dts b/arch/arm/boot/dts/exynos4210-smdkv310.dts
index b87cca2..f634907 100644
--- a/arch/arm/boot/dts/exynos4210-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4210-smdkv310.dts
@@ -43,6 +43,22 @@
 		status = "okay";
 	};
 
+	serial@13800000 {
+		status = "okay";
+	};
+
+	serial@13810000 {
+		status = "okay";
+	};
+
+	serial@13820000 {
+		status = "okay";
+	};
+
+	serial@13830000 {
+		status = "okay";
+	};
+
 	keypad@100A0000 {
 		samsung,keypad-num-rows = <2>;
 		samsung,keypad-num-columns = <8>;
-- 
1.7.12
