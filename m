From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] video: exynos: Ensure definitions match prototypes
Date: Tue,  2 Jul 2013 12:26:54 +0100
Message-ID: <1372764414-9102-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:37008 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752151Ab3GBL1D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Jul 2013 07:27:03 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jingoo Han <jg1.han@samsung.com>
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Ensure that the definitions of functions match the prototypes used by
other modules by including the header with the prototypes in the files
with the definitions.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/video/exynos/exynos_mipi_dsi_lowlevel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c b/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
index 15c5abd..c148d06 100644
--- a/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
+++ b/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
@@ -27,6 +27,7 @@
 #include <video/exynos_mipi_dsim.h>
 
 #include "exynos_mipi_dsi_regs.h"
+#include "exynos_mipi_dsi_lowlevel.h"
 
 void exynos_mipi_dsi_func_reset(struct mipi_dsim_device *dsim)
 {
-- 
1.8.3.1
