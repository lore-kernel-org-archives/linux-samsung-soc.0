From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v2 4/8] ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
Date: Tue, 23 Jul 2013 01:49:21 +0200
Message-ID: <1374536965-3545-5-git-send-email-tomasz.figa@gmail.com>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f177.google.com ([209.85.215.177]:37998 "EHLO
	mail-ea0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753072Ab3GVXto (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 19:49:44 -0400
In-Reply-To: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>

This patch adds soc_is_s3c6400() and soc_is_s3c6410() macros that allow
to distinguish between specific SoCs from s3c64xx series that is needed
to handle differences between them.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/plat-samsung/include/plat/cpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsung/include/plat/cpu.h
index 4fb1f03..335beb3 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -87,8 +87,12 @@ IS_SAMSUNG_CPU(exynos5440, EXYNOS5440_SOC_ID, EXYNOS5_SOC_MASK)
 #endif
 
 #if defined(CONFIG_CPU_S3C6400) || defined(CONFIG_CPU_S3C6410)
+# define soc_is_s3c6400()	is_samsung_s3c6400()
+# define soc_is_s3c6410()	is_samsung_s3c6410()
 # define soc_is_s3c64xx()	(is_samsung_s3c6400() || is_samsung_s3c6410())
 #else
+# define soc_is_s3c6400()	0
+# define soc_is_s3c6410()	0
 # define soc_is_s3c64xx()	0
 #endif
 
-- 
1.8.3.2
