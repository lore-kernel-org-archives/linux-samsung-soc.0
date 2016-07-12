From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] regulator: s2mps11: Fix the voltage linear range for s2mps15
Date: Tue, 12 Jul 2016 11:26:43 +0530
Message-ID: <1468303003-10775-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33510 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751887AbcGLF5Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Jul 2016 01:57:24 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, broonie@kernel.org, k.kozlowski@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com, alim.akhtar@samsung.com, stable@vger.kernel.org

This patch fixes some of the LDOs and BUCKs voltage range as per
user manual of s2mps15 (REV0.4).

Fixes: 51af20675800 ("regulator: s2mps11: Add support for S2MPS15 regulators")

Cc: <stable@vger.kernel.org>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/regulator/s2mps11.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 02fb6b4..d838e77 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -750,7 +750,7 @@ static const struct regulator_linear_range s2mps15_ldo_voltage_ranges3[] = {
 
 /* voltage range for s2mps15 LDO 7, 8, 9 and 10 */
 static const struct regulator_linear_range s2mps15_ldo_voltage_ranges4[] = {
-	REGULATOR_LINEAR_RANGE(700000, 0xc, 0x18, 25000),
+	REGULATOR_LINEAR_RANGE(700000, 0x10, 0x20, 25000),
 };
 
 /* voltage range for s2mps15 LDO 1 */
@@ -760,12 +760,12 @@ static const struct regulator_linear_range s2mps15_ldo_voltage_ranges5[] = {
 
 /* voltage range for s2mps15 BUCK 1, 2, 3, 4, 5, 6 and 7 */
 static const struct regulator_linear_range s2mps15_buck_voltage_ranges1[] = {
-	REGULATOR_LINEAR_RANGE(500000, 0x20, 0xb0, 6250),
+	REGULATOR_LINEAR_RANGE(500000, 0x20, 0xc0, 6250),
 };
 
 /* voltage range for s2mps15 BUCK 8, 9 and 10 */
 static const struct regulator_linear_range s2mps15_buck_voltage_ranges2[] = {
-	REGULATOR_LINEAR_RANGE(1000000, 0x20, 0xc0, 12500),
+	REGULATOR_LINEAR_RANGE(1000000, 0x20, 0x78, 12500),
 };
 
 static const struct regulator_desc s2mps15_regulators[] = {
-- 
1.7.10.4
