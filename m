From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 4/5] ARM: dts: add mipi_phy device node to exynos3250.dtsi
Date: Mon, 18 Aug 2014 17:21:32 +0900
Message-ID: <1408350093-26220-5-git-send-email-inki.dae@samsung.com>
References: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408350093-26220-1-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, a.hajda@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds mipi_phy device node to reset, disable and enable
DSIM and CSIS PHY.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 0ec2584..2bab12f 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -132,6 +132,12 @@
 			reg = <0x10020000 0x4000>;
 		};
 
+		mipi_phy: video-phy@10020710 {
+			compatible = "samsung,s5pv210-mipi-video-phy";
+			reg = <0x10020710 8>;
+			#phy-cells = <1>;
+		};
+
 		pd_cam: cam-power-domain@10023C00 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C00 0x20>;
-- 
1.7.9.5
