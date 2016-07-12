From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: s2mps11: Fix the voltage linear range for s2mps15" to the regulator tree
Date: Tue, 12 Jul 2016 10:02:06 +0100
Message-ID: <E1bMtZu-00088Q-52@debutante>
References: <1468303003-10775-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468303003-10775-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.orgbroonie@kernel.org, k.kozlowski@samsung.com, thomas.ab@samsung.com, a.kesavan@samsung.com, alim.akhtar@samsung.comstable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The patch

   regulator: s2mps11: Fix the voltage linear range for s2mps15

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 04c16b84e49a6d609c88f4f5523237ece3612b74 Mon Sep 17 00:00:00 2001
From: Alim Akhtar <alim.akhtar@samsung.com>
Date: Tue, 12 Jul 2016 11:26:43 +0530
Subject: [PATCH] regulator: s2mps11: Fix the voltage linear range for s2mps15

This patch fixes some of the LDOs and BUCKs voltage range as per
user manual of s2mps15 (REV0.4).

Fixes: 51af20675800 ("regulator: s2mps11: Add support for S2MPS15 regulators")
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org>
---
 drivers/regulator/s2mps11.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 02fb6b4ea820..d838e77dd947 100644
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
2.8.1
