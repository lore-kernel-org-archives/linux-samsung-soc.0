From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] ARM: dts: Update exynos5250-spring with mmc node changes
Date: Wed, 18 Feb 2015 17:10:12 +0100
Message-ID: <1424275812-6797-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Resolve a merge conflict with mmc refactoring aaa25a5a33cb ("ARM: dts:
unuse the slot-node and deprecate the supports-highspeed for dw-mmc in
exynos") by dropping the slot@0 nodes, moving its bus-width property to
the mmc node and replacing supports-highspeed with cap-{mmc,sd}-highspe=
ed,
matching exynos5250-snow.

Cc: Jaehoon Chung <jh80.chung@samsung.com>
=46ixes: 53dd4138bb0a ("ARM: dts: Add exynos5250-spring device tree")
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dt=
s/exynos5250-spring.dts
index f02775487cd4..c41600e587e0 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -429,7 +429,6 @@
 &mmc_0 {
 	status =3D "okay";
 	num-slots =3D <1>;
-	supports-highspeed;
 	broken-cd;
 	card-detect-delay =3D <200>;
 	samsung,dw-mshc-ciu-div =3D <3>;
@@ -437,11 +436,8 @@
 	samsung,dw-mshc-ddr-timing =3D <1 2>;
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&sd0_clk &sd0_cmd &sd0_cd &sd0_bus4 &sd0_bus8>;
-
-	slot@0 {
-		reg =3D <0>;
-		bus-width =3D <8>;
-	};
+	bus-width =3D <8>;
+	cap-mmc-highspeed;
 };
=20
 /*
@@ -451,7 +447,6 @@
 &mmc_1 {
 	status =3D "okay";
 	num-slots =3D <1>;
-	supports-highspeed;
 	broken-cd;
 	card-detect-delay =3D <200>;
 	samsung,dw-mshc-ciu-div =3D <3>;
@@ -459,11 +454,8 @@
 	samsung,dw-mshc-ddr-timing =3D <1 2>;
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&sd1_clk &sd1_cmd &sd1_cd &sd1_bus4>;
-
-	slot@0 {
-		reg =3D <0>;
-		bus-width =3D <4>;
-	};
+	bus-width =3D <4>;
+	cap-sd-highspeed;
 };
=20
 &pinctrl_0 {
--=20
2.1.4
