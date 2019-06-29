From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] regulator: s2mps11: Fix buck7 and buck8 wrong voltages
Date: Sat, 29 Jun 2019 13:44:45 +0200
Message-ID: <20190629114446.11381-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On S2MPS11 device, the buck7 and buck8 regulator voltages start at 750
mV, not 600 mV.  Using wrong minimal value caused shifting of these
regulator values by 150 mV (e.g. buck7 usually configured to v1.35 V was
reported as 1.2 V).

On most of the boards these regulators are left in default state so this
was only affecting reported voltage.  However if any driver wanted to
change them, then effectively it would set voltage 150 mV higher than
intended.

Cc: <stable@vger.kernel.org>
Fixes: cb74685ecb39 ("regulator: s2mps11: Add samsung s2mps11 regulator driver")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index a215cfe20555..8f3c8730dc0d 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -479,8 +479,8 @@ static const struct regulator_desc s2mps11_regulators[] = {
 	regulator_desc_s2mps11_buck1_4(4),
 	regulator_desc_s2mps11_buck5,
 	regulator_desc_s2mps11_buck67810(6, MIN_600_MV, STEP_6_25_MV),
-	regulator_desc_s2mps11_buck67810(7, MIN_600_MV, STEP_12_5_MV),
-	regulator_desc_s2mps11_buck67810(8, MIN_600_MV, STEP_12_5_MV),
+	regulator_desc_s2mps11_buck67810(7, MIN_750_MV, STEP_12_5_MV),
+	regulator_desc_s2mps11_buck67810(8, MIN_750_MV, STEP_12_5_MV),
 	regulator_desc_s2mps11_buck9,
 	regulator_desc_s2mps11_buck67810(10, MIN_750_MV, STEP_12_5_MV),
 };
-- 
2.17.1
