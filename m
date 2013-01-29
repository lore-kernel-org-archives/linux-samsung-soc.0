From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/6] ARM: dts: Update MFC DT binding documentation
Date: Tue, 29 Jan 2013 09:43:37 +0530
Message-ID: <1359432822-23846-2-git-send-email-sachin.kamat@linaro.org>
References: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:64507 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab3A2EWr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 23:22:47 -0500
Received: by mail-da0-f49.google.com with SMTP id v40so11535dad.36
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jan 2013 20:22:47 -0800 (PST)
In-Reply-To: <1359432822-23846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, Arun Kumar K <arun.kk@samsung.com>

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
