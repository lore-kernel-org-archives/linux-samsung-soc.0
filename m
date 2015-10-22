From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 2/3] dt-bindings: Consolidate Exynos SoC bindings
Date: Thu, 22 Oct 2015 10:25:29 +0900
Message-ID: <1445477130-407-2-git-send-email-k.kozlowski@samsung.com>
References: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos SoC Device Tree bindings are spread over arm/exynos/ and
arm/samsung/ directories. There is no need for that separation and it
actually confuses. Put power domain bindings under power/ and
remaining samsung-boards.txt under arm/samsung/.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Move power_domain.txt to power/pd-samsung.txt.
2. The smp-sysram.txt is moved in previous patch to sram/ directory
   (Suggested by Rob Herring).
3. Added Javier's reviewed-by. Although there are some differences since
   v1 but this is merely re-organization. Please let me know if the
   review tag is no longer valid.
---
 Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt    | 0
 .../bindings/{arm/exynos/power_domain.txt => power/pd-samsung.txt}        | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt (100%)
 rename Documentation/devicetree/bindings/{arm/exynos/power_domain.txt => power/pd-samsung.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/samsung-boards.txt
rename to Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/power/pd-samsung.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/exynos/power_domain.txt
rename to Documentation/devicetree/bindings/power/pd-samsung.txt
-- 
1.9.1
