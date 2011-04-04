From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: Make consolidated PM sleep code depend on	PM_SLEEP
Date: Mon, 04 Apr 2011 20:50:33 +0900
Message-ID: <02c801cbf2be$843a9190$8cafb4b0$%kim@samsung.com>
References: <20110402091904.GH8482@n2100.arm.linux.org.uk>
 <E1Q5x0g-0001Yw-Vb@rmk-PC.arm.linux.org.uk>
 <87ipuvr2xg.fsf@lebrac.rtp-net.org>
 <20110403122713.GD4213@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42460 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752484Ab1DDLuk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2011 07:50:40 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJ4003FQM8E2F80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2011 20:50:38 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJ400M85M8EMF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Apr 2011 20:50:38 +0900 (KST)
In-reply-to: <20110403122713.GD4213@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Arnaud Patard' <arnaud.patard@rtp-net.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
> 
> On Sun, Apr 03, 2011 at 01:26:35PM +0200, Arnaud Patard wrote:
> > I've build-tested on some failing platforms theses 2 patches and the
> > build are now succeeding. The only PM related zImage build error I found
> > was for s5pc100:
> >
> > arch/arm/plat-samsung/pm.c:32:26: fatal error: mach/pm-core.h: No such
file
> or directory
> 
> That probably existing from before the consolidation patch, so I won't
> worry about it.

Yeah, Russell is right :)

I will sort it out.
Thanks for your pointing out.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
