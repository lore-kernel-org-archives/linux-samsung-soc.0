From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] usb: dwc2: Force 8bit UTMI width for Samsung Exynos SoCs
Date: Mon, 06 May 2019 15:00:46 +0200
Message-ID: <20190506130046.20898-1-m.szyprowski@samsung.com>
References: <20190503204958.GA12532@kozik-lap>
        <CGME20190506130052eucas1p25afd4e15648e9efc6fd011e46081fbea@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190503204958.GA12532@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jules Maselbas <jmaselbas@kalray.eu>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Samsung Exynos SoCs require to force UTMI width to 8bit, otherwise the
host side of the shared USB2 PHY doesn't work.

Reported-by: Krzysztof Kozlowski <krzk@kernel.org>
Fixes: 707d80f0a3c5 ("usb: dwc2: gadget: Replace phyif with phy_utmi_width")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
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
