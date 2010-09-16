From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 4/4] ARM: S3C64XX: Add wakeup sources to SmartQ boards
Date: Fri, 17 Sep 2010 00:22:14 +0200
Message-ID: <bcfb79806be96b76fc7a32fd0e5c04e7fcfe0f1f.1287681256.git.mcuelenaere@gmail.com>
References: <cover.1287681256.git.mcuelenaere@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:55411 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753597Ab0JURQO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 13:16:14 -0400
Received: by mail-ew0-f46.google.com with SMTP id 7so392477ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2010 10:16:13 -0700 (PDT)
In-Reply-To: <cover.1287681256.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>

This patch adds the power on/off button on both SmartQ boards as suspend wakeup
sources.

Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
---
 arch/arm/mach-s3c64xx/mach-smartq5.c |    1 +
 arch/arm/mach-s3c64xx/mach-smartq7.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-smartq5.c b/arch/arm/mach-s3c64xx/mach-smartq5.c
index a4d59b0..57b84d3 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq5.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq5.c
@@ -64,6 +64,7 @@ static struct gpio_keys_button smartq5_buttons[] = {
 		.desc			= "Power",
 		.active_low		= 1,
 		.debounce_interval	= 5,
+		.wakeup			= 1,
 		.type                   = EV_KEY,
 	},
 	{
diff --git a/arch/arm/mach-s3c64xx/mach-smartq7.c b/arch/arm/mach-s3c64xx/mach-smartq7.c
index e50a7d7..5b2f9fe 100644
--- a/arch/arm/mach-s3c64xx/mach-smartq7.c
+++ b/arch/arm/mach-s3c64xx/mach-smartq7.c
@@ -64,6 +64,7 @@ static struct gpio_keys_button smartq7_buttons[] = {
 		.desc			= "Power",
 		.active_low		= 1,
 		.debounce_interval	= 5,
+		.wakeup			= 1,
 		.type                   = EV_KEY,
 	},
 	{
-- 
1.7.2.3
