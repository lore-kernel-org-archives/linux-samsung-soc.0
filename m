From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 2/2] usb: dwc3: remove generic PHY calibrate() calls
Date: Fri, 19 Jul 2019 10:13:26 +0200
Message-ID: <20190719081326.9347-1-m.szyprowski@samsung.com>
References: <20190719081212.9249-1-m.szyprowski@samsung.com>
        <CGME20190719081334eucas1p1fd614e56c1ec0dfa654d0bb77f17ba5d@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719081212.9249-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Calls to USB2 generic PHY calibrate() method has been moved to HCD core,
which now successfully handles generic PHYs and their calibration after
every HCD reset. This fixes all the timing issues related to PHY
calibration done directly from DWC3 driver: incorrect operation after
system suspend/resume or USB3.0 detection failure when XHCI-plat driver
compiled as separate module.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
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
