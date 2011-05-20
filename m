From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH] ARM: exynos4: fix secondary CPU boot
Date: Fri, 20 May 2011 14:46:30 +0100
Message-ID: <1305899190-16732-1-git-send-email-marc.zyngier@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([94.185.240.25]:47658 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S934234Ab1ETNqB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 May 2011 09:46:01 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

Patch 7d30e8b38 (ARM: EXYNOS4: Add EXYNOS4 CPU initialization support)
renamed the s5pv310 to exynos4, and also changed the value of
EXYNOS4_PA_SYSRAM, which is used to release the secondary CPU from
spinning in BL0. As a result, CPU1 can't be brought up anymore.

This patch simply reverts EXYNOS4_PA_SYSRAM to its original value,
which results in a working CPU1.

Tested on an SMDK-v310.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm/mach-exynos4/include/mach/map.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exyno=
s4/include/mach/map.h
index 6330b73..862967f 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -23,7 +23,7 @@
=20
 #include <plat/map-s5p.h>
=20
-#define EXYNOS4_PA_SYSRAM=09=090x02020000
+#define EXYNOS4_PA_SYSRAM=09=090x02025000
=20
 #define EXYNOS4_PA_FIMC0=09=090x11800000
 #define EXYNOS4_PA_FIMC1=09=090x11810000
--=20
1.7.0.4
