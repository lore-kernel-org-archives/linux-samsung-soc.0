From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 1/2] mfd: sec-core: Rename MFD and regulator names differently
Date: Fri, 30 Oct 2015 16:31:52 +0530
Message-ID: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60298 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966231AbbJ3LBS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 07:01:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Currently S2MPSXX multifunction device is named as *-pmic,
and this MFD also supports regulator as a one of its MFD cell which
has the same name, which is a bit confusing.

We did discussed different approaches about how the MFD and it
cells need to be named here [1].
Based in the discussion this patch rename MFD regulator name as
*-regulator instead of current *-pmic.

[1]-> https://lkml.org/lkml/2015/10/28/417

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/mfd/sec-core.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
 
-- 
1.7.10.4
