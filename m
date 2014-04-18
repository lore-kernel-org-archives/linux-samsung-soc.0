From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 3/5] ARM: dts: exynos4210-trats: add super device node for
 exynos drm
Date: Fri, 18 Apr 2014 15:41:08 +0900
Message-ID: <1397803270-5377-4-git-send-email-inki.dae@samsung.com>
References: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-trats.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 02c6768..a41c109 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -414,6 +414,11 @@
 		status = "okay";
 	};
 
+	display-subsystem {
+		compatible = "samsung,exynos-display-subsystem";
+		ports = <&fimd>, <&dsi_0>;
+	};
+
 	camera {
 		pinctrl-names = "default";
 		pinctrl-0 = <>;
-- 
1.7.9.5
