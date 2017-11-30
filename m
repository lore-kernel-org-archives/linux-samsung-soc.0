From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/3] i2c: exynos5: change internal transmission timeout to
 100ms
Date: Thu, 30 Nov 2017 15:30:05 +0100
Message-ID: <20171130143007.30258-2-a.hajda@samsung.com>
References: <20171130143007.30258-1-a.hajda@samsung.com>
        <CGME20171130143017eucas1p2f68094c72e4559e1a16cf334c3200950@eucas1p2.samsung.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <20171130143007.30258-1-a.hajda@samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Andi Shyti <andi.shyti@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, "open list:I2C SUBSYSTEM" <linux-i2c@vger.kernel.org>, "moderated list:ARM/SAMSUNG EXYNOS
        ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos-I2C uses default timeout of 1 second for the whole transaction,
including re-transmissions due to arbitration lost errors (-EAGAIN).
To allow re-transmissions driver's internal timeout should be significantly
lower, 100ms seems to be good candidate.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index 3855e0b11877..b02428498f6d 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -170,7 +170,7 @@
 #define HSI2C_HS_TX_CLOCK	1000000
 #define HSI2C_FS_TX_CLOCK	100000
 
-#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(1000))
+#define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
 
 #define HSI2C_EXYNOS7	BIT(0)
 
-- 
2.15.0
