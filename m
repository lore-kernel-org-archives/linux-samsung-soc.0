From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C24XX: Fix build error for missing
	<mach/system-reset.h>
Date: Sat, 07 Jan 2012 21:23:48 +0900
Message-ID: <010c01cccd37$357ea790$a07bf6b0$%kim@samsung.com>
References: <010101cccd32$2cf0cfe0$86d26fa0$%kim@samsung.com>
 <20120107115914.GE13857@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:56465 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab2AGMXw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jan 2012 07:23:52 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXF0072YH3N7800@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 07 Jan 2012 21:23:51 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXF00B52H3PTQ80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 07 Jan 2012 21:23:50 +0900 (KST)
In-reply-to: <20120107115914.GE13857@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux wrote:
> 
> On Sat, Jan 07, 2012 at 08:47:47PM +0900, Kukjin Kim wrote:
> > Since the arch/arm/mach-s3c2410/include/mach/system-reset.h has
> > been removed by commit f88b8979 ("ARM: restart: remove the now
> > empty arch_reset()"), so the inclusion of <mach/system-reset.h>
> > should be removed at the plat-s3c24xx/cpu.c file.
> >
> > The build error happens like following:
> >   arch/arm/plat-s3c24xx/cpu.c:41: fatal error: mach/system-reset.h: No
> such file or directory
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > Russell,
> >
> > I think, you missed removing this in your patch.
> 
> This rather proves the point that the way Samsung stuff is organized is
> just too complicated to be properly understood.  Yes, it's getting better

Yes, I agree ;) and in my opinion, it was hard to merge samsung stuff for
this merge window because some changes are in arm tree and some in arm-soc
tree. In addition, driver-core tree. Anyway, I had to do earlier both :)

> as a result of some of the points I raised, but I feel its still too
> opaque for anyone except those who know it intimiately to get to grips
> with it properly, and follow how the code is organized through all those
> plat-* and mach-* directories.
> 
> > If you have patches to send to Linus for this merge window,
> > could you please send this together? Or...?
> 
> Please put it in the patch system and I'll queue it up.  Thanks.

OK, I did just now.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
