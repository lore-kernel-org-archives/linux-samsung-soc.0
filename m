From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/4] ARM: EXYNOS: Add __init attribute to nuri_camera_init()
Date: Thu,  1 Mar 2012 14:47:23 +0530
Message-ID: <1330593446-663-2-git-send-email-tushar.behera@linaro.org>
References: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:49532 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964878Ab2CAJYF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 04:24:05 -0500
Received: by pbcup15 with SMTP id up15so667120pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Mar 2012 01:24:05 -0800 (PST)
In-Reply-To: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

s3c_set_platdata() is defined with __init attribute, hence all functions
referencing this function should also be defined with __init attribute.

nuri_camera_init() is referenced only in '__init nuri_machine_init()', thus
this change won't put any additional constraint on the usage of
nuri_camera_init().

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-nuri.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index a6b9162..7dc5c99 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1255,7 +1255,7 @@ static struct gpio nuri_camera_gpios[] = {
 	{ GPIO_CAM_MEGA_RST,	GPIOF_OUT_INIT_LOW, "CAM_8M_NRST" },
 };
 
-static void nuri_camera_init(void)
+static void __init nuri_camera_init(void)
 {
 	s3c_set_platdata(&mipi_csis_platdata, sizeof(mipi_csis_platdata),
 			 &s5p_device_mipi_csis0);
-- 
1.7.4.1
