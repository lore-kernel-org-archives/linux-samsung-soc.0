From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/6] s3c24xx arch
Date: Wed, 12 Jun 2013 06:08:37 +0900
Message-ID: <51B791D5.5050005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:48079 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755904Ab3FKVIo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 17:08:44 -0400
Received: by mail-pb0-f52.google.com with SMTP id xa12so8937502pbc.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 14:08:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit f722406faae2d073cc1d01063d1123c35425939e:

   Linux 3.10-rc1 (2013-05-11 17:14:08 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/s3c24xx-arch-1

for you to fetch changes up to a496bda66201e855f6b5d5d701d8bd65b9178700:

   ARM: S3C24XX: remove obsolete s3c2412 specific dma settings 
(2013-05-21 01:01:41 +0900)

----------------------------------------------------------------
update dma part for s3c24xx

----------------------------------------------------------------
Heiko Stuebner (3):
       ARM: S3C24XX: split s3c2412 spi dma channels
       ARM: S3C24XX: dma-s3c2443 - do not write into arbitary bits
       ARM: S3C24XX: remove obsolete s3c2412 specific dma settings

  arch/arm/mach-s3c24xx/dma-s3c2412.c              | 56 
+++++++-----------------
  arch/arm/mach-s3c24xx/dma-s3c2443.c              |  3 +-
  arch/arm/mach-s3c24xx/dma.c                      |  3 --
  arch/arm/plat-samsung/include/plat/dma-s3c24xx.h |  5 ---
  4 files changed, 17 insertions(+), 50 deletions(-)
