From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH 2/3] ARM: dts: Add the missing "\" key in non-US keyboards for exynos5250-snow
Date: Thu, 19 Dec 2013 14:36:17 -0800
Message-ID: <1387492578-22068-2-git-send-email-dianders@chromium.org>
References: <1387492578-22068-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f201.google.com ([209.85.192.201]:40008 "EHLO
	mail-pd0-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756157Ab3LSWmy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Dec 2013 17:42:54 -0500
Received: by mail-pd0-f201.google.com with SMTP id r10so252817pdi.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Dec 2013 14:42:53 -0800 (PST)
In-Reply-To: <1387492578-22068-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Simon Glass <sjg@chromium.org>, Samuel Ortiz <sameo@linux.intel.com>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, Doug Anderson <dianders@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

When the exynos5250 device tree was sent upstream the keyboard mapping
was missing the 2nd instance of the "\" key.  There are two copies of
the "\" because it simply has a different row and column on US and
non-US keyboards.

For more details, see the previous patch in this series: (mkbp: Fix
problems with backslash).

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 arch/arm/boot/dts/exynos5250-snow.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index fd711e2..28fe2e2 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -130,6 +130,7 @@
 							0x04060024	/* J */
 							0x04080027	/* ; */
 							0x04090026	/* L */
+							0x040a002b	/* \ */
 							0x040b001c	/* ENTER */
 
 							0x0501002c	/* Z */
-- 
1.8.5.1
