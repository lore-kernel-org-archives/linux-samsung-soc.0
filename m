From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 13/13] exynos: bump version number
Date: Tue, 22 Sep 2015 17:55:02 +0200
Message-ID: <1442937302-8211-14-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40840 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758612AbbIVQCb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Sep 2015 12:02:31 -0400
In-Reply-To: <1442937302-8211-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

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
2.0.5
