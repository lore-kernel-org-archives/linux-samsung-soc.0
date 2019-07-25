From: Guillaume <guillaume.gardet@arm.com>
Subject: [PATCH V2 2/2] dt-bindings: gpu: mali-midgard: Add samsung exynos5250
 compatible
Date: Thu, 25 Jul 2019 10:34:33 +0200
Message-ID: <20190725083433.6505-2-guillaume.gardet@arm.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725083433.6505-1-guillaume.gardet@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Guillaume GARDET <guillaume.gardet@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Guillaume GARDET <guillaume.gardet@arm.com>

Add "samsung,exynos5250-mali" binding.

Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
V2 changes: new patch for V2 serie

 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 9b298edec5b2..bdd1396d9cc3 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -17,6 +17,7 @@ Required properties:
   * which must be preceded by one of the following vendor specifics:
     + "allwinner,sun50i-h6-mali"
     + "amlogic,meson-gxm-mali"
+    + "samsung,exynos5250-mali"
     + "samsung,exynos5433-mali"
     + "rockchip,rk3288-mali"
     + "rockchip,rk3399-mali"
-- 
2.22.0
