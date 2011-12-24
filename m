From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/3] s5p-g2d: add G2D to mach-nuri
Date: Sat, 24 Dec 2011 11:22:50 +0900
Message-ID: <089301ccc1e2$ef6d7740$ce4865c0$%kim@samsung.com>
References: <1323446682-25252-1-git-send-email-k.debski@samsung.com>
 <1323446682-25252-3-git-send-email-k.debski@samsung.com>
 <20111212052745.GA686@sirena.org.uk>
 <CAH9JG2UBb0Dp3i9Hzwx36AykKS5wZd5fsaP3y-og8VVoGqfhtg@mail.gmail.com>
 <20111212100316.GB31568@opensource.wolfsonmicro.com>
 <CAH9JG2XLiFqGyjohtLBT9U6jfwnP4xfuoNMEA=ds_2-gBs2Ong@mail.gmail.com>
 <20111220011340.GR2860@opensource.wolfsonmicro.com>
 <CAH9JG2VQp1biGCRXt4xyqqwbYFfPLWD1Y3r4F-ZNUAjY_UkenA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54156 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754684Ab1LXCWw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Dec 2011 21:22:52 -0500
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWO0011ORY3HY50@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 11:22:51 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWO00767RY2PO90@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 24 Dec 2011 11:22:51 +0900 (KST)
In-reply-to: <CAH9JG2VQp1biGCRXt4xyqqwbYFfPLWD1Y3r4F-ZNUAjY_UkenA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: 'Kamil Debski' <k.debski@samsung.com>, linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com

Kyungmin Park wrote:
> 
> On 12/20/11, Mark Brown <broonie@opensource.wolfsonmicro.com> wrote:
> > On Mon, Dec 12, 2011 at 11:32:28PM +0900, Kyungmin Park wrote:
> >> On Mon, Dec 12, 2011 at 7:03 PM, Mark Brown
> >
> >> > I'm not sure I understand why we would not be ready to do things like
> >> > this?  I'd also expect that doing things in a board specific fashion
> >> > might create issues with things being set up twice.
> >
> >> Please see the below,
> >> https://lkml.org/lkml/2011/11/15/16
> >
> >> Even though I can't agree with his opinions. There are other voice like
> >> this.
> >
> >> I also want to common registration and select at each board.
> >
> > So, I looked at the discussion there and I'm not sure I'm buying what's
> > being said; it seems to be as much a fear of change and a lack of
> > awareness of modern infrastructure as anything else.  It seems to me
> > that this is a case where we should just be turning round and saying
> > that the default position ought to be the other way around, if things
> > need to be done per board there should be a strong reason for it.
> 
> Please ask the Mr. Kim. Now he's working on common file so include
> these functionality.
> then other boards can follow up.
> 
Hi,

I'm not sure it can be included on common.c now, anyway let me check it
soon.

Merry Christmas.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
