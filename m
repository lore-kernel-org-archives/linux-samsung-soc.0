From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 09/12] ARM: EXYNOS: introduce
	arch/arm/mach-exynos/common.[ch]
Date: Tue, 03 Jan 2012 20:54:17 +0900
Message-ID: <013b01ccca0e$6c06ce40$44146ac0$%kim@samsung.com>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com>
 <1324385316-6052-10-git-send-email-kgene.kim@samsung.com>
 <20111223191935.GS2577@n2100.arm.linux.org.uk>
 <088101ccc1d8$d2023b00$7606b100$%kim@samsung.com>
 <08f401ccc469$9a93a800$cfbaf800$%kim@samsung.com>
 <20120103104120.GK2914@n2100.arm.linux.org.uk>
 <012601ccca05$57d732b0$07859810$%kim@samsung.com>
 <20120103105425.GL2914@n2100.arm.linux.org.uk>
 <012801ccca07$037a24a0$0a6e6de0$%kim@samsung.com>
 <20120103112003.GN2914@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9870 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752286Ab2ACLyU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Jan 2012 06:54:20 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LX800L5J12GPCH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Jan 2012 20:54:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LX80042012HLW50@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 03 Jan 2012 20:54:19 +0900 (KST)
In-reply-to: <20120103112003.GN2914@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Nicolas Pitre' <nico@fluxnic.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Tue, Jan 03, 2012 at 08:01:15PM +0900, Kukjin Kim wrote:
> > If any problems, please kindly let me know.
> 
> Right, this looks better.  I'm now left with one remaining bit:
> 
> arch/arm/mach-exynos/include/mach/system.h:#include <plat/system-reset.h>
> arch/arm/plat-s3c24xx/cpu.c:#include <plat/system-reset.h>
> arch/arm/mach-s3c64xx/include/mach/system.h:#include <plat/system-reset.h>
> arch/arm/mach-s3c2410/include/mach/system.h:#include <plat/system-reset.h>
> 

And,

arch/arm/mach-s5p64x0/include/mach/system.h:#include <plat/system-reset.h>
arch/arm/mach-s5pc100/include/mach/system.h:#include <plat/system-reset.h>
arch/arm/mach-s5pv210/include/mach/system.h:#include <plat/system-reset.h>

> and:
> 
> arch/arm/plat-samsung/include/plat/system-reset.h:
> ...
> #include <plat/watchdog-reset.h>
> 
> static void arch_reset(char mode, const char *cmd)
> {
>         arch_wdt_reset();
> }
> 
> I assume that with all the patches I now have merged, arch_reset()
> should never be called on any Samsung platform, and so the include of
> plat/watchdog-reset.h and call of arch_wdt_reset() can be removed in
> my "ARM: restart: plat-samsung: remove plat/reset.h and s5p_reset_hook"
> patch?
> 
Yes, if we don't need arch_reset() anymore, we can remove them in your
patch.

But I'm not sure, because happened following build error. Russell, don't we
need arch_reset()?

arch/arm/kernel/process.c: In function 'arm_machine_restart':
arch/arm/kernel/process.c:127: error: implicit declaration of function
'arch_reset'

> What about arch/arm/plat-s3c24xx/cpu.c's include of system-reset.h?
> Does that need to be replaced with watchdog-reset.h?
> 
> That then leads to "ARM: restart: remove the now empty arch_reset()"
> removing system-reset.h and all includes of that file?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
