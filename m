From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC PATCH v2 07/14] ARM: dts: exynos_dsim: add exynos5420 compatible
 to DT bindings
Date: Wed, 16 Apr 2014 13:38:27 +0900
Message-ID: <1397623107-11467-1-git-send-email-yj44.cho@samsung.com>
References: <CAK9yfHwew_O57FuYiwohQUB1nhs5PJ5mg7TiPcPOvpbp=6sFgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAK9yfHwew_O57FuYiwohQUB1nhs5PJ5mg7TiPcPOvpbp=6sFgQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds relevant to exynos5420 compatible for exynos5420 SoC support.

Changelog v2:
- Changes title, description and fixes typo (commented by Sachin Kamat)

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 .../devicetree/bindings/video/exynos_dsim.txt      |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
index 33b5730..29bf3b2 100644
--- a/Documentation/devicetree/bindings/video/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
@@ -1,7 +1,9 @@
 Exynos MIPI DSI Master
 
 Required properties:
-  - compatible: "samsung,exynos4210-mipi-dsi"
+  - compatible: value should be one of the following
+			"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
+			"samsung,exynos5420-mipi-dsi" /* for Exynos5420 SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
1.7.9.5
