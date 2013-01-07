From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] ARM: dts: correct the dw-mshc timing properties as per binding
Date: Mon, 07 Jan 2013 06:19:45 -0500
Message-ID: <1357557585-30257-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25497 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751220Ab3AGK7L (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jan 2013 05:59:11 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG900FDW55YQIL0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Jan 2013 19:59:09 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MG900EDA541J7B0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 07 Jan 2013 19:59:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, thomas.ab@samsung.com, dianders@chromium.org

As per the current exynos-dw-mshc bindings, dw-mshc-sdr-timing and
dw-mshc-ddr-timing properties are having only two cells, these properties
are wrongly set for exynos5250 based cros5250 and smdk5250 platfroms. This patch
corrects above timing propreties for above platfroms

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/cros5250-common.dtsi    | 12 ++++++------
 arch/arm/boot/dts/exynos5250-smdk5250.dts |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/cros5250-common.dtsi b/arch/arm/boot/dts/cros5250-common.dtsi
index fddd174..46c0980 100644
--- a/arch/arm/boot/dts/cros5250-common.dtsi
+++ b/arch/arm/boot/dts/cros5250-common.dtsi
@@ -96,8 +96,8 @@
 		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3 3>;
-		samsung,dw-mshc-ddr-timing = <1 2 3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
 
 		slot@0 {
 			reg = <0>;
@@ -120,8 +120,8 @@
 		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3 3>;
-		samsung,dw-mshc-ddr-timing = <1 2 3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
 
 		slot@0 {
 			reg = <0>;
@@ -141,8 +141,8 @@
 		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3 3>;
-		samsung,dw-mshc-ddr-timing = <1 2 3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
 
 		slot@0 {
 			reg = <0>;
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 942d576..e05b18f 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -115,8 +115,8 @@
 		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3 3>;
-		samsung,dw-mshc-ddr-timing = <1 2 3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
 
 		slot@0 {
 			reg = <0>;
@@ -139,8 +139,8 @@
 		fifo-depth = <0x80>;
 		card-detect-delay = <200>;
 		samsung,dw-mshc-ciu-div = <3>;
-		samsung,dw-mshc-sdr-timing = <2 3 3>;
-		samsung,dw-mshc-ddr-timing = <1 2 3>;
+		samsung,dw-mshc-sdr-timing = <2 3>;
+		samsung,dw-mshc-ddr-timing = <1 2>;
 
 		slot@0 {
 			reg = <0>;
-- 
1.8.0
