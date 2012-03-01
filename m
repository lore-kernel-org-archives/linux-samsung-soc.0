From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/4] ARM: SAMSUNG: Add __init attribute to functions calling s3c_set_platdata
Date: Thu,  1 Mar 2012 14:47:22 +0530
Message-ID: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:46862 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932344Ab2CAJYD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 04:24:03 -0500
Received: by dady9 with SMTP id y9so637188dad.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Mar 2012 01:24:02 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

The function s3c_set_platdata is defined with __init attribute, hence the
functions calling s3c_set_platdata should also be defined with __init
attribute.

Even though all the modified functions are called from xxx_machine_init()
functions, it is still better to define each of them with __init attribute.

Tushar Behera (4):
  ARM: EXYNOS: Add __init attribute to nuri_camera_init()
  ARM: EXYNOS: Add __init attribute to universal_camera_init()
  ARM: SAMSUNG: Add __init attribute to samsung_bl_set()
  ARM: SAMSUNG: Add __init attribute to xxx_set_platdata() wrappers

 arch/arm/mach-exynos/mach-nuri.c           |    2 +-
 arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
 arch/arm/plat-samsung/dev-backlight.c      |    2 +-
 arch/arm/plat-samsung/devs.c               |    4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.7.4.1
