From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/2] i2c: exynos5: de-duplicate error logs on clock setup
Date: Fri, 24 Feb 2017 12:16:02 +0100
Message-ID: <1487934962-8703-2-git-send-email-a.hajda@samsung.com>
References: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
 <CGME20170224111634eucas1p28938c94c566c0aadf6dc7766b4eb96d9@eucas1p2.samsung.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1487934962-8703-1-git-send-email-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In case of clock setup error it is enough to log it once.
Moreover patch simplifies clock setup routines.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 54df9e6..bc2b5db 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -309,7 +309,8 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 	div = temp / 512;
 	clk_cycle = temp / (div + 1) - 2;
 	if (temp < 4 || div >= 256 || clk_cycle < 2) {
-		dev_warn(i2c->dev, "Failed to calculate divisor");
+		dev_err(i2c->dev, "%s clock set-up failed\n",
+			hs_timings ? "HS" : "FS");
 		return -EINVAL;
 	}
 
@@ -351,24 +352,13 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
 
 static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
 {
-	/*
-	 * Configure the Fast speed timing values
-	 * Even the High Speed mode initially starts with Fast mode
-	 */
-	if (exynos5_i2c_set_timing(i2c, false)) {
-		dev_err(i2c->dev, "HSI2C FS Clock set up failed\n");
-		return -EINVAL;
-	}
+	/* always set Fast Speed timings */
+	int ret = exynos5_i2c_set_timing(i2c, false);
 
-	/* configure the High speed timing values */
-	if (i2c->op_clock >= HSI2C_HS_TX_CLOCK) {
-		if (exynos5_i2c_set_timing(i2c, true)) {
-			dev_err(i2c->dev, "HSI2C HS Clock set up failed\n");
-			return -EINVAL;
-		}
-	}
+	if (ret < 0 || i2c->op_clock < HSI2C_HS_TX_CLOCK)
+		return ret;
 
-	return 0;
+	return exynos5_i2c_set_timing(i2c, true);
 }
 
 /*
-- 
2.7.4
