From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-2 for v3.2
Date: Mon, 10 Oct 2011 13:27:23 +0900
Message-ID: <034701cc8704$e86035a0$b920a0e0$%kim@samsung.com>
References: <002001cc80e5$3e497790$badc66b0$%kim@samsung.com>
 <20111002192950.GB1005@sirena.org.uk>
 <005801cc817c$5d42f9e0$17c8eda0$%kim@samsung.com>
 <201110071956.12034.arnd@arndb.de>
 <20111007191443.GA12004@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:26986 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1JJE1Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 00:27:24 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00AIB1PIEVH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:23 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LSU002JY1PN8T90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 13:27:23 +0900 (KST)
In-reply-to: <20111007191443.GA12004@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Mark Brown wrote:
> 
> On Fri, Oct 07, 2011 at 07:56:11PM +0200, Arnd Bergmann wrote:
> > On Monday 03 October 2011, Kukjin Kim wrote:
> > > Mark Brown wrote:
> 
> > > > As I reported the other day this change breaks the boot early on on
the
> > > > Cragganmore S3C6410 based systems (I've not actually fired up my
> > > > SMDK6410 but I suspect it may have issues too).  I did make some
brief
> 
> > > Hmm, I thought it has no problem when I saw Thomas Abraham's 'serial:
> > > samsung' patches because he said it works fine with my for-next plus
his
> > > patches on SMDK6410...Anyway, I need to sort it out.
> 
> > > Arnd, please hold this on, will request again soon.
> 
> > Any update on this?
> 
> We've got a lot closer to working out what's wrong (and got useful
> logging) but not nailed it down yet.  Kukjin has confirmed that he can
> see what's likely the same issue on his systems.  My suggestion is that
> we go ahead with the pull request for now and then fix incrementally,
> there's a relatively small set of systems affected.  If it gets to more
> than a couple of -rcs we know which patches are problematic and so can
> always revert.

Yes I agree with you and I believe we don't need to revert it during next
-rc :)

Arnd, could you please pull that for v3.2?
If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
