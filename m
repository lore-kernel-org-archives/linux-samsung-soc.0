From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [GIT PULL 3/3] 3rd Round of Exynos-PM-2 Updates for v3.18
Date: Thu, 09 Oct 2014 16:13:27 +0200
Message-ID: <1989704.ItPj5sfprr@amdc1032>
References: <54244973.7090204@samsung.com> <1945452.Fsg7LTeZhk@wuerfel>
 <1414810.2h7O5DlLDc@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55977 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751154AbaJIONz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Oct 2014 10:13:55 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0ND6005ZDKV4WJ70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Oct 2014 23:13:52 +0900 (KST)
In-reply-to: <1414810.2h7O5DlLDc@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>


Hi,

On Thursday, October 02, 2014 03:35:18 PM Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Wednesday, October 01, 2014 08:31:47 PM Arnd Bergmann wrote:
> > On Wednesday 01 October 2014 18:49:20 Bartlomiej Zolnierkiewicz wrote:
> > > On Wednesday, October 01, 2014 06:01:29 PM Arnd Bergmann wrote:
> > > > On Thursday 25 September 2014, Kukjin Kim wrote:
> > > > > Exynos 2nd PM related updates for v3.18
> > > > > 
> > > > > - Firmware supporting suspend and resume to excute of low
> > > > >    level operations to enter and leave power mode for exynos
> > > > >    : introduce suspend() and resume() firmware operations
> > > > > 
> > > > > - Fix AFTR mode on boards with secure firmware enabled and
> > > > >    allows exynos cpuidle driver usage on exynos4x12 SoCs
> > > > > 
> > > > > - Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y
> > > > > 
> > > > > - SWRESET is needed to boot secondary CPU on exynos3250
> > > > > 
> > > > 
> > > > I needed another fixup to make this build, but I'm not sure about
> > > > whether this is the right solution.
> > > 
> > > Could you please share the build errors and the used config?
> > 
> > I'm building with an additional series that works around all known
> > build failures in randconfig, so it's possible that the configuration
> > causes other problems in your tree, or that one of my own patches
> > introduces the problem and the exynos tree by itself is fine.
> > 
> > This is the build error I get:
> > 
> > arch/arm/mach-exynos/built-in.o: In function `exynos_suspend':
> > :(.text+0x294): undefined reference to `cpu_suspend'
> > :(.text+0x29c): undefined reference to `cpu_suspend'
> > arch/arm/mach-exynos/built-in.o: In function `skip_cp15':
> > :(.data+0x58): undefined reference to `cpu_resume'
> > arch/arm/mach-exynos/built-in.o: In function `cp15_save_power':
> > :(.data+0x70): undefined reference to `cpu_resume'
> > 
> > The defconfig file is attached, the details don't matter to
> > other readers, except that it has CONFIG_ARM_CPU_SUSPEND
> > disabled, which means that sleep.S can't be linked properly.
> 
> It turned out that the breakage came through Exynos tree.  "ARM:
> EXYNOS: Add support for firmware-assisted suspend/resume" added to
> arch/arm/mach-exynos/firmware.c new references to functions from
> arch/arm/mach-exynos/sleep.S causing the CONFIG_PM_SLEEP=n build
> breakage.  Then "ARM: EXYNOS: Fix build with PM_SLEEP=n and
> ARM_EXYNOS_CPUIDLE=y" tried to fix the CONFIG_PM_SLEEP=n issue by
> always building sleep.S causing in turn the CONFIG_ARM_CPU_SUSPEND=n
> build breakage.  I have not noticed the problem earlier because I
> have overlooked the fact that cpu_suspend() is available only when
> CONFIG_ARM_CPU_SUSPEND=y and in all configs tested by me it was on
> (it gets disabled only when both CONFIG_PM and CONFIG_MCPM are off).
> Sorry for that.
> 
> Your patch seems to be a correct fix except that the resume entry
> should use IS_ENABLED(CONFIG_EXYNOS_CPU_SUSPEND) instead of
> IS_ENABLED(CONFIG_PM_SLEEP) as resume firmware operations is also
> used by Exynos cpuidle support.
> 
> How should we proceed further to get this tree merged?

ping?  Arnd, Kukjin?

> PS What is interesting in your defconfig is that it has CONFIG_MCPM
> enabled but CONFIG_ARM_CPU_SUSPEND is disabled so there are probably
> some MPCM related changes in your tree.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
