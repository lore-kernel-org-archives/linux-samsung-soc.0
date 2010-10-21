From: Maurus Cuelenaere <mcuelenaere@gmail.com>
Subject: [PATCH 0/4] ARM: S3C64XX: SmartQ suspend support
Date: Thu, 21 Oct 2010 19:14:16 +0200
Message-ID: <cover.1287681256.git.mcuelenaere@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:55411 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751437Ab0JURPo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Oct 2010 13:15:44 -0400
Received: by ewy7 with SMTP id 7so392477ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2010 10:15:43 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>

These patches add suspend support to SmartQ boards, plus some S3C PM related
cleanups.

Maurus Cuelenaere (4):
  ARM: SAMSUNG: make SAMSUNG_PM_DEBUG select DEBUG_LL
  ARM: SAMSUNG: Fix warning 's3c_pm_show_resume_irqs' defined but not
    used
  ARM: S3C64XX: Add suspend support to SmartQ boards
  ARM: S3C64XX: Add wakeup sources to SmartQ boards

 arch/arm/mach-s3c64xx/mach-smartq.c  |    4 ++++
 arch/arm/mach-s3c64xx/mach-smartq5.c |    1 +
 arch/arm/mach-s3c64xx/mach-smartq7.c |    1 +
 arch/arm/plat-samsung/Kconfig        |    1 +
 arch/arm/plat-samsung/pm.c           |    5 +++--
 5 files changed, 10 insertions(+), 2 deletions(-)

-- 
1.7.2.3
