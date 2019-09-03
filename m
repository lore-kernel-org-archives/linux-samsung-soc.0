From: Guillaume Gardet <guillaume.gardet@arm.com>
Subject: [PATCH] dt-bindings: gpu: mali-midgard: Add samsung exynos5250
 compatible
Date: Tue,  3 Sep 2019 09:33:00 +0200
Message-ID: <20190903073300.5927-1-guillaume.gardet@arm.com>
References: <20190830104502.7128-2-guillaume.gardet@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830104502.7128-2-guillaume.gardet@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Guillaume Gardet <guillaume.gardet@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add "samsung,exynos5250-mali" binding.

Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index b99a43bb471a..47bc1ac36426 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -30,12 +30,15 @@ properties:
           - enum:
              - rockchip,rk3399-mali
           - const: arm,mali-t860
+      - items:
+          - enum:
+             - samsung,exynos5250-mali
+          - const: arm,mali-t604
       - items:
           - enum:
              - samsung,exynos5433-mali
           - const: arm,mali-t760
 
-          # "arm,mali-t604"
           # "arm,mali-t624"
           # "arm,mali-t628"
           # "arm,mali-t830"
-- 
2.23.0
