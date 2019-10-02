From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/4] dt-bindings: rtc: s3c: Use defines instead of clock numbers
Date: Wed,  2 Oct 2019 18:07:42 +0200
Message-ID: <20191002160744.11307-2-krzk@kernel.org>
References: <20191002160744.11307-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002160744.11307-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sebastian Reichel <sre@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Make the examples in S3C RTC bindings more readable and bring them
closer to real DTS by using defines for clocks.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
index 95570d7e19eb..4d91cdc9b998 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
@@ -75,11 +75,14 @@ allOf:
 
 examples:
   - |
+    #include <dt-bindings/clock/exynos5420.h>
+    #include <dt-bindings/clock/samsung,s2mps11.h>
+
     rtc@10070000 {
         compatible = "samsung,s3c6410-rtc";
         reg = <0x10070000 0x100>;
         interrupts = <0 44 4>, <0 45 4>;
-        clocks = <&clock 0>, // CLK_RTC
-                 <&s2mps11_osc 0>; // S2MPS11_CLK_AP
+        clocks = <&clock CLK_RTC>,
+                 <&s2mps11_osc S2MPS11_CLK_AP>;
         clock-names = "rtc", "rtc_src";
     };
-- 
2.17.1
