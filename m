From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 1/2] i2c: exynos5: remove some dead code
Date: Wed,  9 May 2018 21:45:31 +0200
Message-ID: <20180509194532.28929-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Andrzej Hajda <a.hajda@samsung.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The else branch cannot be taken as i will always equal num.
Get rid of the whole construct.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/busses/i2c-exynos5.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 12ec8484e653..a2cbc779c33a 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -727,17 +727,7 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 			goto out;
 	}
 
-	if (i == num) {
-		ret = num;
-	} else {
-		/* Only one message, cannot access the device */
-		if (i == 1)
-			ret = -EREMOTEIO;
-		else
-			ret = i;
-
-		dev_warn(i2c->dev, "xfer message failed\n");
-	}
+	ret = num;
 
  out:
 	clk_disable(i2c->clk);
-- 
2.11.0
