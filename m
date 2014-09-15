From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v3 0/5] Firmware-assisted suspend/resume of Exynos SoCs
Date: Mon, 15 Sep 2014 09:21:55 +0900
Message-ID: <0d2401cfd07b$0e21e190$2a65a4b0$@kernel.org>
References: <1409062228-14690-1-git-send-email-t.figa@samsung.com>
 <5415D4A8.4010304@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35967 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752907AbaIOAWB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Sep 2014 20:22:01 -0400
In-reply-to: <5415D4A8.4010304@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Arnd Bergmann' <arnd@arndb.de>, swarren@nvidia.com, acourbot@nvidia.com, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Olof Johansson' <olof@lixom.net>, drake@endlessm.com, tomeu@tomeuvizoso.net

Tomasz Figa wrote:
> 
> Hi Kukjin,
> 
Hi,

> On 26.08.2014 16:10, Tomasz Figa wrote:
> > On Exynos-based boards running secure firmware the sequence of low level
> > operations to enter and leave system-wide sleep mode is different than
> > on those without the firmware. Namely:
> >  - CP15 power control and diagnostic registers cannot be written directly,
> >  - the way of setting boot address and boot flag is different,
> >  - different resume handler needs to be used,
> >  - dedicated SMC call needs to be performed instead of letting the CPU enter
> >    WFI.
> >
> > This series introduces .suspend() and .resume() firmware operations to
> > perform low level firmware-specific suspend and resume and then leverages
> > them to provide suspend-resume path meeting the above requirements. Three
> > additional patches extend device tree sources of Trats2 board with necessary
> > setup to enable suspend/resume support.
> >
> > This series has been tested on Exynos4412-based Trats2 board, without any
> > additional patches. Unfortunately v3.17-rc1 regressed ODROID support and
> > suspend stopped working on those boards, due to unknown reasons still being
> > investigated. It does not seem to be related to anything in this series,
> > though, so I would not consider this as a stopper.
> >
> > Changes since v2:
> > (https://lkml.org/lkml/2014/7/17/431)
> >  - added board-specific fixes for device tree sources of Trats2 board,
> >  - rebased on next-20140826 of linux-next tree.
> >
> > Changes since v1:
> >  - dropped outer_resume() - will be handled in assembly in further patches,
> >    as support for L2C in non-secure mode gets added,
> >  - moved CP15 resume to assembly as it needs to be done before MMU is enabled,
> >  - surrounded CP15 save with a check for cpuid part, because it is valid only
> >    on Cortex A9,
> >  - rebased on next-20140717 tag of linux-next tree.
> >
> > Tomasz Figa (5):
> >   ARM: firmware: Introduce suspend and resume operations
> >   ARM: EXYNOS: Add support for firmware-assisted suspend/resume
> >   ARM: dts: exynos4412-trats2: Keep eMMC regulators soft-disabled
> >   ARM: dts: exynos4x12: Add utility macro to define pin sleep states
> >   ARM: dts: exynos4412-trats2: Add sleep mode pin configuration
> >
> >  Documentation/arm/firmware.txt            |  28 +--
> >  arch/arm/boot/dts/exynos4412-trats2.dts   | 320 +++++++++++++++++++++++++++++-
> >  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |  16 ++
> >  arch/arm/include/asm/firmware.h           |   8 +
> >  arch/arm/mach-exynos/Makefile             |   1 +
> >  arch/arm/mach-exynos/common.h             |   4 +
> >  arch/arm/mach-exynos/firmware.c           |  45 +++++
> >  arch/arm/mach-exynos/pm.c                 |  16 +-
> >  arch/arm/mach-exynos/sleep.S              |  28 +++
> >  arch/arm/mach-exynos/smc.h                |   4 +
> >  10 files changed, 438 insertions(+), 32 deletions(-)
> >
> 
> Would you consider applying this series? It has been waiting on the ML
> long enough (note no changes in core patches since last revision, just
> few more board specific patches). Thanks in advance.
> 
Sure, I will. Thanks for your gentle reminder.

- Kukjin
