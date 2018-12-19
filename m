From: =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 3/3] ARM: dts: s5pv210: Add node for exynos-rotator
Date: Wed, 19 Dec 2018 16:57:04 +0100
Message-ID: <20181219155704.15264-4-pawel.mikolaj.chmiel@gmail.com>
References: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: inki.dae@samsung.com, krzk@kernel.org, airlied@linux.ie
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit adds node for Exynos Rorator device,
so it can be used on all s5pv210 based devices.

Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 75f454a210d6..a5463003c7f6 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -542,6 +542,15 @@
 			#dma-requests = <1>;
 		};
 
+		rotator: rotator@fa300000 {
+			compatible = "samsung,s5pv210-rotator";
+			reg = <0xfa300000 0x1000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <4>;
+			clocks = <&clocks CLK_ROTATOR>;
+			clock-names = "rotator";
+		};
+
 		i2c1: i2c@fab00000 {
 			compatible = "samsung,s3c2440-i2c";
 			reg = <0xfab00000 0x1000>;
-- 
2.17.1
