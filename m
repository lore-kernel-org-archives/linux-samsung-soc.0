From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 12/15] exynos: add fimg2d header to common includes
Date: Tue,  3 Feb 2015 14:54:02 +0100
Message-ID: <1422971645-30621-13-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46024 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965573AbbBCNye (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:34 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

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
