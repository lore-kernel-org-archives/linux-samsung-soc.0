From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2] mfd: sec-core: Rename MFD and regulator names differently
Date: Mon, 02 Nov 2015 09:36:09 +0530
Message-ID: <1446437169-29550-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60431 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbKBEE5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Nov 2015 23:04:57 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Currently S2MPSXX multifunction device is named as *-pmic,
and these MFDs also supports regulator as a one of its MFD cell which
has the same name, because current name is confusing and we want to
sort it out.

We did discussed different approaches about how the MFD and it
cells need to be named here [1].
Based in the discussion this patch rename MFD regulator name as
*-regulator instead of current *-pmic.

This patch also changes the corresponding entries in the regulator driver
to keep git-bisect happy.

[1]-> https://lkml.org/lkml/2015/10/28/417

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
Changes since V1:
* Squashed the two patches in one as sugeested by Lee
* Based on the top of [1]
[1]-> https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg47736.html

 drivers/mfd/sec-core.c      |    8 ++++----
 drivers/regulator/s2mps11.c |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 7c4e7be17f1e..c9802ba9be72 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -68,7 +68,7 @@ static const struct mfd_cell s5m8767_devs[] = {
 
 static const struct mfd_cell s2mps11_devs[] = {
 	{
-		.name = "s2mps11-pmic",
+		.name = "s2mps11-regulator",
 	}, {
 		.name = "s2mps14-rtc",
 	}, {
@@ -78,7 +78,7 @@ static const struct mfd_cell s2mps11_devs[] = {
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-pmic", },
+	{ .name = "s2mps13-regulator", },
 	{ .name = "s2mps13-rtc", },
 	{
 		.name = "s2mps13-clk",
@@ -88,7 +88,7 @@ static const struct mfd_cell s2mps13_devs[] = {
 
 static const struct mfd_cell s2mps14_devs[] = {
 	{
-		.name = "s2mps14-pmic",
+		.name = "s2mps14-regulator",
 	}, {
 		.name = "s2mps14-rtc",
 	}, {
@@ -116,7 +116,7 @@ static const struct mfd_cell s2mpa01_devs[] = {
 
 static const struct mfd_cell s2mpu02_devs[] = {
 	{
-		.name = "s2mpu02-pmic",
+		.name = "s2mpu02-regulator",
 	},
 };
 
diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index b2f3a28e720c..3242ffc0cb25 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1199,11 +1199,11 @@ out:
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
-	{ "s2mps11-pmic", S2MPS11X},
-	{ "s2mps13-pmic", S2MPS13X},
-	{ "s2mps14-pmic", S2MPS14X},
+	{ "s2mps11-regulator", S2MPS11X},
+	{ "s2mps13-regulator", S2MPS13X},
+	{ "s2mps14-regulator", S2MPS14X},
 	{ "s2mps15-regulator", S2MPS15X},
-	{ "s2mpu02-pmic", S2MPU02},
+	{ "s2mpu02-regulator", S2MPU02},
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, s2mps11_pmic_id);
-- 
1.7.10.4
