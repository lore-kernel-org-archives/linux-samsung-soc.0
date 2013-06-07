From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/3] ARM: dts: Add FIMD node to Origen4210 board
Date: Fri,  7 Jun 2013 16:37:14 +0530
Message-ID: <1370603235-11193-3-git-send-email-tushar.behera@linaro.org>
References: <1370603235-11193-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370603235-11193-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org, Sachin Kamat <sachin.kamat@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Sachin Kamat <sachin.kamat@linaro.org>

Added FIMD and display timing node to Origen4210 board.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index bcf8079..4c6c3cd 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -290,4 +290,25 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	fimd@11c00000 {
+		pinctrl-0 = <&lcd_en &lcd_clk &lcd_data24 &pwm0_out>;
+		pinctrl-names = "default";
+		status = "okay";
+	};
+
+	display-timings {
+		native-mode = <&timing0>;
+		timing0: timing {
+			clock-frequency = <50000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <64>;
+			hback-porch = <16>;
+			hsync-len = <48>;
+			vback-porch = <64>;
+			vfront-porch = <16>;
+			vsync-len = <3>;
+		};
+	};
 };
-- 
1.7.9.5
