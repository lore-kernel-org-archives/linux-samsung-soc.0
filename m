From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v5 05/10] ARM: dts: Move dp_hpd from exynos5250 into smdk5250 and snow
Date: Fri,  1 Aug 2014 06:54:52 +0200
Message-ID: <1406868897-26874-6-git-send-email-afaerber@suse.de>
References: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406868897-26874-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Spring uses a different GPIO, so this is not a generic SoC piece.

Suggested-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v5: New (Tomasz Figa)
 Frees dp_hpd for Spring.

 arch/arm/boot/dts/exynos5250-pinctrl.dtsi | 7 -------
 arch/arm/boot/dts/exynos5250-smdk5250.dts | 9 +++++++++
 arch/arm/boot/dts/exynos5250-snow.dts     | 7 +++++++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/=
dts/exynos5250-pinctrl.dtsi
index 886cfca044ac..ed0e5230514b 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -581,13 +581,6 @@
 			samsung,pin-pud =3D <0>;
 			samsung,pin-drv =3D <0>;
 		};
-
-		dp_hpd: dp_hpd {
-			samsung,pins =3D "gpx0-7";
-			samsung,pin-function =3D <3>;
-			samsung,pin-pud =3D <0>;
-			samsung,pin-drv =3D <0>;
-		};
 	};
=20
 	pinctrl@13400000 {
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/=
dts/exynos5250-smdk5250.dts
index aaa055ac0fe3..5d30fe1dcda4 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -414,3 +414,12 @@
 		};
 	};
 };
+
+&pinctrl_0 {
+	dp_hpd: dp_hpd {
+		samsung,pins =3D "gpx0-7";
+		samsung,pin-function =3D <3>;
+		samsung,pin-pud =3D <0>;
+		samsung,pin-drv =3D <0>;
+	};
+};
diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/=
exynos5250-snow.dts
index c4b0c73c736d..a9a2f2743794 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -547,6 +547,13 @@
 };
=20
 &pinctrl_0 {
+	dp_hpd: dp_hpd {
+		samsung,pins =3D "gpx0-7";
+		samsung,pin-function =3D <3>;
+		samsung,pin-pud =3D <0>;
+		samsung,pin-drv =3D <0>;
+	};
+
 	ec_irq: ec-irq {
 		samsung,pins =3D "gpx1-6";
 		samsung,pin-function =3D <0>;
--=20
1.9.3
