From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH] ARM: S3C24XX: let S3C2412_PM select S3C2412_PM_SLEEP
Date: Tue, 5 Feb 2013 22:51:16 +0100
Message-ID: <201302052251.17152.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58348 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756406Ab3BEVvW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 16:51:22 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

The code to enter sleep is used by both the s3c2412 and s3c2416 and
was thus factored out into an extra config option.

But it seems it was forgotten to add the appropriate select to the
s3c2412 pm option, resulting in breakage when only compiling s3c2412
support.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm/mach-s3c24xx/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 5e17e1d..ac61bb7 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -301,6 +301,7 @@ config S3C2412_DMA
 
 config S3C2412_PM
 	bool
+	select S3C2412_PM_SLEEP
 	help
 	  Internal config node to apply S3C2412 power management
 
-- 
1.7.10.4
