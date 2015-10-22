From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 1/3] dt-bindings: Consolidate SRAM bindings from all vendors
Date: Thu, 22 Oct 2015 10:25:28 +0900
Message-ID: <1445477130-407-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

SRAM bindings for various SoCs, using the mmio-sram genalloc
API, are spread over different places - per SoC vendor. Since all of
these are quite similar (they depend on mmio-sram) move them to a common
place.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

---

Changes since v1:
1. New patch. Extended suggestion from Rob.
---
 .../bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt}    | 0
 .../bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt}    | 0
 .../bindings/{arm/exynos/smp-sysram.txt => sram/samsung-sram.txt}         | 0
 Documentation/devicetree/bindings/{misc => sram}/sram.txt                 | 0
 .../devicetree/bindings/{soc/sunxi/sram.txt => sram/sunxi-sram.txt}       | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/rockchip/pmu-sram.txt => sram/rockchip-pmu-sram.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/rockchip/smp-sram.txt => sram/rockchip-smp-sram.txt} (100%)
 rename Documentation/devicetree/bindings/{arm/exynos/smp-sysram.txt => sram/samsung-sram.txt} (100%)
 rename Documentation/devicetree/bindings/{misc => sram}/sram.txt (100%)
 rename Documentation/devicetree/bindings/{soc/sunxi/sram.txt => sram/sunxi-sram.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt b/Documentation/devicetree/bindings/sram/rockchip-pmu-sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/rockchip/pmu-sram.txt
rename to Documentation/devicetree/bindings/sram/rockchip-pmu-sram.txt
diff --git a/Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt b/Documentation/devicetree/bindings/sram/rockchip-smp-sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/rockchip/smp-sram.txt
rename to Documentation/devicetree/bindings/sram/rockchip-smp-sram.txt
diff --git a/Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt b/Documentation/devicetree/bindings/sram/samsung-sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/exynos/smp-sysram.txt
rename to Documentation/devicetree/bindings/sram/samsung-sram.txt
diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/sram/sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/misc/sram.txt
rename to Documentation/devicetree/bindings/sram/sram.txt
diff --git a/Documentation/devicetree/bindings/soc/sunxi/sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
similarity index 100%
rename from Documentation/devicetree/bindings/soc/sunxi/sram.txt
rename to Documentation/devicetree/bindings/sram/sunxi-sram.txt
-- 
1.9.1
