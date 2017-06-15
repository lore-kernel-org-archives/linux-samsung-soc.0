From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: [PATCH v2 3/4] ARM: dts: exynos: Fix the active of reset gpios from
 rinato dts
Date: Thu, 15 Jun 2017 19:03:29 +0900
Message-ID: <1497521010-8429-4-git-send-email-hoegeun.kwon@samsung.com>
References: <1497521010-8429-1-git-send-email-hoegeun.kwon@samsung.com>
        <CGME20170615100342epcas1p4feeb3d12bb9e120bf40dc5945c4b2460@epcas1p4.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1497521010-8429-1-git-send-email-hoegeun.kwon@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, javier@osg.samsung.com, a.hajda@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This reset gpios is active low, therefore fix from active high to low.

Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 82e676a..de2702e 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -225,7 +225,7 @@
 		reg = <0>;
 		vdd3-supply = <&ldo16_reg>;
 		vci-supply = <&ldo20_reg>;
-		reset-gpios = <&gpe0 1 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpe0 1 GPIO_ACTIVE_LOW>;
 		te-gpios = <&gpx0 6 GPIO_ACTIVE_HIGH>;
 		power-on-delay= <30>;
 		power-off-delay= <120>;
-- 
1.9.1
