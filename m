From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/5] ARM: EXYNOS: Add secure firmware support
Date: Sat, 24 Nov 2012 11:21:03 +0900
Message-ID: <122d01cdc9ea$5a0d6550$0e282ff0$%kim@samsung.com>
References: <1353599478-24617-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60072 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756816Ab2KXCVF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 21:21:05 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDY00F5VZUWX8C0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:21:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDY008SPZV3RU00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:21:03 +0900 (KST)
In-reply-to: <1353599478-24617-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, tomasz.figa@gmail.com

Tomasz Figa wrote:
> 
> Some Exynos-based boards are running with secure firmware running in
> TrustZone secure world, which changes the way some things have to be
> initialized.
> 
> This series adds support for specifying firmware operations, implements
> some firmware operations for Exynos secure firmware and adds a method of
> enabling secure firmware operations on Exynos-based boards through board
> file and device tree.
> 
> Depends on:
>   - ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412
> 
> Changes since v3
> ( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/13442 )
>   - Replaced cpu_boot_reg call with cpu_set_boot_addr
>   - Added interface documentation
>   - Separated from Exynos4x12 secondary CPU bring-up patch
> 
> Changes since v2
> ( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/12848 )
>   - Made Exynos firmware binding require address
>   - Minor style fixes
> 
> Changes since v1
> ( http://thread.gmane.org/gmane.linux.kernel.samsung-
> soc/12583/focus=12820 )
>   - Changed return types of all operations to int
>   - Defined all operations to return 0 on success, -ENOSYS when not
>     implemented or appropriate error code on error
> 
> Tomasz Figa (5):
>   ARM: Add interface for registering and calling firmware-specific
>     operations
>   ARM: EXYNOS: Add support for secure monitor calls
>   ARM: EXYNOS: Add support for Exynos secure firmware
>   ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
>   ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up
> 
>  Documentation/arm/firmware.txt                     | 88 ++++++++++++++++++++++
>  .../devicetree/bindings/arm/samsung-boards.txt     | 10 +++
>  arch/arm/common/Makefile                           |  2 +
>  arch/arm/common/firmware.c                         | 18 +++++
>  arch/arm/include/asm/firmware.h                    | 66 ++++++++++++++++
>  arch/arm/mach-exynos/Makefile                      |  6 ++
>  arch/arm/mach-exynos/common.c                      | 35 +++++++++
>  arch/arm/mach-exynos/common.h                      |  2 +
>  arch/arm/mach-exynos/exynos-smc.S                  | 22 ++++++
>  arch/arm/mach-exynos/firmware.c                    | 70 +++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h            |  3 +
>  arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
>  arch/arm/mach-exynos/platsmp.c                     | 32 ++++++--
>  arch/arm/mach-exynos/smc.h                         | 31 ++++++++
>  arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
>  15 files changed, 382 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/arm/firmware.txt
>  create mode 100644 arch/arm/common/firmware.c
>  create mode 100644 arch/arm/include/asm/firmware.h
>  create mode 100644 arch/arm/mach-exynos/exynos-smc.S
>  create mode 100644 arch/arm/mach-exynos/firmware.c
>  create mode 100644 arch/arm/mach-exynos/smc.h
> 
> --
> 1.8.0

Russell, I think, Tomasz addressed comments from you.

If you're ok on this, please ack so that I can pick this up in my tree for v3.8...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
