From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 10/10] ARM: S3C24XX: Correct CAMIF interrupt definitions
Date: Sat, 30 Jun 2012 14:09:02 +0200
Message-ID: <1341058142-30438-11-git-send-email-sylvester.nawrocki@gmail.com>
References: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:57054 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754249Ab2F3MJh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jun 2012 08:09:37 -0400
Received: by mail-ey0-f174.google.com with SMTP id k11so1647555eaa.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Jun 2012 05:09:36 -0700 (PDT)
In-Reply-To: <1341058142-30438-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Properly define the CAMIF interrupt resources. This device have two
interrupts - corresponding to the "codec" and "preview" data paths.
IRQ_CAM is handled internally by the architecture and demultiplexed
to IRQ_S3C2440_CAM_C and IRQ_S3C2440_CAM_P - these interrupts only
should be handled in the driver.

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 arch/arm/plat-samsung/devs.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 1d214cb..6303974 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -126,7 +126,8 @@ struct platform_device s3c_device_adc = {
 #ifdef CONFIG_CPU_S3C2440
 static struct resource s3c_camif_resource[] = {
 	[0] = DEFINE_RES_MEM(S3C2440_PA_CAMIF, S3C2440_SZ_CAMIF),
-	[1] = DEFINE_RES_IRQ(IRQ_CAM),
+	[1] = DEFINE_RES_IRQ(IRQ_S3C2440_CAM_C),
+	[2] = DEFINE_RES_IRQ(IRQ_S3C2440_CAM_P),
 };
 
 struct platform_device s3c_device_camif = {
-- 
1.7.4.1
