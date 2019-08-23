From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 2/9] dt-bindings: arm: samsung: Document missing S5Pv210 boards bindings
Date: Fri, 23 Aug 2019 16:53:49 +0200
Message-ID: <20190823145356.6341-2-krzk@kernel.org>
References: <20190823145356.6341-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823145356.6341-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: notify@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing documentation of Samsung S5Pv210 SoC based boards bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/arm/samsung/samsung-boards.yaml           | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index e963fd70c436..f8da3b5fb374 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -14,6 +14,16 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - description: S5PV210 based boards
+        items:
+          - enum:
+              - aesop,torbreck                  # aESOP Torbreck based on S5PV210
+              - samsung,aquila                  # Samsung Aquila based on S5PC110
+              - samsung,goni                    # Samsung Goni based on S5PC110
+              - yic,smdkc110                    # YIC System SMDKC110 based on S5PC110
+              - yic,smdkv210                    # YIC System SMDKV210 based on S5PV210
+          - const: samsung,s5pv210
+
       - description: S5PV210 based Aries boards
         items:
           - enum:
-- 
2.17.1
