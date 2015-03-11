From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v4 2/3] ARM: EXYNOS: Constify exynos_pm_data array
Date: Wed, 11 Mar 2015 12:08:40 +0100
Message-ID: <1426072121-6822-2-git-send-email-k.kozlowski@samsung.com>
References: <1426072121-6822-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:32553 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752400AbbCKLIv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 07:08:51 -0400
In-reply-to: <1426072121-6822-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Marek Szyprowski <m.szyprowski@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The 'exynos5420_pm_data' is not modified and can be made const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---

Notes:
    Changes since v3:
    1. The 'of_device_id' was already constifyied by Uwe Kleine-K=C3=B6=
nig.
   =20
    Changes since v2:
    1. Add Pankaj's reviewed-by.
   =20
    Changes since v1:
    1. New patch.

 arch/arm/mach-exynos/suspend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/susp=
end.c
index 2fefb7073083..d42fb1cd202d 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -576,7 +576,7 @@ static const struct exynos_pm_data exynos5250_pm_da=
ta =3D {
 	.cpu_suspend	=3D exynos_cpu_suspend,
 };
=20
-static struct exynos_pm_data exynos5420_pm_data =3D {
+static const struct exynos_pm_data exynos5420_pm_data =3D {
 	.wkup_irq	=3D exynos5250_wkup_irq,
 	.wake_disable_mask =3D (0x7F << 7) | (0x1F << 1),
 	.release_ret_regs =3D exynos5420_release_ret_regs,
--=20
1.9.1
