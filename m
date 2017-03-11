From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 7/7] regulator: s2mpa01: Fix inconsistent indenting
Date: Sat, 11 Mar 2017 21:01:24 +0200
Message-ID: <20170311190124.11512-7-krzk@kernel.org>
References: <20170311190124.11512-1-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934023AbdCKTCG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Mar 2017 14:02:06 -0500
In-Reply-To: <20170311190124.11512-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Broken indenting makes code more difficult to read and brings
confusion. Fix warning reported by Smatch:
	s2mpa01.c:362 s2mpa01_pmic_probe() warn: inconsistent indenting

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s2mpa01.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index 77db69587f05..48f0ca90743c 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -359,11 +359,11 @@ static int s2mpa01_pmic_probe(struct platform_device *pdev)
 	if (iodev->dev->of_node) {
 		reg_np = of_get_child_by_name(iodev->dev->of_node,
 							"regulators");
-			if (!reg_np) {
-				dev_err(&pdev->dev,
-					"could not find regulators sub-node\n");
-				return -EINVAL;
-			}
+		if (!reg_np) {
+			dev_err(&pdev->dev,
+				"could not find regulators sub-node\n");
+			return -EINVAL;
+		}
 
 		of_regulator_match(&pdev->dev, reg_np, rdata,
 						S2MPA01_REGULATOR_MAX);
-- 
2.9.3
