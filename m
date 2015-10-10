From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH v3] i2c: s3c2410: enable RuntimePM before registering to the core
Date: Sat, 10 Oct 2015 08:24:23 +0100
Message-ID: <1444461874-2841-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57183 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751101AbbJJHY7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Oct 2015 03:24:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The core may register clients attached to this master which may use
funtionality from the master. So, RuntimePM must be enabled before, otherwise
this will fail. While here, move drvdata, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2: don't call runtime pm on adaper if it wasn't registered

Thanks to Krzysztof for testing!

 drivers/i2c/busses/i2c-s3c2410.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 50bfd8cef5f224..5df819610d5280 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -1243,17 +1243,19 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
 	i2c->adap.nr = i2c->pdata->bus_num;
 	i2c->adap.dev.of_node = pdev->dev.of_node;
 
+	platform_set_drvdata(pdev, i2c);
+
+	pm_runtime_enable(&pdev->dev);
+
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to add bus to i2c core\n");
+		pm_runtime_disable(&pdev->dev);
 		s3c24xx_i2c_deregister_cpufreq(i2c);
 		clk_unprepare(i2c->clk);
 		return ret;
 	}
 
-	platform_set_drvdata(pdev, i2c);
-
-	pm_runtime_enable(&pdev->dev);
 	pm_runtime_enable(&i2c->adap.dev);
 
 	dev_info(&pdev->dev, "%s: S3C I2C adapter\n", dev_name(&i2c->adap.dev));
-- 
2.1.4
