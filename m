From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 03/10] pinctrl: samsung: Document hidden requirement about one external wakeup
Date: Thu, 19 Jul 2018 18:00:43 +0200
Message-ID: <20180719160050.22566-4-krzk@kernel.org>
References: <20180719160050.22566-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180719160050.22566-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hardware (S5Pv210 and all Exynos SoCs) provides only 32 external
interrupts which can wakeup device from deep sleep modes.  On S5Pv210
these are gph0-gph3.  On all Exynos designs these are gpx0-gpx3.
There is only pne 32-bit register for controlling the external wakeup
interrupt mask (masking and unmasking waking capability of these
interrupts).

This lead to implementation in pinctrl driver and machine code which was
using static memory for storing the mask value and not caring about
multiple devices of pin controller... because only one pin controller
device will be handling these.

This corresponds to hidden assumption in parsing the Device Tree.  Make
this assumption an explicit requirement.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 5e00a21de2bf..f7700c9e0d0b 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -145,8 +145,13 @@ A. External GPIO Interrupts: For supporting external gpio interrupts, the
 
 B. External Wakeup Interrupts: For supporting external wakeup interrupts, a
    child node representing the external wakeup interrupt controller should be
-   included in the pin-controller device node. This child node should include
-   the following properties.
+   included in the pin-controller device node.
+
+   Only one pin-controller device node can include external wakeup interrupts
+   child node (in other words, only one External Wakeup Interrupts
+   pin-controller is supported).
+
+   This child node should include following properties:
 
    - compatible: identifies the type of the external wakeup interrupt controller
      The possible values are:
-- 
2.14.1
