From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH 6/7] regulator: arizona-ldo1: Make arizona_ldo1 independent of struct arizona
Date: Tue, 18 Apr 2017 11:43:53 +0100
Message-ID: <1492512234-19210-8-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:56057 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755547AbdDRKoX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 06:44:23 -0400
In-Reply-To: <1492512234-19210-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org, lee.jones@linaro.org, kgene@kernel.org, krzk@kernel.org
Cc: linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

In preparation for supporting Madera codecs, remove the dependency on
struct arizona in the regulator callbacks and struct arizona_ldo1.

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
---
 drivers/regulator/arizona-ldo1.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/arizona-ldo1.c b/drivers/regulator/arizona-ldo1.c
index f5bc75a..678f81f 100644
--- a/drivers/regulator/arizona-ldo1.c
+++ b/drivers/regulator/arizona-ldo1.c
@@ -33,7 +33,7 @@
 
 struct arizona_ldo1 {
 	struct regulator_dev *regulator;
-	struct arizona *arizona;
+	struct regmap *regmap;
 
 	struct regulator_consumer_supply supply;
 	struct regulator_init_data init_data;
@@ -67,7 +67,7 @@ static int arizona_ldo1_hc_set_voltage_sel(struct regulator_dev *rdev,
 					   unsigned sel)
 {
 	struct arizona_ldo1 *ldo = rdev_get_drvdata(rdev);
-	struct regmap *regmap = ldo->arizona->regmap;
+	struct regmap *regmap = ldo->regmap;
 	unsigned int val;
 	int ret;
 
@@ -93,7 +93,7 @@ static int arizona_ldo1_hc_set_voltage_sel(struct regulator_dev *rdev,
 static int arizona_ldo1_hc_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct arizona_ldo1 *ldo = rdev_get_drvdata(rdev);
-	struct regmap *regmap = ldo->arizona->regmap;
+	struct regmap *regmap = ldo->regmap;
 	unsigned int val;
 	int ret;
 
@@ -247,7 +247,7 @@ static int arizona_ldo1_probe(struct platform_device *pdev)
 	if (!ldo1)
 		return -ENOMEM;
 
-	ldo1->arizona = arizona;
+	ldo1->regmap = arizona->regmap;
 
 	/*
 	 * Since the chip usually supplies itself we provide some
-- 
1.9.1
