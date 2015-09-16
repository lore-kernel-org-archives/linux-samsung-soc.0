From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH v2 0/7] Add support for Exynos SROM Controller driver
Date: Thu, 17 Sep 2015 08:19:48 +0900
Message-ID: <55F9F914.3000709@kernel.org>
References: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:43923 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752349AbbIPXTz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Sep 2015 19:19:55 -0400
In-Reply-To: <1440403348-8974-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, k.kozlowski@samsung.com, kgene@kernel.org, heiko@sntech.de, thomas.ab@samsung.com

On 08/24/15 17:02, Pankaj Dubey wrote:
> This patch set adds support for Exynos SROM controller DT based driver.
> Currently SROM register sets are used only during S2R, so driver
> basically added for taking care of S2R. It will help us in removing
> static mapping from exynos.c and other extra code handline during S2R.
> 
> This patch set also updated exynos4 and exynos5 dtsi files for with device
> node for srom, and added binding documentation for the same.
> 
> First two patches are some minor cleanup in mach-exynos.
> 
> Patchset v1 was posted here[1]
> [1]: https://lkml.org/lkml/2015/4/29/98
> 
> Changes since v1:
>  - Rebased to latest kgene tree.
>  - Addressed review comments from Krzysztof Kozlowski.
>  - Add two new patches for minor cleanup in exynos.c and map.h
> 
> Pankaj Dubey (7):
>   ARM: EXYNOS: remove unused static mapping of CMU for exynos5
>   ARM: EXYNOS: code cleanup in map.h
>   drivers: soc: add support for exynos SROM driver
>   ARM: EXYNOS: Remove SROM related register settings from mach-exynos
>   ARM: dts: add SROM device node for exynos4
>   ARM: dts: add SROM device node for exynos5
>   Documentation: dt-bindings: add exynos-srom binding information
> 
>  .../bindings/arm/samsung/exynos-srom.txt           |  12 ++
>  arch/arm/boot/dts/exynos4.dtsi                     |   5 +
>  arch/arm/boot/dts/exynos5.dtsi                     |   5 +
>  arch/arm/mach-exynos/Kconfig                       |   2 +
>  arch/arm/mach-exynos/common.h                      |   2 -
>  arch/arm/mach-exynos/exynos.c                      |  22 ----
>  arch/arm/mach-exynos/include/mach/map.h            |   8 --
>  arch/arm/mach-exynos/regs-srom.h                   |  53 --------
>  arch/arm/mach-exynos/suspend.c                     |  20 +--
>  arch/arm/plat-samsung/include/plat/map-s5p.h       |   1 -
>  drivers/soc/Kconfig                                |   1 +
>  drivers/soc/Makefile                               |   1 +
>  drivers/soc/samsung/Kconfig                        |  13 ++
>  drivers/soc/samsung/Makefile                       |   1 +
>  drivers/soc/samsung/exynos-srom.c                  | 143 +++++++++++++++++++++
>  drivers/soc/samsung/exynos-srom.h                  |  51 ++++++++
>  16 files changed, 236 insertions(+), 104 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
>  delete mode 100644 arch/arm/mach-exynos/regs-srom.h
>  create mode 100644 drivers/soc/samsung/Kconfig
>  create mode 100644 drivers/soc/samsung/Makefile
>  create mode 100644 drivers/soc/samsung/exynos-srom.c
>  create mode 100644 drivers/soc/samsung/exynos-srom.h
> 
Hi Pankaj,

Can you please address comments as per Krzysztof's review?...

- Kukjin
