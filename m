From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 07/13] regulator: s2mps11: Constify regulator_desc array
Date: Mon, 17 Feb 2014 09:40:21 +0100
Message-ID: <1392626427-4518-8-git-send-email-k.kozlowski@samsung.com>
References: <1392626427-4518-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1392626427-4518-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Constify the regulator_desc 'regulators' array.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
---
 drivers/regulator/s2mps11.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index acdd3b92b8d6..caf3977761e7 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -343,7 +343,7 @@ static struct regulator_ops s2mps11_buck_ops = {
 	.enable_mask	= S2MPS11_ENABLE_MASK			\
 }
 
-static struct regulator_desc regulators[] = {
+static const struct regulator_desc regulators[] = {
 	regulator_desc_ldo2(1),
 	regulator_desc_ldo1(2),
 	regulator_desc_ldo1(3),
-- 
1.7.9.5
