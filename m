From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH 0/4] ARM: S5PV210: add advanced crypto engine platform support
Date: Tue, 12 Apr 2011 01:02:53 +0300
Message-ID: <1302559377-14857-1-git-send-email-vzapolskiy@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:37830 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404Ab1DKWDV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 18:03:21 -0400
Received: by ewy4 with SMTP id 4so1854201ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 15:03:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vladimir Zapolskiy <vzapolskiy@gmail.com>

This patchset adds support for advanced crypto engine as a part of
security subsystem, which is found on Samsung S5PC110 and S5PV210
system-on-chips.

The corresponding crypto driver is available under GPLv2 and it was
accepted for inclusion into the Linux kernel.

Vladimir Zapolskiy (4):
  ARM: S5P: add security subsystem memory region defines
  ARM: S5PV210: add security subsystem clock
  ARM: S5P: add platform support for advanced crypto engine
  ARM: S5PV210: add security subsystem platform device to SMDK boards

 arch/arm/mach-s3c64xx/include/mach/map.h  |    2 +
 arch/arm/mach-s5pc100/include/mach/map.h  |    2 +
 arch/arm/mach-s5pv210/Kconfig             |    2 +
 arch/arm/mach-s5pv210/clock.c             |    6 ++++
 arch/arm/mach-s5pv210/include/mach/map.h  |    3 ++
 arch/arm/mach-s5pv210/mach-smdkc110.c     |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c     |    1 +
 arch/arm/plat-s5p/Kconfig                 |    5 +++
 arch/arm/plat-s5p/Makefile                |    1 +
 arch/arm/plat-s5p/dev-secss.c             |   41 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    2 +
 11 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-s5p/dev-secss.c

-- 
1.7.2.3
