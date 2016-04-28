From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: dts: exynos: Add MFC memory banks for Peach boards
Date: Thu, 28 Apr 2016 15:21:50 -0400
Message-ID: <1461871311-18344-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:49798 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752323AbcD1TWY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 15:22:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org

The MFC nodes with the memory regions reserved for memory allocations
are missing in the Exynos5420 Peach Pit and Exynos5800 Peach Pi DTS.

This causes the s5p-mfc driver probe to fail with the following error:

[    4.140647] s5p_mfc_alloc_memdevs:1072: Failed to declare coherent memory for MFC device
[    4.216163] s5p-mfc: probe of 11000000.codec failed with error -12

Add the missing nodes so the driver probes and the {en,de}coder video
nodes are registered correctly:

[    4.096277] s5p-mfc 11000000.codec: decoder registered as /dev/video4
[    4.102282] s5p-mfc 11000000.codec: encoder registered as /dev/video5

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/boot/dts/exynos5420-peach-pit.dts | 5 +++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index b644858231b6..f9d2e4f1a0e0 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -694,6 +694,11 @@
 	status = "okay";
 };
 
+&mfc {
+	samsung,mfc-r = <0x43000000 0x800000>;
+	samsung,mfc-l = <0x51000000 0x800000>;
+};
+
 &mmc_0 {
 	status = "okay";
 	num-slots = <1>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 6ba9aec15485..62ceb89e073f 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -669,6 +669,11 @@
 	status = "okay";
 };
 
+&mfc {
+	samsung,mfc-r = <0x43000000 0x800000>;
+	samsung,mfc-l = <0x51000000 0x800000>;
+};
+
 &mmc_0 {
 	status = "okay";
 	num-slots = <1>;
-- 
2.5.5
