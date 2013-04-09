From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-2 for v3.9
Date: Wed, 10 Apr 2013 00:23:37 +0900
Message-ID: <51643279.7050200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f52.google.com ([209.85.210.52]:45612 "EHLO
	mail-da0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761860Ab3DIPXn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 11:23:43 -0400
Received: by mail-da0-f52.google.com with SMTP id f10so3108403dak.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 08:23:42 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>

The following changes since commit 31880c37c11e28cb81c70757e38392b42e695dc6:

   Linux 3.9-rc6 (2013-04-07 20:49:54 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-for-v3.9

for you to fetch changes up to 646dd2f0a980949b05042792fbadd72b735c3eda:

   ARM: S3C24XX: Fix interrupt pending register offset of the EINT 
controller (2013-04-10 00:09:30 +0900)

----------------------------------------------------------------
samsung fixes can support s3c24xx for v3.9

----------------------------------------------------------------
Sylwester Nawrocki (2):
       ARM: S3C24XX: Correct NR_IRQS definition for s3c2440
       ARM: S3C24XX: Fix interrupt pending register offset of the EINT 
controller

  arch/arm/mach-s3c24xx/include/mach/irqs.h | 4 +---
  arch/arm/mach-s3c24xx/irq.c               | 2 +-
  2 files changed, 2 insertions(+), 4 deletions(-)
