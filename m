From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL] Samsung cleanup-spi for v3.3
Date: Wed, 28 Dec 2011 17:01:04 +0900
Message-ID: <01e701ccc536$d8f06200$8ad12600$%kim@samsung.com>
References: <088001ccc1d7$7c0da460$7428ed20$%kim@samsung.com>
 <201112280014.34021.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46403 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716Ab1L1IBF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 03:01:05 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWW009VXM9HQ8O0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Dec 2011 17:01:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWW00BEKM9SUL50@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 28 Dec 2011 17:01:04 +0900 (KST)
In-reply-to: <201112280014.34021.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Arnd Bergmann wrote:
> 
> On Saturday 24 December 2011, Kukjin Kim wrote:
> > Please pull the samsung-cleanup-spi for v3.3.
> > It depends on samsung-devel-spi3 branch...
> >
> > If any problems, please let me know.
> 
> I've applied next-samsung-cleanup-mmc2, next-samsung-devel-spi3 and
> next-samsung-cleanup-spi4, all into next/cleanup2 now.
> 
OK.

> This was the best solution I could come up with, because strictly
> following
> the normal rules would have meant creating an insane number of merge
> commits and sending out each of your branches separately to Linus, after
> all the other stuff.
> 
Yes, right. I agree.

> I normally try to send out all cleanups before everything else, except
> when a cleanup has a dependency on another branch, in which case I have
> to create an extra cleanup branch. What you sent me would have
> meant doing something like:
> 
> 1. cleanup
> 	all cleanup branches except samsung
> 
> 2. dt
> 	all dt branches
> 
> 3. devel
> 	all devel branches, including devel-ohci but not devel-spi
> 	or devel-mmc-spi
> 
> 4.-10.
> 	everything else except samsung
> 
> 11. cleanup2
> 	only samsung/cleanup-mmc
> 
> 12. devel2
> 	only samsung/devel-spi
> 
> 13. cleanup3
> 	only samsung/cleanup-spi
> 
> 14. devel3
> 	only samsung/devel-mmc-spi
> 
> I've now squashed samsung/devel-spi into the cleanup2 branch, which also
> lets me
> put cleanup-spi in there, and put it right after next/dt. This works
> because
> devel-spi can still be considered a cleanup (although you did not consider
> it that).
> 
Hmm...I thought it's a kind of developing but cleanup2 branch and above
ordering are ok to me.

> Right now, the order we have in arm-soc is "fixes-non-critical",
"cleanup",
> "dt",
> "cleanup2", "soc", "boards", "devel", "drivers", "pm", "timer", "move".
> There
> is some flexibility towards the end, but if you use a different order,
> that creates
> circular dependencies which we absolutely don't want.
> 
Yes, we don't :)

OK, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
