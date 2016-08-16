From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [RFC 16/17] Revert
 "i2c: exynos5: Fix possible ABBA deadlock by keeping I2C clock prepared"
Date: Tue, 16 Aug 2016 15:35:13 +0200
Message-ID: <1471354514-24224-17-git-send-email-k.kozlowski@samsung.com>
References: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1471354514-24224-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Javier Martinez Canillas <javier@osg.samsung.com>, a.hajda@samsung.com, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This reverts commit 10ff4c5239a137abfc896ec73ef3d15a0f86a16a.
---
 drivers/i2c/busses/i2c-exynos5.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index c0e3ada02876..8710052eeb6b 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -671,9 +671,7 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 		return -EIO;
 	}
 
-	ret = clk_enable(i2c->clk);
-	if (ret)
-		return ret;
+	clk_prepare_enable(i2c->clk);
 
 	for (i = 0; i < num; i++, msgs++) {
 		stop = (i == num - 1);
@@ -697,7 +695,7 @@ static int exynos5_i2c_xfer(struct i2c_adapter *adap,
 	}
 
  out:
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	return ret;
 }
 
@@ -749,9 +747,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 		return -ENOENT;
 	}
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret)
-		return ret;
+	clk_prepare_enable(i2c->clk);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	i2c->regs = devm_ioremap_resource(&pdev->dev, mem);
@@ -803,10 +799,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	clk_disable(i2c->clk);
-
-	return 0;
-
  err_clk:
 	clk_disable_unprepare(i2c->clk);
 	return ret;
@@ -818,8 +810,6 @@ static int exynos5_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adap);
 
-	clk_unprepare(i2c->clk);
-
 	return 0;
 }
 
@@ -831,8 +821,6 @@ static int exynos5_i2c_suspend_noirq(struct device *dev)
 
 	i2c->suspended = 1;
 
-	clk_unprepare(i2c->clk);
-
 	return 0;
 }
 
@@ -842,9 +830,7 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
 	struct exynos5_i2c *i2c = platform_get_drvdata(pdev);
 	int ret = 0;
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret)
-		return ret;
+	clk_prepare_enable(i2c->clk);
 
 	ret = exynos5_hsi2c_clock_setup(i2c);
 	if (ret) {
@@ -853,7 +839,7 @@ static int exynos5_i2c_resume_noirq(struct device *dev)
 	}
 
 	exynos5_i2c_init(i2c);
-	clk_disable(i2c->clk);
+	clk_disable_unprepare(i2c->clk);
 	i2c->suspended = 0;
 
 	return 0;
-- 
1.9.1

