From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 8/8] ARM: dts: exynos4412-odroid: fix T-FLASH hotplug
 detection
Date: Mon, 14 Jul 2014 14:48:26 +0200
Message-ID: <1405342106-10585-9-git-send-email-m.szyprowski@samsung.com>
References: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29050 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755299AbaGNMsn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 08:48:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8P005M4CWV1F70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 14 Jul 2014 13:48:31 +0100 (BST)
In-reply-to: <1405342106-10585-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Kamil Debski <k.debski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

TFLASH (SDHCI2 controller) uses internal card detect line, but it looks
that the driver fails to operate it properly. Use GPIO interrupt on
SD_CDn line for detecting SD card state.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index d1b33a8efa9d..0bc1a9b94f47 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -91,6 +91,8 @@
 		pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
 		pinctrl-names = "default";
 		vmmc-supply = <&ldo4_reg &ldo21_reg>;
+		cd-gpios = <&gpk2 2 0>;
+		cd-inverted;
 		status = "okay";
 	};
 
-- 
1.9.2
