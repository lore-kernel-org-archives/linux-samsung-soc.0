From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
Date: Fri, 14 Jun 2019 08:52:53 +0200
Message-ID: <20190614065253.9622-1-m.szyprowski@samsung.com>
References: <CGME20190614065304eucas1p1ad98abc5c0f5e5e94fa43bed7e7d0e4f@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Samsung Exynos SoCs require to force UTMI width to 8bit, otherwise the
host side of the shared USB2 PHY doesn't work.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_width")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Krzysztof Kozlowski <krzk@kernel.org>
---
v2:
- added collected tags
---
 drivers/usb/dwc2/params.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 6900eea57526..9ece4affb9d4 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -76,6 +76,7 @@ static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
 	struct dwc2_core_params *p = &hsotg->params;
 
 	p->power_down = 0;
+	p->phy_utmi_width = 8;
 }
 
 static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
-- 
2.17.1
