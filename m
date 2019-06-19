From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] regulator: s2mps11: Fix ERR_PTR dereference on GPIO lookup failure
Date: Wed, 19 Jun 2019 14:42:39 +0200
Message-ID: <1560948159-21926-1-git-send-email-krzk@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Georg Waibel <georg.waibel@sensor-technik.de>, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

If devm_gpiod_get_from_of_node() call returns ERR_PTR, it is assigned
into an array of GPIO descriptors and used later because such error is
not treated as critical thus it is not propagated back to the probe
function.

All code later expects that such GPIO descriptor is either a NULL or
proper value.  This later might lead to dereference of ERR_PTR.

Only devices with S2MPS14 flavor are affected (other do not control
regulators with GPIOs).

Fixes: 1c984942f0a4 ("regulator: s2mps11: Pass descriptor instead of GPIO number")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

The exact error condition was not tested because I do not have board
with S2MPS14.
---
 drivers/regulator/s2mps11.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 134c62db36c5..af9bf10b4c33 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -824,6 +824,7 @@ static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
 		if (IS_ERR(gpio[reg])) {
 			dev_err(&pdev->dev, "Failed to get control GPIO for %d/%s\n",
 				reg, rdata[reg].name);
+			gpio[reg] = NULL;
 			continue;
 		}
 		if (gpio[reg])
-- 
2.7.4
