From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v2 0/4] Introduce new Kconfig for Samsung common clock
Date: Wed, 19 Mar 2014 19:39:28 +0900
Message-ID: <532973E0.6060904@samsung.com>
References: <1394598781-3848-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32238 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758259AbaCSKWk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 06:22:40 -0400
In-reply-to: <1394598781-3848-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>

On 03/12/2014 01:32 PM, Pankaj Dubey wrote:
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
> V2:
>   1) Adding new Kconfig file for Samsung common clock.
>   2) Make COMMON_CLK_SAMSUNG option invisible. (as suggested by Tomasz Figa)
>   3) Let COMMON_CLK_SAMSUNG select COMMON_CLK. (as suggested by Tomasz Figa)
>   4) Move S3C24XX clock config option in new Kconfig file.
>
> Pankaj Dubey (4):
>    clk: samsung: add new Kconfig for Samsung common clock options
>    drivers: clk: use CONFIG_COMMON_CLK_SAMSUNG for Samsung clock support
>    ARM: select COMMON_CLK_SAMSUNG for ARCH_EXYNOS and ARCH_S3C64XX
>    ARM: S3C24XX: remove S3C24XX specific clock Kconfig options
>
>   arch/arm/Kconfig              |    4 ++--
>   arch/arm/mach-s3c24xx/Kconfig |   14 --------------
>   drivers/clk/Kconfig           |    2 ++
>   drivers/clk/Makefile          |    2 +-
>   drivers/clk/samsung/Kconfig   |   11 +++++++++++
>   5 files changed, 16 insertions(+), 17 deletions(-)
>   create mode 100644 drivers/clk/samsung/Kconfig
>

+CC: Mike and Tomasz Figa

Sorry, during posting second version I forgot to CC Clock maintainer's,
so CC'ing now.

Link for this series: http://lkml.org/lkml/2014/3/12/10

-- 
Best Regards,
Pankaj Dubey
