From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH 1/2] Documentation: dt-bindings: Add aliases information for
 Exynos7 pin controllers
Date: Wed, 10 Dec 2014 14:09:39 +0530
Message-ID: <1418200780-22363-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, kgene@kernel.org, alim.akhtar@samsung.com, Vivek Gautam <gautam.vivek@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Adding list of aliases for supported Exynos7 pin controller blocks.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/pinctrl/samsung-pinctrl.txt          |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 8425838..742e472 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -171,6 +171,16 @@ Aliases:
 All the pin controller nodes should be represented in the aliases node using
 the following format 'pinctrl{n}' where n is a unique number for the alias.
 
+Aliases for controllers compatible with "samsung,exynos7-pinctrl":
+- pinctrl0: pin controller of ALIVE block,
+- pinctrl1: pin controller of BUS0 block,
+- pinctrl2: pin controller of NFC block,
+- pinctrl3: pin controller of TOUCH block,
+- pinctrl4: pin controller of FF block,
+- pinctrl5: pin controller of ESE block,
+- pinctrl6: pin controller of FSYS0 block,
+- pinctrl7: pin controller of FSYS1 block,
+
 Example: A pin-controller node with pin banks:
 
 	pinctrl_0: pinctrl@11400000 {
-- 
1.7.10.4
