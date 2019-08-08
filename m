From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/2 RESEND] usb: dwc3: remove generic PHY calibrate()
 calls
Date: Thu,  8 Aug 2019 11:41:28 +0200
Message-ID: <20190808094128.27213-3-m.szyprowski@samsung.com>
References: <20190808094128.27213-1-m.szyprowski@samsung.com>
        <CGME20190808094146eucas1p27c673846a5a9be0c55f1f87c89af4adf@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808094128.27213-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Calls to USB2 generic PHY calibrate() method has been moved to HCD core,
which now successfully handles generic PHYs and their calibration after
every HCD reset. This fixes all the timing issues related to PHY
calibration done directly from DWC3 driver: incorrect operation after
system suspend/resume or USB3.0 detection failure when XHCI-plat driver
compiled as separate module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
---
 drivers/usb/dwc3/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index c9bb93a2c81e..7dd6d419254d 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -168,7 +168,6 @@ static void __dwc3_set_mode(struct work_struct *work)
 				otg_set_vbus(dwc->usb2_phy->otg, true);
 			phy_set_mode(dwc->usb2_generic_phy, PHY_MODE_USB_HOST);
 			phy_set_mode(dwc->usb3_generic_phy, PHY_MODE_USB_HOST);
-			phy_calibrate(dwc->usb2_generic_phy);
 		}
 		break;
 	case DWC3_GCTL_PRTCAP_DEVICE:
@@ -1166,7 +1165,6 @@ static int dwc3_core_init_mode(struct dwc3 *dwc)
 				dev_err(dev, "failed to initialize host\n");
 			return ret;
 		}
-		phy_calibrate(dwc->usb2_generic_phy);
 		break;
 	case USB_DR_MODE_OTG:
 		INIT_WORK(&dwc->drd_work, __dwc3_set_mode);
-- 
2.17.1
