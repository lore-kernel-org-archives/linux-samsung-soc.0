From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] mfd: max8997: Disable interrupt handling for
 suspend/resume cycle
Date: Wed, 05 Sep 2018 16:36:06 +0200
Message-ID: <20180905143606.5916-1-m.szyprowski@samsung.com>
References: <CGME20180905143815eucas1p29cb4247cfef8180433d9b4627f5ff883@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Disable IRQs during suspend/resume cycle to ensure handling of wakeup
interrupts (i.e. RTC wake alarm) after max8997_resume(). This way it can
be properly handled when I2C bus is finally available. This pattern is
also used in other MAX PMIC MFD drivers.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
changelog:
v2:
- reordered the sequence of operation as suggested by Krzysztof Kozlowski
---
 drivers/mfd/max8997.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 3f554c447521..b17eff50ad52 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -468,6 +468,7 @@ static int max8997_suspend(struct device *dev)
 	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8997_dev *max8997 = i2c_get_clientdata(i2c);
 
+	disable_irq(max8997->irq);
 	if (device_may_wakeup(dev))
 		irq_set_irq_wake(max8997->irq, 1);
 	return 0;
@@ -480,6 +481,7 @@ static int max8997_resume(struct device *dev)
 
 	if (device_may_wakeup(dev))
 		irq_set_irq_wake(max8997->irq, 0);
+	enable_irq(max8997->irq);
 	return max8997_irq_resume(max8997);
 }
 
-- 
2.17.1
