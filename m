From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 2/2] i2c: exynos5: remove pointless initializers
Date: Wed,  9 May 2018 21:45:32 +0200
Message-ID: <20180509194532.28929-2-peda@axentia.se>
References: <20180509194532.28929-1-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180509194532.28929-1-peda@axentia.se>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Andrzej Hajda <a.hajda@samsung.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The variables are always assigned before use anyway.

Signed-off-by: Peter Rosin <peda@axentia.se>
---
 drivers/i2c/busses/i2c-exynos5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index a2cbc779c33a..185fba37e830 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -707,7 +707,7 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 			struct i2c_msg *msgs, int num)
 {
 	struct exynos5_i2c *i2c = adap->algo_data;
-	int i = 0, ret = 0, stop = 0;
+	int i, ret, stop;
 
 	if (i2c->suspended) {
 		dev_err(i2c->dev, "HS-I2C is not initialized.\n");
-- 
2.11.0
