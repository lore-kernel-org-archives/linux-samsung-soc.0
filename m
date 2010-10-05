From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 2/2] ARM: S3C64XX: Add wakeup sources to SmartQ boards
Date: Wed,  6 Oct 2010 01:10:06 +0200
Message-ID: <4eccf01f0096b607f37acecad206caf1ab469c05.1286319272.git.mcuelenaere@gmail.com>
References: <cover.1286319272.git.mcuelenaere@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:33889 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756434Ab0JEXKO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 19:10:14 -0400
Received: by mail-ey0-f174.google.com with SMTP id 6so2663757eyb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Oct 2010 16:10:14 -0700 (PDT)
In-Reply-To: <cover.1286319272.git.mcuelenaere@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org

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
