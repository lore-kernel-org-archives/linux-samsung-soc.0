From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] i2c: exynos5: fix arbitration lost handling
Date: Wed, 8 Mar 2017 17:05:33 -0300
Message-ID: <2fb11816-85e7-14f6-7b61-5d3eba6096aa@osg.samsung.com>
References: <CGME20170222110438eucas1p2329ece7afd9e22ba185da64ccf4b2981@eucas1p2.samsung.com>
 <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:46374
        "EHLO osg.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751929AbdCIAme (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2017 19:42:34 -0500
In-Reply-To: <1487761474-11547-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Andi Shyti <andi.shyti@samsung.com>

Hello Andrzej,

On 02/22/2017 08:04 AM, Andrzej Hajda wrote:
> In case of arbitration lost adequate interrupt sometimes is not signaled.
> As a result transfer timeouts and is not retried, as it should. To avoid
> such cases code is added to check transaction status in case of every
> interrupt.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---

This patch causes regressions on Exynos5 boards (at least I noticed it in
Exynos5800 Peach Pi board). I see transmission timeouts when accessing I2C
device registers, i.e:

$ cat /sys/class/rtc/rtc0/time
[   25.924594] exynos5-hsi2c 12e10000.i2c: rx timeout
[   65.028365] max77686-rtc max77802-rtc: Fail to read time reg(-22)
cat: /sys/class/rtc/rtc0/time: Invalid argument

Doing a partial revert of $SUBJECT (reading I2C_TRANS_STATUS register when
it was before) "fixes" the problem [0].

I've read the Exynos5800 and Exynos5433 SoC manuals and couldn't figure out
what's causing it. I first thought that the solution was to make I2C core
to retry when the TRANSFER_DONE_AUTO field isn't set [1] but that only makes
the issue less frequent, it still fails. I also tried to increment the retry
count [2] but it also didn't help.

Any ideas about what could be happening here?

[0]:
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index cbd93ce0661f..736a82472101 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -457,7 +457,6 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 
 	int_status = readl(i2c->regs + HSI2C_INT_STATUS);
 	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
-	trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
 
 	/* handle interrupt related to the transfer status */
 	if (i2c->variant->hw == HSI2C_EXYNOS7) {
@@ -482,11 +481,13 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 			goto stop;
 		}
 
+		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
 		if ((trans_status & HSI2C_MASTER_ST_MASK) == HSI2C_MASTER_ST_LOSE) {
 			i2c->state = -EAGAIN;
 			goto stop;
 		}
 	} else if (int_status & HSI2C_INT_I2C) {
+		trans_status = readl(i2c->regs + HSI2C_TRANS_STATUS);
 		if (trans_status & HSI2C_NO_DEV_ACK) {
 			dev_dbg(i2c->dev, "No ACK from device\n");
 			i2c->state = -ENXIO;

[1]:
>From 3c60d3a0356563b33b739d309a4f64c003d83053 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javier@osg.samsung.com>
Date: Mon, 6 Mar 2017 19:35:44 -0300
Subject: [PATCH] i2c: exynos5: Make transaction to retry if isn't successfully completed

After commit 7999eecb7e56 ("i2c: exynos5: fix arbitration lost handling"),
some I2C transactions are failing because the TRANSFER_DONE_AUTO field is
not set in the I2C_TRANS_STATUS register so the i2c->status value is left
to -EINVAL causing the i2c->msg_complete completion to never be signaled.

For example, when reading the time of an I2C rtc on an Exynos5800 machine:

$ cat /sys/class/rtc/rtc0/time
[   25.924594] exynos5-hsi2c 12e10000.i2c: rx timeout
[   65.028365] max77686-rtc max77802-rtc: Fail to read time reg(-22)
cat: /sys/class/rtc/rtc0/time: Invalid argument

To avoid this, set i2c->state to -EAGAIN if TRANSFER_DONE_AUTO is not set to
allow the I2C core to retry if the transaction wasn't successfully completed.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 drivers/i2c/busses/i2c-exynos5.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index cbd93ce0661f..d294fb61520c 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -506,6 +506,10 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
 		} else if (trans_status & HSI2C_TRANS_DONE) {
 			i2c->trans_done = 1;
 			i2c->state = 0;
+		} else {
+			dev_dbg(i2c->dev, "Transaction was not completed\n");
+			i2c->state = -EAGAIN;
+			goto stop;
 		}
 	}
 
-- 
2.9.3

[2]
diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
index d294fb61520c..2b0ee9040188 100644
--- a/drivers/i2c/busses/i2c-exynos5.c
+++ b/drivers/i2c/busses/i2c-exynos5.c
@@ -774,7 +774,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
        strlcpy(i2c->adap.name, "exynos5-i2c", sizeof(i2c->adap.name));
        i2c->adap.owner   = THIS_MODULE;
        i2c->adap.algo    = &exynos5_i2c_algorithm;
-       i2c->adap.retries = 3;
+       i2c->adap.retries = 5;
 
        i2c->dev = &pdev->dev;
        i2c->clk = devm_clk_get(&pdev->dev, "hsi2c");

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
