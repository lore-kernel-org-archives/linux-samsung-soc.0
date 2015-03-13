From: Ameen Ali <ameenali023@gmail.com>
Subject: [PATCH 10/11] arch/arm/mach-s3c24xx/mach-osiris-dvs.c: use "&&" (not "&") with bool operands
Date: Fri, 13 Mar 2015 16:53:38 +0200
Message-ID: <1426258418-5940-1-git-send-email-ameenali023@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f194.google.com ([74.125.82.194]:36785 "EHLO
	mail-we0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751868AbbCMOxp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Mar 2015 10:53:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene@kernel.org, linux@arm.linux.org.uk
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Ameen Ali <ameenali023@gmail.com>

bitwise AND ("&") was used
in logical expressions with operands having "bool" type. Replaced
bitwise AND operators with logical AND.

Signed-off-by : Ameen Ali <AmeenAli023@gmail.com
---
 arch/arm/mach-s3c24xx/mach-osiris-dvs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
index ce2db23..e189836 100644
--- a/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
+++ b/arch/arm/mach-s3c24xx/mach-osiris-dvs.c
@@ -70,16 +70,16 @@ static int osiris_dvs_notify(struct notifier_block *nb,
 
 	switch (val) {
 	case CPUFREQ_PRECHANGE:
-		if (old_dvs & !new_dvs ||
-		    cur_dvs & !new_dvs) {
+		if (old_dvs && !new_dvs ||
+		    cur_dvs && !new_dvs) {
 			pr_debug("%s: exiting dvs\n", __func__);
 			cur_dvs = false;
 			gpio_set_value(OSIRIS_GPIO_DVS, 1);
 		}
 		break;
 	case CPUFREQ_POSTCHANGE:
-		if (!old_dvs & new_dvs ||
-		    !cur_dvs & new_dvs) {
+		if (!old_dvs && new_dvs ||
+		    !cur_dvs && new_dvs) {
 			pr_debug("entering dvs\n");
 			cur_dvs = true;
 			gpio_set_value(OSIRIS_GPIO_DVS, 0);
-- 
2.1.0
