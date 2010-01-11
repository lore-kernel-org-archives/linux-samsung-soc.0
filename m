From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 1/3] ARM: SAMSUNG: Add config option for number of additional GPIO pins.
Date: Mon, 11 Jan 2010 12:21:51 +0900
Message-ID: <1263180113-31605-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51276 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169Ab0AKD20 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Jan 2010 22:28:26 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

This patch adds a configuration option for specifing the number
of additional GPIO pins to be used in addition to the GPIO pins
supported onchip.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/plat-samsung/Kconfig |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 900b463..faec4b8 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -66,6 +66,14 @@ config S3C_GPIO_PULL_UP
 	help
 	  Internal configuration to enable the correct GPIO pull helper
 
+config SAMSUNG_GPIO_EXTRA
+	int "Number of additional GPIO pins"
+	default 0
+	help
+	  Use additional GPIO space in addition to the GPIO's the SOC
+	  provides. This allows expanding the GPIO space for use with
+	  GPIO expanders.
+
 # device definitions to compile in
 
 config S3C_DEV_HSMMC
-- 
1.6.2.5
