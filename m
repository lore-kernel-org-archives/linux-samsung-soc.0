From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4/7] Samsung cam for v3.8
Date: Wed, 28 Nov 2012 09:15:48 +0900
Message-ID: <50B557B4.3090109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:45725 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752428Ab2K1APz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 19:15:55 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so4479154dak.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 16:15:55 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof

This is including update Samsung cam for v3.8

Just adding camif gpio setup and clkdev.

Pleases pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cam-samsung

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit f4a75d2eb7b1e2206094b901be09adb31ba63681:

   Linux 3.7-rc6 (2012-11-16 17:42:40 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cam-samsung

Sylwester Nawrocki (2):
       ARM: SAMSUNG: Add s3c24xx/s3c64xx CAMIF GPIO setup helpers
       ARM: S3C24XX: Add clkdev entry for camif-upll clock

  arch/arm/mach-s3c24xx/Kconfig         |    1 +
  arch/arm/mach-s3c24xx/clock-s3c2440.c |    1 +
  arch/arm/plat-samsung/Kconfig         |    5 ++
  arch/arm/plat-samsung/Makefile        |    1 +
  arch/arm/plat-samsung/setup-camif.c   |   70 
+++++++++++++++++++++++++++++++++
  5 files changed, 78 insertions(+), 0 deletions(-)
  create mode 100644 arch/arm/plat-samsung/setup-camif.c
