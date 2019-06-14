From: Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
Date: Fri, 14 Jun 2019 13:31:43 -0700
Message-ID: <20190614203144.3850-1-joseph.kogut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Document vendor specific compatible string for Mali gpus on Exynos SoCs.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
index 1b1a74129141..a9704c736d07 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
@@ -18,6 +18,7 @@ Required properties:
     + "amlogic,meson-gxm-mali"
     + "rockchip,rk3288-mali"
     + "rockchip,rk3399-mali"
+    + "samsung,exynos-mali"
 
 - reg : Physical base address of the device and length of the register area.
 
-- 
2.22.0
