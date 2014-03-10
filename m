From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/3] mfd: sec-core: Add of_compatible strings for MFD cells
Date: Mon, 10 Mar 2014 13:34:17 +0100
Message-ID: <1394454858-3139-3-git-send-email-k.kozlowski@samsung.com>
References: <1394454858-3139-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394454858-3139-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add of_compatible strings for S5M8767 RTC, S5M8767 clock and S2MPS14
clock MFD cells.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/sec-core.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index d163c66edebb..e8ac2e3c1f58 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -57,8 +57,10 @@ static const struct mfd_cell s5m8767_devs[] = {
 		.name = "s5m8767-pmic",
 	}, {
 		.name = "s5m-rtc",
+		.of_compatible = "samsung,s5m8767-rtc",
 	}, {
 		.name = "s5m8767-clk",
+		.of_compatible = "samsung,s5m8767-clk",
 	}
 };
 
@@ -77,6 +79,7 @@ static const struct mfd_cell s2mps14_devs[] = {
 		.name = "s2mps14-rtc",
 	}, {
 		.name = "s2mps14-clk",
+		.of_compatible = "samsung,s2mps14-clk",
 	}
 };
 
-- 
1.7.9.5
