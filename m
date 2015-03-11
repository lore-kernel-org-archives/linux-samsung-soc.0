From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 6/7] exynos: add fimg2d header to common includes
Date: Wed, 11 Mar 2015 20:38:45 +0100
Message-ID: <1426102726-27078-6-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1426102726-27078-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33750 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751670AbbCKTjE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 15:39:04 -0400
In-Reply-To: <1426102726-27078-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The reason for this change is to let userspace use the header.
Currently 'make install' does not install it.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reviewed-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 exynos/Makefile.am | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/exynos/Makefile.am b/exynos/Makefile.am
index 1715a85..35bc71f 100644
--- a/exynos/Makefile.am
+++ b/exynos/Makefile.am
@@ -14,11 +14,10 @@ libdrm_exynos_la_LIBADD = ../libdrm.la @PTHREADSTUBS_LIBS@
 libdrm_exynos_la_SOURCES = \
 	exynos_drm.c \
 	exynos_fimg2d.c \
-	exynos_fimg2d.h \
 	fimg2d_reg.h
 
 libdrm_exynoscommonincludedir = ${includedir}/exynos
-libdrm_exynoscommoninclude_HEADERS = exynos_drm.h
+libdrm_exynoscommoninclude_HEADERS = exynos_drm.h exynos_fimg2d.h
 
 libdrm_exynosincludedir = ${includedir}/libdrm
 libdrm_exynosinclude_HEADERS = exynos_drmif.h
-- 
2.0.5
