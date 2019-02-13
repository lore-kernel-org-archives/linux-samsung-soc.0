From: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH v3 1/2] mfd: sec: Put one element structure initialisation on one line
Date: Wed, 13 Feb 2019 22:24:01 +0000
Message-ID: <20190213222402.20541-2-stuart.menefy@mathembedded.com>
References: <20190213222402.20541-1-stuart.menefy@mathembedded.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213222402.20541-1-stuart.menefy@mathembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
List-Id: linux-samsung-soc@vger.kernel.org

Change the layout of the initialisation of structures with one
element to a single line of code. This keeps the coding style
consistent.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/mfd/sec-core.c | 58 +++++++++++++++++---------------------------------
 1 file changed, 19 insertions(+), 39 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index e0835c9df7a1..5ff3fd726f9e 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -28,45 +28,33 @@
 #include <linux/regmap.h>
 
 static const struct mfd_cell s5m8751_devs[] = {
-	{
-		.name = "s5m8751-pmic",
-	}, {
-		.name = "s5m-charger",
-	}, {
-		.name = "s5m8751-codec",
-	},
+	{ .name = "s5m8751-pmic", },
+	{ .name = "s5m-charger", },
+	{ .name = "s5m8751-codec", },
 };
 
 static const struct mfd_cell s5m8763_devs[] = {
-	{
-		.name = "s5m8763-pmic",
-	}, {
-		.name = "s5m-rtc",
-	}, {
-		.name = "s5m-charger",
-	},
+	{ .name = "s5m8763-pmic", },
+	{ .name = "s5m-rtc", },
+	{ .name = "s5m-charger", },
 };
 
 static const struct mfd_cell s5m8767_devs[] = {
+	{ .name = "s5m8767-pmic", },
+	{ .name = "s5m-rtc", },
 	{
-		.name = "s5m8767-pmic",
-	}, {
-		.name = "s5m-rtc",
-	}, {
 		.name = "s5m8767-clk",
 		.of_compatible = "samsung,s5m8767-clk",
-	}
+	},
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
+	{ .name = "s2mps11-regulator", },
+	{ .name = "s2mps14-rtc", },
 	{
-		.name = "s2mps11-regulator",
-	}, {
-		.name = "s2mps14-rtc",
-	}, {
 		.name = "s2mps11-clk",
 		.of_compatible = "samsung,s2mps11-clk",
-	}
+	},
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
@@ -79,37 +67,29 @@ static const struct mfd_cell s2mps13_devs[] = {
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
+	{ .name = "s2mps14-regulator", },
+	{ .name = "s2mps14-rtc", },
 	{
-		.name = "s2mps14-regulator",
-	}, {
-		.name = "s2mps14-rtc",
-	}, {
 		.name = "s2mps14-clk",
 		.of_compatible = "samsung,s2mps14-clk",
-	}
+	},
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
+	{ .name = "s2mps15-regulator", },
+	{ .name = "s2mps15-rtc", },
 	{
-		.name = "s2mps15-regulator",
-	}, {
-		.name = "s2mps15-rtc",
-	}, {
 		.name = "s2mps13-clk",
 		.of_compatible = "samsung,s2mps13-clk",
 	},
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{
-		.name = "s2mpa01-pmic",
-	},
+	{ .name = "s2mpa01-pmic", },
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{
-		.name = "s2mpu02-regulator",
-	},
+	{ .name = "s2mpu02-regulator", },
 };
 
 #ifdef CONFIG_OF
-- 
2.13.6
