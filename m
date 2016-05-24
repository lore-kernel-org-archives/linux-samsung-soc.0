From: "Steinar H. Gunderson" <sesse@google.com>
Subject: [PATCH v2] dwc3-exynos: Fix deferred probing storm.
Date: Tue, 24 May 2016 20:13:15 +0200
Message-ID: <E1b6Hj3-0001MI-AS@pannekake.samfundet.no>
References: <20160524192424.GA11690@sesse.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassarossa.samfundet.no ([193.35.52.29]:33305 "EHLO
	cassarossa.samfundet.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861AbcE0NXI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 May 2016 09:23:08 -0400
In-Reply-To: <20160524192424.GA11690@sesse.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com
Cc: broonie@debian.org, linux-samsung-soc@vger.kernel.org, 823552@bugs.debian.org, balbi@kernel.org, linux-usb@vger.kernel.org, stable@vger.kernel.org, gautam.vivek@samsung.com

dwc3-exynos has two problems during init if the regulators are slow
to come up (for instance if the I2C bus driver is not on the initramfs)
and return probe deferral. First, every time this happens, the driver
leaks the USB phys created; they need to be deallocated on error.

Second, since the phy devices are created before the regulators fail,
this means that there's a new device to re-trigger deferred probing,
which causes it to essentially go into a busy loop of re-probing the
device until the regulators come up.

Move the phy creation to after the regulators have succeeded, and also
fix cleanup on failure. On my ODROID XU4 system (with Debian's initramfs
which doesn't contain the I2C driver), this reduces the number of probe
attempts (for each of the two controllers) from more than 2000 to eight.

Signed-off-by: Steinar H. Gunderson <sesse@google.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Vivek Gautam <gautam.vivek@samsung.com>
Fixes: d720f057fda4 ("usb: dwc3: exynos: add nop transceiver support")
Cc: <stable@vger.kernel.org>
---
 drivers/usb/dwc3/dwc3-exynos.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-exynos.c b/drivers/usb/dwc3/dwc3-exynos.c
index dd5cb55..2f1fb7e 100644
--- a/drivers/usb/dwc3/dwc3-exynos.c
+++ b/drivers/usb/dwc3/dwc3-exynos.c
@@ -128,12 +128,6 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, exynos);
 
-	ret = dwc3_exynos_register_phys(exynos);
-	if (ret) {
-		dev_err(dev, "couldn't register PHYs\n");
-		return ret;
-	}
-
 	exynos->dev	= dev;
 
 	exynos->clk = devm_clk_get(dev, "usbdrd30");
@@ -183,20 +177,29 @@ static int dwc3_exynos_probe(struct platform_device *pdev)
 		goto err3;
 	}
 
+	ret = dwc3_exynos_register_phys(exynos);
+	if (ret) {
+		dev_err(dev, "couldn't register PHYs\n");
+		goto err4;
+	}
+
 	if (node) {
 		ret = of_platform_populate(node, NULL, NULL, dev);
 		if (ret) {
 			dev_err(dev, "failed to add dwc3 core\n");
-			goto err4;
+			goto err5;
 		}
 	} else {
 		dev_err(dev, "no device node, failed to add dwc3 core\n");
 		ret = -ENODEV;
-		goto err4;
+		goto err5;
 	}
 
 	return 0;
 
+err5:
+	platform_device_unregister(exynos->usb2_phy);
+	platform_device_unregister(exynos->usb3_phy);
 err4:
 	regulator_disable(exynos->vdd10);
 err3:
-- 
2.8.0.rc3.226.g39d4020
