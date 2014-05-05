From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning
Date: Mon,  5 May 2014 14:56:48 +0530
Message-ID: <1399282008-9738-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:50576 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755586AbaEEJ2W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 May 2014 05:28:22 -0400
Received: by mail-pa0-f43.google.com with SMTP id bj1so1876809pad.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 May 2014 02:28:21 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, Rob Herring <robh@kernel.org>

of_get_flat_dt_prop return type is now const.
=46ixes the following compilation warning introduced by commit 9d0c4dfe=
dd96
("of/fdt: update of_get_flat_dt_prop in prep for libfdt")

arch/arm/mach-exynos/exynos.c:259:6: warning:
assignment discards =E2=80=98const=E2=80=99 qualifier from pointer targ=
et type [enabled by default]

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Rob Herring <robh@kernel.org>
---
Based on linux-next (20140505)
---
 arch/arm/mach-exynos/exynos.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exyno=
s.c
index 77293d39dfc9..f356c67a1fa9 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -249,7 +249,7 @@ static int __init exynos_fdt_map_chipid(unsigned lo=
ng node, const char *uname,
 					int depth, void *data)
 {
 	struct map_desc iodesc;
-	__be32 *reg;
+	const __be32 *reg;
 	int len;
=20
 	if (!of_flat_dt_is_compatible(node, "samsung,exynos4210-chipid") &&
--=20
1.7.9.5
