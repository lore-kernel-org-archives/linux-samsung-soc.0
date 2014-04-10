From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 0/4] Introduce new Kconfig for Samsung common clock
Date: Thu, 10 Apr 2014 16:42:54 +0900
Message-ID: <53464B7E.8080507@samsung.com>
References: <1394598781-3848-1-git-send-email-pankaj.dubey@samsung.com>
 <1395291325-4043-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61622 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933287AbaDJHZ1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 03:25:27 -0400
In-reply-to: <1395291325-4043-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 03/20/2014 01:55 PM, Pankaj Dubey wrote:
> Introduce a new Kconfig file for Samsung common clock infrastructure
> related config options. As current Samsung common clock gets compiled
> based on PLAT_SAMSUNG, but moving ahead with ARM64 we can not have any
> more such config options, so this patch introduce new COMMON_CLK_SAMSUNG
> invisible option. This option also select COMMON_CLK so ARCH Kconfig just
> need to select COMMON_CLK_SAMSUNG in case they want to use Samsung common
> clock.
>
> This series is based on Kukjin's for-next branch.
>
> V3:
>   1) Re-organized patches for preventing bisect issues.
>   2) Rebase on top of latest Kukjin's for-next branch.
>   3) Compile tested exynos_defconfig, s3c6400_defconfig and s3c2410_defconfig
>      after each commit.
>
> V2:
>   1) Adding new Kconfig file for Samsung common clock.
>   2) Make COMMON_CLK_SAMSUNG option invisible. (as suggested by Tomasz Figa)
>   3) Let COMMON_CLK_SAMSUNG select COMMON_CLK. (as suggested by Tomasz Figa)
>   4) Move S3C24XX clock config option in new Kconfig file.
>
> Pankaj Dubey (4):
>    clk: samsung: add new Kconfig for Samsung common clock option
>    ARM: select COMMON_CLK_SAMSUNG for ARCH_EXYNOS and ARCH_S3C64XX
>    ARM: S3C24XX: move S3C24XX clock Kconfig options to Samsung clock
>      Kconfig file
>    drivers: clk: use COMMON_CLK_SAMSUNG for Samsung clock support
>
>   arch/arm/Kconfig              |    4 ++--
>   arch/arm/mach-s3c24xx/Kconfig |   14 --------------
>   drivers/clk/Kconfig           |    2 ++
>   drivers/clk/Makefile          |    2 +-
>   drivers/clk/samsung/Kconfig   |   12 ++++++++++++
>   5 files changed, 17 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/clk/samsung/Kconfig
>

Gentle Ping.

-- 
Best Regards,
Pankaj Dubey
