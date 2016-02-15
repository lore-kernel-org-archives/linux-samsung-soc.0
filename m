From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2] rtc: s3c: Document in binding that only s3c6410 needs a src clk
Date: Mon, 15 Feb 2016 11:11:06 -0300
Message-ID: <1455545466-25709-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, devicetree@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The S3C binding doc says that the RTC and RTC source clocks are required
but the S3C driver supports different HW IP and only the s3c6410 needs a
source clock.

Fix the binding explaining that the source clock is only needed for the
s3c6410-rtc compatible controller.

Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

---
Hello,

This patch depends on a previous one that was picked by Rob Herring so
this one has to go through his tree again and not through the RTC tree
to avoid conflicts.

Best regards,
Javier

Changes in v2:
- Remove the mention to a commit sha-1 that's not in mainline (Alexandre).
- Fix typo in commit message (Alexandre).
- Add Alexandre's Acked-by tag.

 Documentation/devicetree/bindings/rtc/s3c-rtc.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
index 1068ffce9f91..fdde63a5419c 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
@@ -15,9 +15,10 @@ Required properties:
   is the rtc tick interrupt. The number of cells representing a interrupt
   depends on the parent interrupt controller.
 - clocks: Must contain a list of phandle and clock specifier for the rtc
-          and source clocks.
-- clock-names: Must contain "rtc" and "rtc_src" entries sorted in the
-               same order as the clocks property.
+          clock and in the case of a s3c6410 compatible controller, also
+          a source clock.
+- clock-names: Must contain "rtc" and for a s3c6410 compatible controller,
+               a "rtc_src" sorted in the same order as the clocks property.
 
 Example:
 
-- 
2.5.0
