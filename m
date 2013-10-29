From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH] Documentation: clk-exynos5420: Correct id for usbd301
Date: Tue, 29 Oct 2013 22:04:28 +0530
Message-ID: <1383064468-4737-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Chander Kashyap <chander.kashyap@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Rahul Sharma <rahul.sharma@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Looking in clk-exynso5420 driver 'usbd301' falls at ID 367
instead of 377. Correct the same.
No functional change, just document correction.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
CC: Chander Kashyap <chander.kashyap@linaro.org>
CC: Thomas Abraham <thomas.abraham@linaro.org>
CC: Rahul Sharma <rahul.sharma@samsung.com>
CC: Tomasz Figa <t.figa@samsung.com>
CC: Mike Turquette <mturquette@linaro.org>
CC: Kukjin Kim <kgene.kim@samsung.com>
---
 .../devicetree/bindings/clock/exynos5420-clock.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
index 32aa34e..b08ad19 100644
--- a/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
+++ b/Documentation/devicetree/bindings/clock/exynos5420-clock.txt
@@ -128,7 +128,7 @@ clock which they consume.
   rtic			364
   usbh20		365
   usbd300		366
-  usbd301		377
+  usbd301		367
   aclk400_mscl		380
   mscl0			381
   mscl1			382
-- 
1.7.6.5

