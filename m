From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix compilation warning in common.c
Date: Tue, 13 Mar 2012 12:03:05 +0530
Message-ID: <1331620385-10877-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:61517 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750931Ab2CMGkH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 02:40:07 -0400
Received: by dajr28 with SMTP id r28so385555daj.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Mar 2012 23:40:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

The following warning is fixed in common.c file:
"warning: unused variable =E2=80=98ret=E2=80=99 [-Wunused-variable]"

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/common.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/commo=
n.c
index a6e6ad2..4610452 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -585,8 +585,6 @@ core_initcall(exynos_core_init);
 #ifdef CONFIG_CACHE_L2X0
 static int __init exynos4_l2x0_cache_init(void)
 {
-	int ret;
-
 	if (soc_is_exynos5250())
 		return 0;
=20
--=20
1.7.4.1
