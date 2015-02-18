From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] ARM: dts: Update lid and power pin-functions for exynos5250-spring
Date: Wed, 18 Feb 2015 17:17:25 +0100
Message-ID: <1424276245-7028-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46873 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751712AbbBRQSF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Feb 2015 11:18:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Vincent Palatin <vpalatin@chromium.org>, Doug Anderson <dianders@chromium.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, open list <linux-kernel@vger.kernel.org>

Configure the pins in external interrupt mode, as done for Snow in
e5e5c6d14e39 ("ARM: dts: Add power and lid GPIO keys pinctrl for
exynos5250-snow").

Reported-by: Kukjin Kim <kgene@kernel.org>
Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk=
>
=46ixes: 53dd4138bb0a ("ARM: dts: Add exynos5250-spring device tree")
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dt=
s/exynos5250-spring.dts
index c41600e587e0..d075a68ac078 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -482,7 +482,7 @@
=20
 	power_key_irq: power-key-irq {
 		samsung,pins =3D "gpx1-3";
-		samsung,pin-function =3D <0>;
+		samsung,pin-function =3D <0xf>;
 		samsung,pin-pud =3D <0>;
 		samsung,pin-drv =3D <0>;
 	};
@@ -510,7 +510,7 @@
=20
 	lid_irq: lid-irq {
 		samsung,pins =3D "gpx3-5";
-		samsung,pin-function =3D <0>;
+		samsung,pin-function =3D <0xf>;
 		samsung,pin-pud =3D <0>;
 		samsung,pin-drv =3D <0>;
 	};
--=20
2.1.4
