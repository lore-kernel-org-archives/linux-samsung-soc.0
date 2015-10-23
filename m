From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 2/3] dt-bindings: Consolidate Exynos SoC bindings
Date: Fri, 23 Oct 2015 10:39:20 +0900
Message-ID: <1445564361-16974-2-git-send-email-k.kozlowski@samsung.com>
References: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:64120 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S966200AbbJWBkd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Oct 2015 21:40:33 -0400
In-reply-to: <1445564361-16974-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org

Exynos SoC Device Tree bindings are spread over arm/exynos/ and
arm/samsung/ directories. There is no need for that separation and it
actually confuses. Put power domain bindings under power/ and
remaining samsung-boards.txt under arm/samsung/.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v2:
1. Update path pointing to pd-samsung.txt in samsung,sysmmu.txt.

Changes since v1:
1. Move power_domain.txt to power/pd-samsung.txt.
2. The smp-sysram.txt is moved in previous patch to sram/ directory
   (Suggested by Rob Herring).
3. Added Javier's reviewed-by. Although there are some differences since
   v1 but this is merely re-organization. Please let me know if the
   review tag is no longer valid.
---
 Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt  | 0
 Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt              | 2 +-
 .../bindings/{arm/exynos/power_domain.txt => power/pd-samsung.txt}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/arm/{ => samsung}/samsung-boards.txt (100%)
 rename Documentation/devicetree/bindings/{arm/exynos/power_domain.txt => power/pd-samsung.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/samsung-boards.txt
rename to Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
diff --git a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
index 729543c47046..bc620fe32a70 100644
--- a/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
+++ b/Documentation/devicetree/bindings/iommu/samsung,sysmmu.txt
@@ -47,7 +47,7 @@ Required properties:
 - clocks: Required if the System MMU is needed to gate its clock.
 - power-domains: Required if the System MMU is needed to gate its power.
 	  Please refer to the following document:
-	  Documentation/devicetree/bindings/arm/exynos/power_domain.txt
+	  Documentation/devicetree/bindings/power/pd-samsung.txt
 
 Examples:
 	gsc_0: gsc@13e00000 {
diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/power/pd-samsung.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/exynos/power_domain.txt
rename to Documentation/devicetree/bindings/power/pd-samsung.txt
-- 
1.9.1
