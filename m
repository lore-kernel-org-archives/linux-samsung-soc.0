From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH] ARM: EXYNOS: Recognize Samsung MFC v8 devices
Date: Thu,  4 Dec 2014 20:55:04 +0100
Message-ID: <1417722904-3171-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:52201 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753877AbaLDTzJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Dec 2014 14:55:09 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Also setup memory allocations for version 8 of the MFC as present in
Samsung Exynos 5422/5800 SoCs

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 arch/arm/mach-exynos/exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index c13d083..b343a1a 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -282,6 +282,7 @@ static void __init exynos_reserve(void)
 		"samsung,mfc-v5",
 		"samsung,mfc-v6",
 		"samsung,mfc-v7",
+		"samsung,mfc-v8",
 	};
 
 	for (i = 0; i < ARRAY_SIZE(mfc_mem); i++)
-- 
2.1.3
