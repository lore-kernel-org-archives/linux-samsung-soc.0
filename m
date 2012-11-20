From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Remove unused variables
Date: Tue, 20 Nov 2012 10:33:32 +0530
Message-ID: <1353387812-20001-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:50160 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750746Ab2KTFJl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 00:09:41 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so3995004pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Nov 2012 21:09:40 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

=46ixes following compilation warnings.

arch/arm/mach-exynos/common.c: In function =E2=80=98exynos5_init_irq=E2=
=80=99:
arch/arm/mach-exynos/common.c:661:6: warning: unused variable
=E2=80=98irq=E2=80=99 [-Wunused-variable]
arch/arm/mach-exynos/common.c: In function =E2=80=98exynos_init_irq_ein=
t=E2=80=99:
arch/arm/mach-exynos/common.c:1046:15: warning: unused variable
=E2=80=98paddr=E2=80=99 [-Wunused-variable]

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/common.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/commo=
n.c
index 9027f55..ef4f1b0 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -658,7 +658,6 @@ void __init exynos4_init_irq(void)
=20
 void __init exynos5_init_irq(void)
 {
-	int irq;
 	struct device_node *np;
=20
 #ifdef CONFIG_OF
@@ -1043,7 +1042,6 @@ static int __init exynos_init_irq_eint(struct dev=
ice_node *np,
 					struct device_node *parent)
 {
 	int irq, *src_int, irq_base, irq_eint;
-	unsigned int paddr;
=20
 #ifdef CONFIG_PINCTRL_SAMSUNG
 	/*
--=20
1.7.4.1
