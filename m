From: Javi Merino <javi.merino@arm.com>
Subject: [PATCH] ARM: dts: Remove vmmc-supply for mmc@12220000 on arndale-octa board
Date: Fri, 25 Apr 2014 21:11:12 +0100
Message-ID: <1398456672-3936-1-git-send-email-javi.merino@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:43262 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754494AbaDYULW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 16:11:22 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Javi Merino <javi.merino@arm.com>

d726ca2d3316 (ARM: dts: Add vmmc-supply to MMC on arndale-octa board)
added the vmmc-supply to nodes mmc@12200000 and mmc@12220000 of the
DT.  However, this makes the kernel fail to boot on the arndale-octa
spews:

[    5.060000] dwmmc_exynos 12200000.mmc: num-slots property not found, ass=
uming 1 slot is available
[    5.065000] platform 12200000.mmc: Driver dwmmc_exynos requests probe de=
ferral
[    5.075000] dwmmc_exynos 12220000.mmc: num-slots property not found, ass=
uming 1 slot is available
[    5.085000] platform 12220000.mmc: Driver dwmmc_exynos requests probe de=
ferral

And eventually hangs.  Without the vmmc-supply property in the
mmc@12220000 node, the kernel boots again.

Signed-off-by: Javi Merino <javi.merino@arm.com>
---

Hi,

Note that I don't know *why* removing the property works, all I know
is that 3.15-rc2 fails to boot on my Arndale Octa unless I apply this
patch.

Cheers,
Javi

 arch/arm/boot/dts/exynos5420-arndale-octa.dts |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/=
dts/exynos5420-arndale-octa.dts
index 80a3bf4..722fb6c 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -64,7 +64,6 @@
 =09=09samsung,dw-mshc-ddr-timing =3D <1 2>;
 =09=09pinctrl-names =3D "default";
 =09=09pinctrl-0 =3D <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
-=09=09vmmc-supply =3D <&ldo10_reg>;
=20
 =09=09slot@0 {
 =09=09=09reg =3D <0>;
--=20
1.7.9.5
