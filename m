From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: [PATCH v2] usb: dwc3: exynos: Fix error handling of clk_prepare_enable
Date: Tue, 22 Jan 2019 00:23:50 +0300
Message-ID: <1548105830-26376-1-git-send-email-khoroshilov@ispras.ru>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Felipe Balbi <balbi@kernel.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
List-Id: linux-samsung-soc@vger.kernel.org

If clk_prepare_enable() fails in dwc3_exynos_probe() or in
dwc3_exynos_resume(), exynos->clks[0] is left undisabled
because of usage preincrement in while condition.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Fixes: 9f2168367a0a ("usb: dwc3: exynos: Rework clock handling and prepare for new variants")
---
v2: Add fix for the second instance in dwc3_exynos_resume() per Marek Szyprowski note.

 drivers/usb/dwc3/dwc3-exynos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index cb7fcd7c0ad8..c1e9ea621f41 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -78,7 +78,7 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 	for (i = 0; i < exynos->num_clks; i++) {
 		ret = clk_prepare_enable(exynos->clks[i]);
 		if (ret) {
-			while (--i > 0)
+			while (i-- > 0)
 				clk_disable_unprepare(exynos->clks[i]);
 			return ret;
 		}
@@ -223,7 +223,7 @@ static int dwc3_exynos_resume(struct device *dev)
 	for (i = 0; i < exynos->num_clks; i++) {
 		ret = clk_prepare_enable(exynos->clks[i]);
 		if (ret) {
-			while (--i > 0)
+			while (i-- > 0)
 				clk_disable_unprepare(exynos->clks[i]);
 			return ret;
 		}
-- 
2.7.4
