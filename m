From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 1/3] i2c: s3c2410: Add missing clock unprepare on probe()
 error path
Date: Thu, 21 Apr 2016 09:04:49 +0200
Message-ID: <1461222291-5642-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

If during probe() the s3c24xx_i2c_init() failed, the clock was left in
disabled but prepared state.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Add Javier's reviewed-by.
---
 drivers/i2c/busses/i2c-s3c2410.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 362a6de54833..e9658af36f2e 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1200,6 +1200,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	clk_disable(i2c->clk);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "I2C controller init failed\n");
+		clk_unprepare(i2c->clk);
 		return ret;
 	}
 	/* find the IRQ for this unit (note, this relies on the init call to
-- 
1.9.1
