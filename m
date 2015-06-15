From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv7 2/4] ARM: dts: exynos5422-odroidxu3: Enable TMU at Exynos5422 base
Date: Mon, 15 Jun 2015 12:23:21 +0930
Message-ID: <1434336803-4132-2-git-send-email-linux.amoon@gmail.com>
References: <1434336803-4132-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:34833 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753890AbbFOCxn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Jun 2015 22:53:43 -0400
In-Reply-To: <1434336803-4132-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>

This changes enables TMU IP block on the Exynos5422 Odroid-XU3
device.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Acked-by: Lukasz Majewski <l.majewski@samsung.com>
---
Changes rebase on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung branch for-next
Changes from v5 and v6: Use LDO7 regulator instead of LDO10 regulator to control TMU.
	Fixed the commit log.
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 17e6a9a..96d894e 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -474,6 +474,31 @@
 	status = "okay";
 };
 
+&tmu_cpu0 {
+	vtmu-supply = <&ldo7_reg>;
+	status = "okay";
+};
+
+&tmu_cpu1 {
+	vtmu-supply = <&ldo7_reg>;
+	status = "okay";
+};
+
+&tmu_cpu2 {
+	vtmu-supply = <&ldo7_reg>;
+	status = "okay";
+};
+
+&tmu_cpu3 {
+	vtmu-supply = <&ldo7_reg>;
+	status = "okay";
+};
+
+&tmu_gpu {
+	vtmu-supply = <&ldo7_reg>;
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
-- 
2.4.3
