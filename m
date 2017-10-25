From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] I2C-S3C2410: Use common error handling code in
 s3c24xx_i2c_probe()
Date: Wed, 25 Oct 2017 15:05:52 +0200
Message-ID: <32c82282-ee0a-137f-4913-310b194b60f3@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Oct 2017 15:00:35 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/i2c/busses/i2c-s3c2410.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 5d97510ee48b..304a6d492c8c 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1168,8 +1168,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	clk_disable(i2c->clk);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "I2C controller init failed\n");
-		clk_unprepare(i2c->clk);
-		return ret;
+		goto unprepare_clock;
 	}
 
 	/*
@@ -1180,24 +1179,21 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 		i2c->irq = ret = platform_get_irq(pdev, 0);
 		if (ret <= 0) {
 			dev_err(&pdev->dev, "cannot find IRQ\n");
-			clk_unprepare(i2c->clk);
-			return ret;
+			goto unprepare_clock;
 		}
 
 		ret = devm_request_irq(&pdev->dev, i2c->irq, s3c24xx_i2c_irq,
 				       0, dev_name(&pdev->dev), i2c);
 		if (ret != 0) {
 			dev_err(&pdev->dev, "cannot claim IRQ %d\n", i2c->irq);
-			clk_unprepare(i2c->clk);
-			return ret;
+			goto unprepare_clock;
 		}
 	}
 
 	ret = s3c24xx_i2c_register_cpufreq(i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register cpufreq notifier\n");
-		clk_unprepare(i2c->clk);
-		return ret;
+		goto unprepare_clock;
 	}
 
 	/*
@@ -1217,12 +1213,15 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		pm_runtime_disable(&pdev->dev);
 		s3c24xx_i2c_deregister_cpufreq(i2c);
-		clk_unprepare(i2c->clk);
-		return ret;
+		goto unprepare_clock;
 	}
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
 	return 0;
+
+unprepare_clock:
+	clk_unprepare(i2c->clk);
+	return ret;
 }
 
 static int s3c24xx_i2c_remove(struct platform_device *pdev)
-- 
2.14.3
