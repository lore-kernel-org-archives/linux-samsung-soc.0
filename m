From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Add missing definition for IRQ_I2S0
Date: Tue, 27 Mar 2012 10:41:46 +0530
Message-ID: <1332825106-10898-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:59323 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752115Ab2C0FT1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 01:19:27 -0400
Received: by pbcun15 with SMTP id un15so6916351pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Mar 2012 22:19:27 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

This fixes following build error when sound support is selected
on EXYNOS4 platform.

sound/soc/samsung/idma.c: In function =E2=80=98idma_close=E2=80=99:
sound/soc/samsung/idma.c:327:11: error: =E2=80=98IRQ_I2S0=E2=80=99 unde=
clared (first use in this function)

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/include/mach/irqs.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/irqs.h b/arch/arm/mach-e=
xynos/include/mach/irqs.h
index 9bee853..591e785 100644
--- a/arch/arm/mach-exynos/include/mach/irqs.h
+++ b/arch/arm/mach-exynos/include/mach/irqs.h
@@ -212,6 +212,8 @@
 #define IRQ_MFC				EXYNOS4_IRQ_MFC
 #define IRQ_SDO				EXYNOS4_IRQ_SDO
=20
+#define IRQ_I2S0			EXYNOS4_IRQ_I2S0
+
 #define IRQ_ADC				EXYNOS4_IRQ_ADC0
 #define IRQ_TC				EXYNOS4_IRQ_PEN0
=20
--=20
1.7.4.1
