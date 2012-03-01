From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 2/4] ARM: EXYNOS: Add __init attribute to universal_camera_init()
Date: Thu,  1 Mar 2012 14:47:24 +0530
Message-ID: <1330593446-663-3-git-send-email-tushar.behera@linaro.org>
References: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:46862 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964878Ab2CAJYK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 04:24:10 -0500
Received: by mail-pz0-f51.google.com with SMTP id y9so637188dad.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Mar 2012 01:24:09 -0800 (PST)
In-Reply-To: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

s3c_set_platdata() is defined with __init attribute, hence all functions
referencing this function should also be defined with __init attribute.

universal_camera_init() is referenced only in '__init universal_machine_init()',
thus this change won't put any additional constraint on the usage of
universal_camera_init().

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 6017a21..be50e5e 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -990,7 +990,7 @@ static struct gpio universal_camera_gpios[] = {
 	{ GPIO_CAM_VGA_NSTBY,	GPIOF_OUT_INIT_LOW,  "CAM_VGA_NSTBY" },
 };
 
-static void universal_camera_init(void)
+static void __init universal_camera_init(void)
 {
 	s3c_set_platdata(&mipi_csis_platdata, sizeof(mipi_csis_platdata),
 			 &s5p_device_mipi_csis0);
-- 
1.7.4.1
