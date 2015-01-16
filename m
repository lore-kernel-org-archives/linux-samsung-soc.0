From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ARM: dts: Fix CLK_MOUT_CAMn parent clocks assignment for Trats2
Date: Fri, 16 Jan 2015 18:40:16 +0100
Message-ID: <1421430016-32248-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:16847 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753328AbbAPRkf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jan 2015 12:40:35 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIA00CIC6FLVG50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 17 Jan 2015 02:40:33 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

In order to get exact 24MHz clock frequency value for the camera
sensor and avoid rounding errors the parent clock must be CLK_XUSBXTI,
not CLK_MOUT_MPLL_USER_T.  Currently the sensor's master clock
frequency is too high and the sensor doesn't work properly.

This fixes commit 0357a4438d531ef3cf529e80ffcd208eb8e35f55
("ARM: dts: Specify default clocks for Exynos4 camera devices").

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 29231b4..9ae62c2 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -721,8 +721,8 @@
 		status = "okay";
 		assigned-clocks = <&clock CLK_MOUT_CAM0>,
 				  <&clock CLK_MOUT_CAM1>;
-		assigned-clock-parents = <&clock CLK_MOUT_MPLL_USER_T>,
-					 <&clock CLK_MOUT_MPLL_USER_T>;
+		assigned-clock-parents = <&clock CLK_XUSBXTI>,
+					 <&clock CLK_XUSBXTI>;

 		fimc_0: fimc@11800000 {
 			status = "okay";
--
1.7.9.5
