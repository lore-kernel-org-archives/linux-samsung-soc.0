From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung Fixes for v3.1
Date: Sat, 22 Oct 2011 04:45:44 +0900
Message-ID: <4EA1CBE8.9090500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35003 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751530Ab1JUTps (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Oct 2011 15:45:48 -0400
Received: by ggnb1 with SMTP id b1so4176938ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Oct 2011 12:45:48 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Linus,

These things are needed for v3.1 and I believe this is last one for v3.1 
Samsung stuff.

Please pull from:
   git://github.com/kgene/linux-samsung.git samsung-fixes-4

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 899e3ee404961a90b828ad527573aaaac39f0ab1:

   Linux 3.1-rc10 (2011-10-17 21:06:23 -0700)

are available in the git repository at:
   git://github.com/kgene/linux-samsung.git samsung-fixes-4

Domenico Andreoli (1):
       ARM: S3C24XX: Fix s3c24xx build errors if !CONFIG_PM

Marek Szyprowski (1):
       ARM: S5P: fix offset calculation on gpio-interrupt

  arch/arm/mach-s3c2410/s3c2410.c |    2 ++
  arch/arm/mach-s3c2412/s3c2412.c |    2 ++
  arch/arm/mach-s3c2416/s3c2416.c |    2 ++
  arch/arm/mach-s3c2440/s3c2440.c |    2 ++
  arch/arm/mach-s3c2440/s3c2442.c |    2 ++
  arch/arm/plat-s5p/irq-gpioint.c |    6 +++---
  6 files changed, 13 insertions(+), 3 deletions(-)
