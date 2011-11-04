From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung devel-4 for v3.2
Date: Sat, 05 Nov 2011 08:32:57 +0900
Message-ID: <02d901cc9b4a$15a127f0$40e377d0$%kim@samsung.com>
References: <027f01cc9ab6$2086eae0$6194c0a0$%kim@samsung.com>
 <201111050020.55071.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55756 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751159Ab1KDXc7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 19:32:59 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LU50088OTEYJ160@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 08:32:58 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LU500JD4TEXGX30@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 05 Nov 2011 08:32:57 +0900 (KST)
In-reply-to: <201111050020.55071.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, ben-linux@fluff.org

Arnd Bergmann wrote:
> 
> On Friday 04 November 2011, Kukjin Kim wrote:
> > As we talked in Prague, I'm sending 'pull request for v3.2'
Samsung-devel4
> > which includes supporting EXYNOS4 DT, SPI clkdev and reorganization
> > arch/arm/mach-exynos and small things.
> >
> > Please pull from:
> >   git://github.com/kgene/linux-samsung.git next-samsung-devel-4
> >
> > As a note, the branch includes arm-soc/next/cleanup3 and
arm-soc/next/devel2
> > based on mainline commit 994c0e99 ("Merge branch 'next/soc' of
> > git://git.linaro.org/people/arnd/arm-soc") because it is needed for this
and
> > they include all of Samsung stuff for v3.2.
> >
> > And I will be back to kernel.org after this merge window.
> >
> > If any problems, please let me know.
> 
> I've looked through it, and I think I'll hold off for this merge window,
> especially given that I had enough trouble with the the other commits
> and that the submission is really late. Please realize that I have to
> push back on stuff that comes during the merge window.
> 
> Please send the contents split up into separate branches (dt, spi, clkdev,
> rename, devel) for 3.3. I think it's ok if you want to send just the
> rename patch for 3.2 the way we had discussed earlier, because this kind
> of patch really makes sense at the end of the merge window.
> 
Hi Arnd,

OK, I will send the rename branch in a half an hour and make separate
branches for others which will be merged next time.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
