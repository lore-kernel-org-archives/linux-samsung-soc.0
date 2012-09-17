From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/7] ARM: EXYNOS: Change MIPI-CSIS device regulator supply names
Date: Mon, 17 Sep 2012 12:51:40 +0200
Message-ID: <1347879100-30150-3-git-send-email-s.nawrocki@samsung.com>
References: <1347878888-30001-1-git-send-email-s.nawrocki@samsung.com>
 <1347879100-30150-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29430 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754909Ab2IQKwd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 06:52:33 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAH00EBCQ6DAKO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 19:52:32 +0900 (KST)
Received: from amdc248.digital.local ([106.116.147.32])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAH003D4Q6Z1L90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 19:52:32 +0900 (KST)
In-reply-to: <1347879100-30150-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

Rename MIPI-CSIS regulator supply names to match definitions in
the driver after commit "s5p-csis: Change regulator supply names".

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c           | 4 ++--
 arch/arm/mach-exynos/mach-origen.c         | 4 ++--
 arch/arm/mach-exynos/mach-universal_c210.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index da6e7ce..bfe6955 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -378,10 +378,10 @@ static struct regulator_consumer_supply __initdata max8997_ldo1_[] = {
 };
 static struct regulator_consumer_supply __initdata max8997_ldo3_[] = {
 	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* USB */
-	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
+	REGULATOR_SUPPLY("vddcore", "s5p-mipi-csis.0"), /* MIPI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo4_[] = {
-	REGULATOR_SUPPLY("vdd18", "s5p-mipi-csis.0"), /* MIPI */
+	REGULATOR_SUPPLY("vddio", "s5p-mipi-csis.0"), /* MIPI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo5_[] = {
 	REGULATOR_SUPPLY("vhsic", "modemctl"), /* MODEM */
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 65ac45b..b58bbca 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -96,12 +96,12 @@ static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
 };
 
 static struct regulator_consumer_supply __initdata ldo3_consumer[] = {
-	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
+	REGULATOR_SUPPLY("vddcore", "s5p-mipi-csis.0"), /* MIPI */
 	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
 	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"), /* HDMI */
 };
 static struct regulator_consumer_supply __initdata ldo6_consumer[] = {
-	REGULATOR_SUPPLY("vdd18", "s5p-mipi-csis.0"), /* MIPI */
+	REGULATOR_SUPPLY("vddio", "s5p-mipi-csis.0"), /* MIPI */
 };
 static struct regulator_consumer_supply __initdata ldo7_consumer[] = {
 	REGULATOR_SUPPLY("avdd", "alc5625"), /* Realtek ALC5625 */
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 0b0a2d0..ac00757 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -211,7 +211,7 @@ static struct regulator_consumer_supply lp3974_ldo3_consumer[] = {
 	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"),
 	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"),
 	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"),
-	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"),
+	REGULATOR_SUPPLY("vddcore", "s5p-mipi-csis.0"),
 };
 
 static struct regulator_init_data lp3974_ldo3_data = {
@@ -275,7 +275,7 @@ static struct regulator_init_data lp3974_ldo6_data = {
 };
 
 static struct regulator_consumer_supply lp3974_ldo7_consumer[] = {
-	REGULATOR_SUPPLY("vdd18", "s5p-mipi-csis.0"),
+	REGULATOR_SUPPLY("vddio", "s5p-mipi-csis.0"),
 };
 
 static struct regulator_init_data lp3974_ldo7_data = {
-- 
1.7.11.3
