From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Early kernel hang with big DTB appended
Date: Tue, 15 Jan 2013 13:12:46 -0500 (EST)
Message-ID: <alpine.LFD.2.02.1301151311400.6300@xanadu.home>
References: <7811936.npteFbuYu2@amdc1227> <20130111164531.GC13025@pengutronix.de> <alpine.LFD.2.02.1301141655570.6300@xanadu.home> <1389186.eYbeMx0y73@amdc1227>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f177.google.com ([209.85.216.177]:37262 "EHLO
	mail-qc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756294Ab3AOSMt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 13:12:49 -0500
Received: by mail-qc0-f177.google.com with SMTP id u28so262823qcs.36
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Jan 2013 10:12:48 -0800 (PST)
In-Reply-To: <1389186.eYbeMx0y73@amdc1227>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, kgene.kim@samsung.com, thomas.abraham@linaro.org, bones@secretlab.ca, linux-arm-kernel@lists.infradead.org

On Tue, 15 Jan 2013, Tomasz Figa wrote:

> Hi Nicolas,
> 
> On Monday 14 of January 2013 17:13:09 Nicolas Pitre wrote:
> > On Fri, 11 Jan 2013, Sascha Hauer wrote:
> > > On Thu, Jan 03, 2013 at 04:55:00PM +0100, Tomasz Figa wrote:
> > > > Hi,
> > > > 
> > > > I'm observing strange behavior when booting 3.8-rc1 and -rc2 with
> > > > appended DTB. The kernel hangs very early when the DTB is bigger
> > > > than some threshold somewhere around 24 KiB. With fullest possible
> > > > low level UART debugging (and printk patched to use printascii) I'm
> > > > receiving following output:
> > > > 
> > > > Uncompressing Linux... done, booting the kernel.
> > > > Booting Linux on physical CPU 0xa00
> > > > Linux version 3.8.0-rc1-00073-gdf6efca-dirty (t.figa@amdc1227) (gcc
> > > > version 4.5.2 (Gentoo 4.5.2 p1.2, pie-0.4.5) ) #2 SMP PREEMPT Thu
> > > > Jan 3
> > > > 15:37:35 CET 2013
> > > > CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c53c7d
> > > > CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction
> > > > cache
> > > > 
> > > > I tested on two Exynos-based boards (exynos4210-trats and one
> > > > internal
> > > > exynos4412-based board) and same happens on both.
> > > > 
> > > > Do you have any ideas?
> > > 
> > > Another thing besides the things already mentioned is that the dtb may
> > > not cross a 1MiB boundary. The Kernel uses a single 1Mib section
> > > (aligned to 1Mib) to initially map the dtb. Once you cross that
> > > boundary parts of the dtb won't be accessible for the Kernel anymore.
> > 
> > Crap.  You're right.  This patch should fix this issue.
> > 
> > @Tomasz: please could you confirm this fixes your initial problem?
> 
> I just tested the patch and it fixes the problem indeed. The kernel
> now boots successfully after applying the patch, while undoing it
> makes the kernel fail to boot again. Thanks.
> 
> Tested-by: Tomasz Figa <t.figa@samsung.com>

Thanks.

The patch is queued as 7628/1 in RMK's patch system.


Nicolas
