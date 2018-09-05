From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] mfd: max8997: Disable interrupt handling for suspend/resume
 cycle
Date: Wed, 05 Sep 2018 14:30:43 +0200
Message-ID: <20180905123043.22604-1-m.szyprowski@samsung.com>
References: <CGME20180905123053eucas1p196633ed9d661f79ed1c2e06a14a2b964@eucas1p1.samsung.com>
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
 drivers/mfd/max8997.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index d1495d76bf2c..5a50ea976c70 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -464,6 +464,7 @@ static int max8997_suspend(struct device *dev)
 
 	if (device_may_wakeup(dev))
 		irq_set_irq_wake(max8997->irq, 1);
+	disable_irq(max8997->irq);
 	return 0;
 }
 
@@ -474,6 +475,7 @@ static int max8997_resume(struct device *dev)
 
 	if (device_may_wakeup(dev))
 		irq_set_irq_wake(max8997->irq, 0);
+	enable_irq(max8997->irq);
 	return max8997_irq_resume(max8997);
 }
 
-- 
2.17.1
