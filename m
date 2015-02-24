From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 13/17] exynos: add fimg2d header to common includes
Date: Tue, 24 Feb 2015 15:20:51 +0100
Message-ID: <1424787655-10739-14-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47987 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753269AbbBXO2E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:28:04 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The reason for this change is to let userspace use the header.
Currently 'make install' does not install it.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
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
