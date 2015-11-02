From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/2] arm64: dts: exynos7: Enable HS200 mode operation
Date: Mon, 02 Nov 2015 15:34:01 +0530
Message-ID: <1446458641-4447-2-git-send-email-alim.akhtar@samsung.com>
References: <1446458641-4447-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1446458641-4447-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch enables HS200 mode operation on exynos7 based
espresso board.
This also remove _broken-cd_ property as per mmc binding documentation
which say one of the properties between broken-cd and non-removable
should be used. And we already use _non-removable_ as emmc mounted
on board which is a non-removable device.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
index 8ce04a0ec928..7f19b99fc85b 100644
--- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
@@ -405,8 +405,8 @@
 &mmc_0 {
 	status = "okay";
 	num-slots = <1>;
-	broken-cd;
 	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
 	non-removable;
 	card-detect-delay = <200>;
 	clock-frequency = <800000000>;
-- 
1.7.10.4
