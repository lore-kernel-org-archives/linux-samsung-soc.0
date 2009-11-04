From: jassisinghbrar@gmail.com
Subject: [PATCH 5/7] S3C AUDIO: Add header to pass platform data to device drivers.
Date: Wed,  4 Nov 2009 17:29:07 +0900
Message-ID: <1257323349-18481-5-git-send-email-jassisinghbrar@gmail.com>
References: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-3-git-send-email-jassisinghbrar@gmail.com>
 <1257323349-18481-4-git-send-email-jassisinghbrar@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:37787 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752366AbZKDIdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 03:33:23 -0500
In-Reply-To: <1257323349-18481-4-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Jassi Brar <jassi.brar@samsung.com>

From: Jassi Brar <jassi.brar@samsung.com>

Signed-off-by: Jassi Brar <jassi.brar@samsung.com>
---
 arch/arm/plat-s3c/include/plat/audio.h |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s3c/include/plat/audio.h

diff --git a/arch/arm/plat-s3c/include/plat/audio.h b/arch/arm/plat-s3c/include/plat/audio.h
new file mode 100644
index 0000000..9b2007c
--- /dev/null
+++ b/arch/arm/plat-s3c/include/plat/audio.h
@@ -0,0 +1,20 @@
+/* arch/arm/plat-s3c/include/plat/audio.h
+ *
+ * Copyright (c) 2009 Samsung Electronics Co. Ltd
+ * Author: Jaswinder Singh <jassi.brar@samsung.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+/**
+ * struct s3c_audio_pdata - common platform data for audio device drivers
+ * @pdata: Pointer to protocol(I2S, PCM or AC97) specific platform data
+ * @cfg_gpio: Callback function to setup mux'ed pins in I2S/PCM/AC97 mode
+ */
+struct s3c_audio_pdata {
+	void *pdata;
+
+	int (*cfg_gpio)(struct platform_device *);
+};
-- 
1.6.2.5
