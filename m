From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [GIT PULL] regarding PL330 driver for rmk or arm-soc, and
	slave-dma
Date: Fri, 10 Feb 2012 11:08:00 +0000
Message-ID: <20120210110800.GU889@n2100.arm.linux.org.uk>
References: <010601cce7e1$5850a600$08f1f200$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:59254 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754626Ab2BJLIY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 06:08:24 -0500
Content-Disposition: inline
In-Reply-To: <010601cce7e1$5850a600$08f1f200$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>, 'Vinod Koul' <vinod.koul@intel.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Boojin Kim' <boojin.kim@samsung.com>

On Fri, Feb 10, 2012 at 07:47:12PM +0900, Kukjin Kim wrote:
>  arch/arm/common/Kconfig                        |    3 -
>  arch/arm/common/Makefile                       |    1 -
>  arch/arm/common/pl330.c                        | 1959 ------------------------
>  arch/arm/include/asm/hardware/pl330.h          |  338 +++--

I think I've already said this, but I'm going to say it again.

Code in arch/arm/include/asm/hardware/pl330.h which is only used by
drivers/dma/pl330.c, needs to move to drivers/dma/pl330.h or into
drivers/dma/pl330.c itself.

Anything else left over which needs to be used by others can go into
include/linux/amba/pl330.h.

>  arch/arm/mach-exynos/Kconfig                   |    3 +
>  arch/arm/mach-exynos/clock.c                   |    9 +
>  arch/arm/mach-exynos/dma.c                     |  130 ++-
>  arch/arm/mach-exynos/include/mach/irqs.h       |    2 +
>  arch/arm/mach-exynos/include/mach/map.h        |    3 +-
>  arch/arm/plat-samsung/include/plat/dma-pl330.h |   16 +
>  drivers/dma/Kconfig                            |    1 -
>  drivers/dma/pl330.c                            | 1856 ++++++++++++++++++++++
>  12 files changed, 2197 insertions(+), 2124 deletions(-)
>  delete mode 100644 arch/arm/common/pl330.c
