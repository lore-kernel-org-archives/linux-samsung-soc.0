From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFC 3/9] dt-bindings: arm: samsung: Document missing Exynos7 boards bindings
Date: Fri, 23 Aug 2019 16:53:50 +0200
Message-ID: <20190823145356.6341-3-krzk@kernel.org>
References: <20190823145356.6341-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823145356.6341-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: notify@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing documentation of ARMv8 Samsung Exynos7 SoC based boards
bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index f8da3b5fb374..c640191c5d73 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -174,6 +174,12 @@ properties:
               - samsung,tm2e                    # Samsung TM2E
           - const: samsung,exynos5433
 
+      - description: Exynos7 based boards
+        items:
+          - enum:
+              - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
+          - const: samsung,exynos7
+
   firmware:
     type: object
     description:
-- 
2.17.1
