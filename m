From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 0/10] Samsung stuff for v3.10
Date: Wed, 10 Apr 2013 17:59:34 +0900
Message-ID: <30bf01ce35c9$b9120e70$2b362b50$%kim@samsung.com>
References: <516309C4.3000008@samsung.com> <201304092320.06222.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50320 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751287Ab3DJI7g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 04:59:36 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0ML10032X7NB96R0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Apr 2013 17:59:35 +0900 (KST)
In-reply-to: <201304092320.06222.arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Arnd Bergmann wrote:
> 
> On Monday 08 April 2013, Kukjin Kim wrote:
> >
> > Hi Arnd, Olof
> >
> > This is 2nd pull-request for Samsung stuff for v3.10.
> >
> > If any problems, please kindly let me know.
> 
> I managed to pull them all in, aside from the 6/10, since you asked us
> to defer that one. There were a lot more small mistakes, and I think
> I've managed to fix them all up, but please check if the for-next
> branch now actually works.
> 
> A few more requests for the future:
> 
> * Please send branches earlier. You already sent a number of them
> very early, but then we saw very little until now. I'd rather
> get a number of follow-on pull requests than getting everything
> at once, which has lead to stuff getting rejected in the past
> when things break, as you remember. I've been waiting for
> ages now to rebase my multiplatform series on the things you
> have in your tree, I hope we can still make it in time.
> 
> * Half a sentence of tag description is not really enough for
> a long series. Please explain in the tag what the purpose of
> the series is, as you do for a patch.
> 
> * Mention interdependencies between branches explicitly. It
> causes us a lot of extra work having to find out what patches
> are actually new in a series when you have based them on earlier
> patches.
> 
> * Look at the patches that are already merged and test them.
> I've had to fix up build errors now that have been present
> in linux-next for multiple weeks.
> 
OK, I see. I will do carefully as per your suggestion.

Thanks.

- Kukjin
