From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v2 10/10] arm64: dts: exynos: remove i80-if-timings nodes
Date: Thu, 24 Aug 2017 15:33:59 +0200
Message-ID: <1503581639-580-11-git-send-email-a.hajda@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133412eucas1p23233d7bed8b83d86b26de01bc1ecf2a1@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43193 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752940AbdHXNeP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 09:34:15 -0400
In-reply-to: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>

Since i80/command mode is determined in runtime by propagating info
from panel this property can be removed.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index e2b0da2..105b293 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -280,9 +280,6 @@
 
 &decon {
 	status = "okay";
-
-	i80-if-timings {
-	};
 };
 
 &decon_tv {
@@ -1116,9 +1113,6 @@
 
 &mic {
 	status = "okay";
-
-	i80-if-timings {
-	};
 };
 
 &pmu_system_controller {
-- 
2.7.4
