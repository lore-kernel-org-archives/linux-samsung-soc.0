From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v3 PATCH 13/16] ARM: dts: exynos4: add system register node
Date: Sun, 27 Apr 2014 10:50:09 +0900
Message-ID: <1398563412-21781-14-git-send-email-yj44.cho@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds sysreg property to fimd device node which is required
to use I80 interface.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 3d14cdb..a10aa50 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -528,6 +528,7 @@
 		clocks = <&clock 140>, <&clock 283>;
 		clock-names = "sclk_fimd", "fimd";
 		samsung,power-domain = <&pd_lcd0>;
+		samsung,sysreg = <&sys_reg>;
 		status = "disabled";
 	};
 };
-- 
1.7.9.5
