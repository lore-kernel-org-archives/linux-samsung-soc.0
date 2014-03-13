From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] mfd: sec-core: Add of_compatible strings for MFD cells
Date: Thu, 13 Mar 2014 10:37:03 +0100
Message-ID: <1394703425-6462-3-git-send-email-k.kozlowski@samsung.com>
References: <1394703425-6462-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1394703425-6462-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add of_compatible strings for MFD cells for regulator, clock and RTC
drivers in S5M8767, S2MPS11 and S2MPS14 PMIC-s.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/sec-core.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index d163c66edebb..c5b9b95b2099 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -55,28 +55,36 @@ static const struct mfd_cell s5m8763_devs[] = {
 static const struct mfd_cell s5m8767_devs[] = {
 	{
 		.name = "s5m8767-pmic",
+		.of_compatible = "samsung,s5m8767-regulators",
 	}, {
 		.name = "s5m-rtc",
+		.of_compatible = "samsung,s5m8767-rtc",
 	}, {
 		.name = "s5m8767-clk",
+		.of_compatible = "samsung,s5m8767-clk",
 	}
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
 	{
 		.name = "s2mps11-pmic",
+		.of_compatible = "samsung,s2mps11-regulators",
 	}, {
 		.name = "s2mps11-clk",
+		.of_compatible = "samsung,s2mps11-clk",
 	}
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
 	{
 		.name = "s2mps14-pmic",
+		.of_compatible = "samsung,s2mps14-regulators",
 	}, {
 		.name = "s2mps14-rtc",
+		.of_compatible = "samsung,s2mps14-rtc",
 	}, {
 		.name = "s2mps14-clk",
+		.of_compatible = "samsung,s2mps14-clk",
 	}
 };
 
-- 
1.7.9.5
