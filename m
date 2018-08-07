From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] clk: s2mps11: Use existing defines from bindings for clock IDs
Date: Tue,  7 Aug 2018 18:17:13 +0200
Message-ID: <20180807161713.28073-3-krzk@kernel.org>
References: <20180807161713.28073-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180807161713.28073-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Javier Martinez Canillas <javier@dowhile0.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The clock IDs must match between DeviceTree bindings and the driver.
There is already a header file used by DeviceTree sources so include it
in the driver to remove duplicated symbols.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-s2mps11.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index ebf9115dad1d..56221647207d 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -17,12 +17,7 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mfd/samsung/core.h>
 
-enum {
-	S2MPS11_CLK_AP = 0,
-	S2MPS11_CLK_CP,
-	S2MPS11_CLK_BT,
-	S2MPS11_CLKS_NUM,
-};
+#include <dt-bindings/clock/samsung,s2mps11.h>
 
 struct s2mps11_clk {
 	struct sec_pmic_dev *iodev;
-- 
2.14.1
