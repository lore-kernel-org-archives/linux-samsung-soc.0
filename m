From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/2] mfd: sec-core: Modify RTC compatible name of S2MPS13
Date: Tue, 17 Mar 2015 10:54:18 +0100
Message-ID: <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
References: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Chanwoo Choi <cw00.choi@samsung.com>

This patch modify the RTC compatible name of S2MPS13 because S2MPS13's RTC is
equal to S2MPS14's RTC.

Cc: Lee Jones <lee.jones@linaro.org>
Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes since v1:
1. New patch.
---
 drivers/mfd/sec-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 0a7bc43db4e4..59bf322feacd 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -76,7 +76,7 @@ static const struct mfd_cell s2mps11_devs[] = {
 
 static const struct mfd_cell s2mps13_devs[] = {
 	{ .name = "s2mps13-pmic", },
-	{ .name = "s2mps13-rtc", },
+	{ .name = "s2mps14-rtc", },
 	{
 		.name = "s2mps13-clk",
 		.of_compatible = "samsung,s2mps13-clk",
-- 
1.9.1
