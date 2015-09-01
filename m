From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: dts: exynos4412-odroid-*: add workaround for
 CPUfreq/reboot issue
Date: Tue, 01 Sep 2015 15:08:49 +0200
Message-ID: <1441112929-6751-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29333 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753750AbbIANJE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Sep 2015 09:09:04 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NU000GJV1V2RP60@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 01 Sep 2015 14:09:02 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Exynos4412-based Odroid boards (X2, U3, U3+) don't reset PMIC
configuration during hardware reset. This causes serious issues with
CPUfreq, when ARM voltage is set below 1.0V. When one resets the board
when CPUfreq selected one of lower Exynos 4412 operating points (for
example: 200MHz and 0.9V), the bootloader crashes and it is not possible
to restart the board without turning power off.

This patch provides a workaround for this issue by increasing the start
of valid range for vdd_arm regulator from 1.0V. After such change,
CPUfreq can still use lower operating points, but the voltage won't be
decreased below 1.0V and as a result it will be possible to reset board
at any time.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
Hello,

This issue was there from the beggining, but I was not able to reproduce
it. It has been already reported by Tobias in early Feb 2015
(http://www.spinics.net/lists/linux-samsung-soc/msg42294.html).
Recently, after CPUfreq changes (conversion to generic cpufreq dt and
enabling cpufreq in exynos_defconfig) it was much easier to observe this
issue.

This workaround lets one still use CPUfreq and avoid unexpect board
crashes during reboot (both 'standard' and emergency).

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index db52841..fca8233 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -370,7 +370,7 @@
 
 			buck2_reg: BUCK2 {
 				regulator-name = "vdd_arm";
-				regulator-min-microvolt = <900000>;
+				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
-- 
1.9.2
