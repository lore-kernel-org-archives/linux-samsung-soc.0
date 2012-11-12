From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/6] ARM: EXYNOS: Add secure firmware support
Date: Mon, 12 Nov 2012 16:39:28 +0900
Message-ID: <006501cdc0a8$d880c990$89825cb0$%kim@samsung.com>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36514 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750918Ab2KLHja convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 02:39:30 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDD0048F6JIR4U0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 16:39:28 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDD00JOR6LSAK40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 16:39:28 +0900 (KST)
In-reply-to: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, olof@lixom.net, m.szyprowski@samsung.com, tomasz.figa@gmail.com, 'Russell King' <rmk+kernel@arm.linux.org.uk>

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
> Tomasz Figa (6):
>   ARM: Add interface for registering and calling firmware-specific
>     operations
>   ARM: EXYNOS: Add support for secure monitor calls
>   ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
>   ARM: EXYNOS: Add support for Exynos secure firmware
>   ARM: EXYNOS: Add support for secondary CPU bring-up on Exynos4412
>   ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up
> 
>  .../devicetree/bindings/arm/samsung-boards.txt     | 10 ++++
>  arch/arm/common/Makefile                           |  2 +
>  arch/arm/common/firmware.c                         | 18 ++++++
>  arch/arm/include/asm/firmware.h                    | 31 ++++++++++
>  arch/arm/mach-exynos/Makefile                      |  6 ++
>  arch/arm/mach-exynos/common.c                      | 35 +++++++++++
>  arch/arm/mach-exynos/common.h                      |  2 +
>  arch/arm/mach-exynos/exynos-smc.S                  | 22 +++++++
>  arch/arm/mach-exynos/firmware.c                    | 67 ++++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h            |  3 +
>  arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
>  arch/arm/mach-exynos/platsmp.c                     | 37 ++++++++++--
>  arch/arm/mach-exynos/smc.h                         | 31 ++++++++++
>  arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
>  14 files changed, 260 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm/common/firmware.c
>  create mode 100644 arch/arm/include/asm/firmware.h
>  create mode 100644 arch/arm/mach-exynos/exynos-smc.S
>  create mode 100644 arch/arm/mach-exynos/firmware.c
>  create mode 100644 arch/arm/mach-exynos/smc.h
> 
> --
> 1.7.12

(+ Russell King)

As we discussed, let me pick up this series into Samsung tree.

If any objections, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
