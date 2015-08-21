From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/7] usb: dwc2: fix unbalanced phy control
Date: Fri, 21 Aug 2015 14:38:42 +0200
Message-ID: <1440160723-6636-7-git-send-email-m.szyprowski@samsung.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robert Baldyga <r.baldyga@samsung.com>, John Youn <johnyoun@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Even when DWC2 is in (internal) suspended state, it should disable PHY
in suspend and then enable it in resume. This patch fixes unbalanced PHY
control sequence.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/usb/dwc2/platform.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 90935304185a..dad15ad1ecb4 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -290,8 +290,6 @@ static int __maybe_unused dwc2_suspend(struct device *dev)
 	if (dwc2_is_device_mode(dwc2)) {
 		ret = s3c_hsotg_suspend(dwc2);
 	} else {
-		if (dwc2->lx_state == DWC2_L0)
-			return 0;
 		phy_exit(dwc2->phy);
 		phy_power_off(dwc2->phy);
 
-- 
1.9.2
