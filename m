From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 04/10] dt-bindings: video: add PCLK clock entry to
 exynos5433-decon
Date: Tue, 20 Oct 2015 11:22:35 +0200
Message-ID: <1445332961-25419-5-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

DECON IP requires this clock to access configuration registers.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 Documentation/devicetree/bindings/video/exynos5433-decon.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/exynos5433-decon.txt b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
index 377afbf..3dff78b 100644
--- a/Documentation/devicetree/bindings/video/exynos5433-decon.txt
+++ b/Documentation/devicetree/bindings/video/exynos5433-decon.txt
@@ -16,7 +16,7 @@ Required properties:
 - clocks: must include clock specifiers corresponding to entries in the
 	  clock-names property.
 - clock-names: list of clock names sorted in the same order as the clocks
-	       property. Must contain "aclk_decon", "aclk_smmu_decon0x",
+	       property. Must contain "pclk", "aclk_decon", "aclk_smmu_decon0x",
 	       "aclk_xiu_decon0x", "pclk_smmu_decon0x", clk_decon_vclk",
 	       "sclk_decon_eclk"
 - ports: contains a port which is connected to mic node. address-cells and
-- 
1.9.1

