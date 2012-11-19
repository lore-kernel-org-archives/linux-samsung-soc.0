From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/5] ARM: dts: exynos4210-trats: Add nodes for GPIO keys
 available on Trats
Date: Mon, 19 Nov 2012 15:45:26 +0100
Message-ID: <1353336329-20818-3-git-send-email-t.figa@samsung.com>
References: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11394 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab2KSOps (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:45:48 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ008X7P05ZPJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:47 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ009O9OZWSZ80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:47 +0900 (KST)
In-reply-to: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch extends dts file of Samsung Trats board to add support for
available GPIO keys using gpio-keys driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 661854b..dcfa04b 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -65,6 +65,39 @@
 		status = "okay";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		vol-down-key {
+			gpios = <&gpx2 1 1>;
+			linux,code = <114>;
+			label = "volume down";
+			debounce-interval = <10>;
+		};
+
+		vol-up-key {
+			gpios = <&gpx2 0 1>;
+			linux,code = <115>;
+			label = "volume up";
+			debounce-interval = <10>;
+		};
+
+		power-key {
+			gpios = <&gpx2 7 1>;
+			linux,code = <116>;
+			label = "power";
+			debounce-interval = <10>;
+			gpio-key,wakeup;
+		};
+
+		ok-key {
+			gpios = <&gpx3 5 1>;
+			linux,code = <352>;
+			label = "ok";
+			debounce-interval = <10>;
+		};
+	};
+
 	i2c@138B0000 {
 		samsung,i2c-sda-delay = <100>;
 		samsung,i2c-slave-addr = <0x10>;
-- 
1.8.0
