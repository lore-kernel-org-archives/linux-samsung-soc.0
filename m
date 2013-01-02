From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/4] ARM: EXYNOS: Update MFC DT binding documentation
Date: Wed,  2 Jan 2013 14:16:06 +0530
Message-ID: <1357116369-20784-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:59826 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229Ab3ABJAo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 04:00:44 -0500
Received: by mail-pb0-f52.google.com with SMTP id ro2so7704070pbb.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jan 2013 01:00:44 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, Arun Kumar K <arun.kk@samsung.com>

Added an example for bindings for illustration and clarity.

Cc: devicetree-discuss@lists.ozlabs.org
Cc: Arun Kumar K <arun.kk@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 .../devicetree/bindings/media/s5p-mfc.txt          |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/s5p-mfc.txt b/Documentation/devicetree/bindings/media/s5p-mfc.txt
index 67ec3d4..261c9dc 100644
--- a/Documentation/devicetree/bindings/media/s5p-mfc.txt
+++ b/Documentation/devicetree/bindings/media/s5p-mfc.txt
@@ -21,3 +21,16 @@ Required properties:
 
   - samsung,mfc-l : Base address of the second memory bank used by MFC
 		    for DMA contiguous memory allocation and its size.
+
+Example:
+
+mfc: codec@13400000 {
+	compatible = "samsung,mfc-v5";
+	reg = <0x13400000 0x10000>;
+	interrupts = <0 94 0>;
+};
+
+codec@13400000 {
+	samsung,mfc-r = <0x43000000 0x800000>;
+	samsung,mfc-l = <0x51000000 0x800000>;
+};
-- 
1.7.4.1
