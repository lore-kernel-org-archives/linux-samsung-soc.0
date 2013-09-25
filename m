From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH RESEND REGRESSION] ARM: dts: exynos4210: Work around lack of
 cpufreq regulator lookup
Date: Wed, 25 Sep 2013 16:10:06 +0200
Message-ID: <1547192.40oE87agjP@amdc1227>
References: <1377020136-14838-1-git-send-email-t.figa@samsung.com>
 <2243476.800bKojdAz@amdc1227>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46004 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755270Ab3IYOKU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Sep 2013 10:10:20 -0400
In-reply-to: <2243476.800bKojdAz@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Kumar Gala <galak@codeaurora.org>, Kyungmin Park <kyungmin.park@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

Exynos cpufreq drivers does not support device tree based regulator
lookup, so it can get the VDD ARM regulator only by its name. To get
cpufreq working for now, this patch works this around by renaming the
regulator in board dts files to vdd_arm, which is the name expected by
the driver.

This fixes a regression introduced by dropping support of board file
based bootup of Exynos 4210 boards that rendered cpufreq inoperable on
Trats and Origen boards.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 7 ++++++-
 arch/arm/boot/dts/exynos4210-trats.dts  | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

Resending again, since my mail client previously freaked out and reset
message format to HTML...

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 382d8c7..46378fe 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -192,7 +192,12 @@
 				};
 
 				buck1_reg: BUCK1 {
-					regulator-name = "VDD_ARM_1.2V";
+					/*
+					* HACK: The real name is VDD_ARM_1.2V,
+					* but exynos-cpufreq does not support
+					* DT-based regulator lookup yet.
+					*/
+					regulator-name = "vdd_arm";
 					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt	= <1350000>;
 					regulator-always-on;
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 1c164f2..63cc571 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -290,7 +290,12 @@
 				};
 
 				varm_breg: BUCK1 {
-				     regulator-name = "VARM_1.2V_C210";
+				     /*
+				      * HACK: The real name is VARM_1.2V_C210,
+				      * but exynos-cpufreq does not support
+				      * DT-based regulator lookup yet.
+				      */
+				     regulator-name = "vdd_arm";
 				     regulator-min-microvolt = <900000>;
 				     regulator-max-microvolt = <1350000>;
 				     regulator-always-on;
-- 
1.8.3.2
