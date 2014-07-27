From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 3/3] ARM: EXYNOS: Add support for Exynos5410 PMU
Date: Sun, 27 Jul 2014 14:22:05 +0200
Message-ID: <1406463725-4208-4-git-send-email-afaerber@suse.de>
References: <1406463725-4208-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406463725-4208-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Tarek Dakhran <t.dakhran@samsung.com>, Kevin Hilman <khilman@linaro.org>, Pankaj Dubey <pankaj.dubey@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Russell King <linux@arm.linux.org.uk>
List-Id: linux-samsung-soc@vger.kernel.org

Exynos initialization code now relies on obtaining the PMU address,
so add the new 5410 value to the list of compatible string matches.
This unbreaks booting on 5410 based boards.

=46ixes: fce9e5bb2526 ("ARM: EXYNOS: Add support for mapping PMU base a=
ddress via DT")
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/mach-exynos/exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exyno=
s.c
index df41bd190dfb..a83a312299a3 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -252,6 +252,7 @@ static const struct of_device_id exynos_dt_pmu_matc=
h[] =3D {
 	{ .compatible =3D "samsung,exynos4212-pmu" },
 	{ .compatible =3D "samsung,exynos4412-pmu" },
 	{ .compatible =3D "samsung,exynos5250-pmu" },
+	{ .compatible =3D "samsung,exynos5410-pmu" },
 	{ .compatible =3D "samsung,exynos5420-pmu" },
 	{ /*sentinel*/ },
 };
--=20
1.9.3
