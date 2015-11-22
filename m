From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 13/13] exynos: bump version number
Date: Sun, 22 Nov 2015 19:48:43 +0100
Message-ID: <1448218123-21292-14-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45829 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752136AbbKVSze (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 13:55:34 -0500
In-Reply-To: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, inki.dae@samsung.com, human.hwang@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The Exynos API was extended quite a bit, so reflect this in the
version number.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/libdrm_exynos.pc.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exynos/libdrm_exynos.pc.in b/exynos/libdrm_exynos.pc.in
index 5ce9118..ff1c432 100644
--- a/exynos/libdrm_exynos.pc.in
+++ b/exynos/libdrm_exynos.pc.in
@@ -5,7 +5,7 @@ includedir=@includedir@
 
 Name: libdrm_exynos
 Description: Userspace interface to exynos kernel DRM services
-Version: 0.6
+Version: 0.7
 Libs: -L${libdir} -ldrm_exynos
 Cflags: -I${includedir} -I${includedir}/libdrm -I${includedir}/exynos
 Requires.private: libdrm
-- 
2.4.9
