From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] dt-bindings: Consolidate Exynos SoC bindings under Samsung
 directory
Date: Wed, 21 Oct 2015 10:30:50 +0900
Message-ID: <1445391051-3727-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos SoC Device Tree bindings are spread over arm/exynos/ and
arm/samsung/ directories. There is no need for that separation and it
actually confuses. Put everything under arm/samsung/.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 .../devicetree/bindings/arm/{exynos => samsung}/power_domain.txt          | 0
 Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt    | 0
 Documentation/devicetree/bindings/arm/{exynos => samsung}/smp-sysram.txt  | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/arm/{exynos => samsung}/power_domain.txt (100%)
 rename Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt (100%)
 rename Documentation/devicetree/bindings/arm/{exynos => samsung}/smp-sysram.txt (100%)

diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/samsung/power_domain.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/exynos/power_domain.txt
rename to Documentation/devicetree/bindings/arm/samsung/power_domain.txt
diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/samsung-boards.txt
rename to Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
diff --git a/Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt b/Documentation/devicetree/bindings/arm/samsung/smp-sysram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt
rename to Documentation/devicetree/bindings/arm/samsung/smp-sysram.txt
-- 
1.9.1
