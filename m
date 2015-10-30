From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/2] regulator: s2mps11: Rename s2mpsxx regulator as *-regulator
Date: Fri, 30 Oct 2015 16:31:53 +0530
Message-ID: <1446202913-20467-2-git-send-email-alim.akhtar@samsung.com>
References: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52333 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966231AbbJ3LBt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Oct 2015 07:01:49 -0400
In-reply-to: <1446202913-20467-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: lee.jones@linaro.org, broonie@kernel.org
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

S2MPSXX regulators are probed with the same name as their parent MFD
device, this is a bit confusing.
As we discussed the same here[1], this patch rename the current regulator
names from *-pmic to *-regulator.

[1]-> https://lkml.org/lkml/2015/10/28/417

Suggested-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/regulator/s2mps11.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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
