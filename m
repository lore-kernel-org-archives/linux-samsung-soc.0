From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes for v3.3
Date: Thu, 12 Jan 2012 02:35:27 +0900
Message-ID: <4F0DC85F.2040204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:35740 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757847Ab2AKRfi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jan 2012 12:35:38 -0500
Received: by ggdk6 with SMTP id k6so466463ggd.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jan 2012 09:35:38 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com

Hi Arnd and Olof,

Here is first fixes of Samsung stuff for v3.3.

Please pull that from following:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
samsung-fixes

If any problems, please let me know.

As a note, as we discussed, please kindly ignore previous 'pull request' 
of next-samsung-devel-samsung which maybe are in late/devel.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit e343a895a9f342f239c5e3c5ffc6c0b1707e6244:

   Merge tag 'for-linus' of 
git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost (2012-01-10 
18:04:27 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
samsung-fixes

Mark Brown (7):
       ARM: SAMSUNG: Guard against multiple inclusion of plat/dma.h
       ARM: SAMSUNG: dma-ops.h needs mach/dma.h
       ARM: SAMSUNG: Declare struct platform_device in plat/s3c64xx-spi.h
       ARM: S3C64XX: Remove unconditional power domain disables
       ARM: S3C64XX: Remove hsmmc1 from Cragganmore
       ARM: S3C64XX: Fix the memory mapped GPIOs on Cragganmore
       ARM: S3C64XX: Fix interrupt configuration for PCA935x on Cragganmore

Tushar Behera (1):
       ARM: EXYNOS: Invert VCLK polarity for framebuffer on ORIGEN

  arch/arm/mach-exynos/mach-origen.c               |    3 ++-
  arch/arm/mach-s3c64xx/include/mach/crag6410.h    |    1 +
  arch/arm/mach-s3c64xx/mach-crag6410.c            |   13 +++----------
  arch/arm/mach-s3c64xx/pm.c                       |   13 -------------
  arch/arm/plat-samsung/include/plat/dma-ops.h     |    1 +
  arch/arm/plat-samsung/include/plat/dma.h         |    6 +++++-
  arch/arm/plat-samsung/include/plat/s3c64xx-spi.h |    2 ++
  7 files changed, 14 insertions(+), 25 deletions(-)
