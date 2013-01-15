From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: Early kernel hang with big DTB appended
Date: Tue, 15 Jan 2013 12:26 +0100
Message-ID: <1389186.eYbeMx0y73@amdc1227>
References: <7811936.npteFbuYu2@amdc1227>
 <20130111164531.GC13025@pengutronix.de>
 <alpine.LFD.2.02.1301141655570.6300@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29548 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751636Ab3AOL0I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jan 2013 06:26:08 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGN00A52ZQY4J01@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 20:26:06 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MGN005MZZRGPE70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Jan 2013 20:26:06 +0900 (KST)
In-reply-to: <alpine.LFD.2.02.1301141655570.6300@xanadu.home>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, kgene.kim@samsung.com, thomas.abraham@linaro.org, bones@secretlab.ca, linux-arm-kernel@lists.infradead.org

Hi Nicolas,

On Monday 14 of January 2013 17:13:09 Nicolas Pitre wrote:
> On Fri, 11 Jan 2013, Sascha Hauer wrote:
> > On Thu, Jan 03, 2013 at 04:55:00PM +0100, Tomasz Figa wrote:
> > > Hi,
> > > 
> > > I'm observing strange behavior when booting 3.8-rc1 and -rc2 with
> > > appended DTB. The kernel hangs very early when the DTB is bigger
> > > than some threshold somewhere around 24 KiB. With fullest possible
> > > low level UART debugging (and printk patched to use printascii) I'm
> > > receiving following output:
> > > 
> > > Uncompressing Linux... done, booting the kernel.
> > > Booting Linux on physical CPU 0xa00
> > > Linux version 3.8.0-rc1-00073-gdf6efca-dirty (t.figa@amdc1227) (gcc
> > > version 4.5.2 (Gentoo 4.5.2 p1.2, pie-0.4.5) ) #2 SMP PREEMPT Thu
> > > Jan 3
> > > 15:37:35 CET 2013
> > > CPU: ARMv7 Processor [413fc090] revision 0 (ARMv7), cr=10c53c7d
> > > CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction
> > > cache
> > > 
> > > I tested on two Exynos-based boards (exynos4210-trats and one
> > > internal
> > > exynos4412-based board) and same happens on both.
> > > 
> > > Do you have any ideas?
> > 
> > Another thing besides the things already mentioned is that the dtb may
> > not cross a 1MiB boundary. The Kernel uses a single 1Mib section
> > (aligned to 1Mib) to initially map the dtb. Once you cross that
> > boundary parts of the dtb won't be accessible for the Kernel anymore.
> 
> Crap.  You're right.  This patch should fix this issue.
> 
> @Tomasz: please could you confirm this fixes your initial problem?

I just tested the patch and it fixes the problem indeed. The kernel
now boots successfully after applying the patch, while undoing it
makes the kernel fail to boot again. Thanks.

Tested-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
