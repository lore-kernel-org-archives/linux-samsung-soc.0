From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 7/7] Samsung boards update for v3.8
Date: Wed, 21 Nov 2012 00:05:42 +0900
Message-ID: <50AB9C46.7000901@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:55868 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752437Ab2KTPFs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 10:05:48 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so4333289pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 07:05:48 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof

Here is Samsung boards update for v3.8 and most of them are updates for 
S3C64XX Cragganmore board.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit ddffeb8c4d0331609ef2581d84de4d763607bd37:

   Linux 3.7-rc1 (2012-10-14 14:41:04 -0700)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/board-samsung

Dimitris Papastamos (1):
       ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore

Mark Brown (9):
       ARM: S3C64XX: Add more Glenfarclas module ID strings
       ARM: S3C64XX: Update hookup for Arizona class devices
       ARM: S3C64XX: Provide platform data for Tomatin/Balblair on 
Cragganmore
       ARM: S3C64XX: Handle revision-specific differences in Cragganmore 
modules
       ARM: S3C64XX: Handle new Amrut modules on Cragganmore
       ARM: S3C64XX: Add hookup for Deanston module on Cragganmore
       ARM: S3C64XX: Add WM2200 module for Cragganmore
       ARM: S3C64XX: Add handset module to probed Glenfarclas modules
       ARM: S3C64XX: Add missing device selects for Cragganmore

Tomasz Figa (1):
       ARM: EXYNOS: Add missing USB regulators for origen

  arch/arm/mach-exynos/mach-origen.c           |    2 +
  arch/arm/mach-s3c64xx/Kconfig                |    2 +
  arch/arm/mach-s3c64xx/mach-crag6410-module.c |  141 
+++++++++++++++++++++-----
  arch/arm/mach-s3c64xx/mach-crag6410.c        |   29 +++++-
  4 files changed, 148 insertions(+), 26 deletions(-)
