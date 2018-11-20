From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] usb: dwc2: Disable power down feature on Samsung SoCs
Date: Tue, 20 Nov 2018 16:38:15 +0100
Message-ID: <20181120153815.31897-1-m.szyprowski@samsung.com>
References: <CGME20181120153828eucas1p206d442b12c16588662c0e3f731ba58c3@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Power down feature of DWC2 module integrated in Samsung SoCs doesn't work
properly or needs some additional handling in PHY or SoC glue layer, so
disable it for now. Without disabling power down, DWC2 causes random memory
trashes and fails enumeration if there is no USB link to host on driver
probe.

Fixes: 03ea6d6e9e1ff1 ("usb: dwc2: Enable power down")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/params.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 7c1b6938f212..266157ae179a 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -71,6 +71,13 @@ static void dwc2_set_his_params(struct dwc2_hsotg *hsotg)
 	p->power_down = false;
 }
 
+static void dwc2_set_s3c6400_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->power_down = 0;
+}
+
 static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -151,7 +158,8 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "lantiq,arx100-usb", .data = dwc2_set_ltq_params },
 	{ .compatible = "lantiq,xrx200-usb", .data = dwc2_set_ltq_params },
 	{ .compatible = "snps,dwc2" },
-	{ .compatible = "samsung,s3c6400-hsotg" },
+	{ .compatible = "samsung,s3c6400-hsotg",
+	  .data = dwc2_set_s3c6400_params },
 	{ .compatible = "amlogic,meson8-usb",
 	  .data = dwc2_set_amlogic_params },
 	{ .compatible = "amlogic,meson8b-usb",
-- 
2.17.1
