From: =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
Subject: [PATCH v3 4/4] ARM: dts: Enable EC vboot context support on Peach boards
Date: Mon, 21 Sep 2015 10:38:23 -0300
Message-ID: <1442842703-5309-5-git-send-email-emilio.lopez@collabora.co.uk>
References: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442842703-5309-1-git-send-email-emilio.lopez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, olof@lixom.net, kgene@kernel.org, k.kozlowski@samsung.com, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio.lopez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The Peach boards use the EC to store the vboot context information,
so add the corresponding properties on the EC node to indicate so.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Emilio L=C3=B3pez <emilio.lopez@collabora.co.uk>
---

Changes from v1:
 - none

Changes from v2:
 - collect tags from Krzysztof & Javier

 arch/arm/boot/dts/exynos5420-peach-pit.dts | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot=
/dts/exynos5420-peach-pit.dts
index 8f4d76c..ac02fb4 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -935,6 +935,7 @@
 		pinctrl-0 =3D <&ec_spi_cs &ec_irq>;
 		reg =3D <0>;
 		spi-max-frequency =3D <3125000>;
+		google,has-vbc-nvram;
=20
 		controller-data {
 			samsung,spi-feedback-delay =3D <1>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/=
dts/exynos5800-peach-pi.dts
index 7d5b386..b60dec0 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -898,6 +898,7 @@
 		pinctrl-0 =3D <&ec_spi_cs &ec_irq>;
 		reg =3D <0>;
 		spi-max-frequency =3D <3125000>;
+		google,has-vbc-nvram;
=20
 		controller-data {
 			samsung,spi-feedback-delay =3D <1>;
--=20
2.1.4
