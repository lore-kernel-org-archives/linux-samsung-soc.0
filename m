From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] rtc: s3c: Document required clocks in the DT binding
Date: Tue,  9 Feb 2016 14:23:52 -0300
Message-ID: <1455038632-14545-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, rtc-linux@googlegroups.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The S3C Real Time Clock driver requires the clock and source clock to
be defined in the device node but that requirement is not documented.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 Documentation/devicetree/bindings/rtc/s3c-rtc.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
index ac2fcd6ff4b8..1068ffce9f91 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
@@ -14,6 +14,10 @@ Required properties:
   interrupt number is the rtc alarm interrupt and second interrupt number
   is the rtc tick interrupt. The number of cells representing a interrupt
   depends on the parent interrupt controller.
+- clocks: Must contain a list of phandle and clock specifier for the rtc
+          and source clocks.
+- clock-names: Must contain "rtc" and "rtc_src" entries sorted in the
+               same order as the clocks property.
 
 Example:
 
@@ -21,4 +25,6 @@ Example:
 		compatible = "samsung,s3c6410-rtc";
 		reg = <0x10070000 0x100>;
 		interrupts = <44 0 45 0>;
+		clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
+		clock-names = "rtc", "rtc_src";
 	};
-- 
2.5.0
