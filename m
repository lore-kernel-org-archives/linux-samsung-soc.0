From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2] ARM: dts: Add syscon property to the MIPI phy in exynos5420
Date: Thu, 14 May 2015 14:40:40 +0200
Message-ID: <1431607240-14549-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:36452 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932694AbbENMli (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 08:41:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?UTF-8?q?Krzysztof=20Koz=C5=82owski?= <k.kozlowski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Since e4b3d38088df6f3acd40 ("phy: exynos-video-mipi: Fix regression by
adding support for PMU regmap") the syscon property is required in
samsung,s5pv210-mipi-video-phy nodes, but this DTS hadn't been updated
yet.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Koz=C5=82owski <k.kozlowski@samsung.com>

--

v2:	* Remove reg property as suggested by Javier
	* Added his Reviewed-by
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exyn=
os5420.dtsi
index 4531753..78bcbc0 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -541,7 +541,7 @@
=20
 	mipi_phy: video-phy@10040714 {
 		compatible =3D "samsung,s5pv210-mipi-video-phy";
-		reg =3D <0x10040714 12>;
+		syscon =3D <&pmu_system_controller>;
 		#phy-cells =3D <1>;
 	};
=20
--=20
2.4.0
