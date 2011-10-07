From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH V2 1/2] ARM: S3C2410: Add __init attribute to usb_simtec_init()
Date: Fri,  7 Oct 2011 17:25:12 +0530
Message-ID: <1317988513-20800-2-git-send-email-tushar.behera@linaro.org>
References: <1317988513-20800-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:53729 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759947Ab1JGMAM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Oct 2011 08:00:12 -0400
Received: by qadb15 with SMTP id b15so2644576qad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Oct 2011 05:00:12 -0700 (PDT)
In-Reply-To: <1317988513-20800-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, linaro-dev@lists.linaro.org, patches@linaro.org

usb_simtec_init() references s3c_ohci_set_platdata() which is defined
with __init attribute. Hence to remove section mismatch warning, __init
attribute is added to usb_simtec_init().

It removes following two warnigs.

WARNING: vmlinux.o(.text+0x1460c): Section mismatch in reference from
the function     usb_simtec_init() to the function
 .init.text:s3c_ohci_set_platdata()
The function usb_simtec_init() references the function
 __init s3c_ohci_set_platdata().

WARNING: vmlinux.o(.text+0x14650): Section mismatch in reference from
the function     usb_simtec_init() to the (unknown reference)
.init.data:(unknown)
The function usb_simtec_init() references the (unknown reference)
__initdata (unknown).

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-s3c2410/usb-simtec.c |    2 +-
 arch/arm/mach-s3c2410/usb-simtec.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c2410/usb-simtec.c b/arch/arm/mach-s3c2410/usb-simtec.c
index 29bd3d9..3a1028c 100644
--- a/arch/arm/mach-s3c2410/usb-simtec.c
+++ b/arch/arm/mach-s3c2410/usb-simtec.c
@@ -104,7 +104,7 @@ static struct s3c2410_hcd_info usb_simtec_info __initdata = {
 };
 
 
-int usb_simtec_init(void)
+int __init usb_simtec_init(void)
 {
 	int ret;
 
diff --git a/arch/arm/mach-s3c2410/usb-simtec.h b/arch/arm/mach-s3c2410/usb-simtec.h
index 03842ed..43cc88f 100644
--- a/arch/arm/mach-s3c2410/usb-simtec.h
+++ b/arch/arm/mach-s3c2410/usb-simtec.h
@@ -12,5 +12,5 @@
  * published by the Free Software Foundation.
 */
 
-extern int usb_simtec_init(void);
+extern int __init usb_simtec_init(void);
 
-- 
1.7.4.1
