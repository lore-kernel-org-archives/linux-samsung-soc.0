From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C64XX: Update configuration for WM5102 module
 on Cragganmore
Date: Sat, 11 Aug 2012 14:08:09 +0900
Message-ID: <0eff01cd777f$4c9d1f90$e5d75eb0$%kim@samsung.com>
References: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <0db901cd76b4$7daf1730$790d4590$%kim@samsung.com>
 <20120810100713.GH24328@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57469 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943Ab2HKFIL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 11 Aug 2012 01:08:11 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8K000YLRLFE700@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Aug 2012 14:08:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8K008RURLL8V10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 11 Aug 2012 14:08:09 +0900 (KST)
In-reply-to: <20120810100713.GH24328@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

Mark Brown wrote:
> 
> On Fri, Aug 10, 2012 at 01:56:23PM +0900, Kukjin Kim wrote:
> 
> > Probably, this patch needs following?
> 
> > If you're ok, I will fix build error by above when I apply.
> 
> Yes, thanks.

Applied.

BTW, don't you need to enable your Cragganmore board in the defconfig?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: s3c6400_defconfig: enable more boards in defconfig

This enables all of s3c64xx boards in the s3c6400_defconfig.
In this time, MINI6410, REAL6410, and WLF_CRAGG_6410 are
added in the defconfig.

Cc: Darius Augulis <augulis.darius@gmail.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/configs/s3c6400_defconfig |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/s3c6400_defconfig
b/arch/arm/configs/s3c6400_defconfig
index ba6a515..3a186d6 100644
--- a/arch/arm/configs/s3c6400_defconfig
+++ b/arch/arm/configs/s3c6400_defconfig
@@ -9,11 +9,14 @@ CONFIG_ARCH_S3C64XX=y
 CONFIG_S3C_BOOT_ERROR_RESET=y
 CONFIG_MACH_SMDK6400=y
 CONFIG_MACH_ANW6410=y
+CONFIG_MACH_MINI6410=y
+CONFIG_MACH_REAL6410=y
 CONFIG_MACH_SMDK6410=y
 CONFIG_MACH_NCP=y
 CONFIG_MACH_HMT=y
 CONFIG_MACH_SMARTQ5=y
 CONFIG_MACH_SMARTQ7=y
+CONFIG_MACH_WLF_CRAGG_6410=y
 CONFIG_CPU_32v6K=y
 CONFIG_AEABI=y
 CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc
initrd=0x51000000,6M ramdisk_size=6144"
-- 
1.7.4.1
