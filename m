From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Enable regulator support for HDMI on Origen
Date: Fri,  7 Oct 2011 17:15:36 +0530
Message-ID: <1317987936-4461-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:63926 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752427Ab1JGLuc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 07:50:32 -0400
Received: by qyk30 with SMTP id 30so451809qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Oct 2011 04:50:31 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, sachin.kamat@linaro.org

This patch enables the regulators for HDMI on Origen board.

Since the DC5V line is connected directly to the HDMI connector,
"hdmi-en" regulator would become a dummy regulator on origen board
(by defining REGULATOR_DUMMY in the kernel config file).

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/mach-origen.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index 18909cf..39d8d4e 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -89,6 +89,8 @@ static struct s3c2410_uartcfg origen_uartcfgs[] __initdata = {
 
 static struct regulator_consumer_supply __initdata ldo3_consumer[] = {
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
+	REGULATOR_SUPPLY("vdd", "exynos4-hdmi"), /* HDMI */
+	REGULATOR_SUPPLY("vdd_pll", "exynos4-hdmi"), /* HDMI */
 };
 static struct regulator_consumer_supply __initdata ldo6_consumer[] = {
 	REGULATOR_SUPPLY("vdd18", "s5p-mipi-csis.0"), /* MIPI */
@@ -98,6 +100,7 @@ static struct regulator_consumer_supply __initdata ldo7_consumer[] = {
 };
 static struct regulator_consumer_supply __initdata ldo8_consumer[] = {
 	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* ADC */
+	REGULATOR_SUPPLY("vdd_osc", "exynos4-hdmi"), /* HDMI */
 };
 static struct regulator_consumer_supply __initdata ldo9_consumer[] = {
 	REGULATOR_SUPPLY("dvdd", "swb-a31"), /* AR6003 WLAN & CSR 8810 BT */
-- 
1.7.4.1
