From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [rtc-linux] RE: [PATCH 5/5] rtc: rtc-s3c: Fix debug message	format
 on RTC
Date: Fri, 10 Sep 2010 20:38:39 +0900
Message-ID: <000f01cb50dc$ba4a74a0$2edf5de0$%kim@samsung.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
 <1283837381-9575-6-git-send-email-kgene.kim@samsung.com>
 <4C86CAC1.2050205@fluff.org> <000601cb4fbb$f9fbab90$edf302b0$%kim@samsung.com>
 <AANLkTi=Jb04ySn1WaGktY-hJQQoGvRpr6kz9DcSHrBZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14767 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753036Ab0IJLi3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 07:38:29 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8J0015G4C4CT50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 20:38:28 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8J00KJ44C3JH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 20:38:28 +0900 (KST)
In-reply-to: <AANLkTi=Jb04ySn1WaGktY-hJQQoGvRpr6kz9DcSHrBZA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Wan ZongShun' <mcuos.com@gmail.com>, rtc-linux@googlegroups.com, 'Andrew Morton' <akpm@linux-foundation.org>
Cc: p_gortmaker@yahoo.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>, a.zummo@towertech.it

Wan ZongShun wrote:
> 
> 2010/9/9 Kukjin Kim <kgene.kim@samsung.com>:
> > Ben Dooks wrote:
> >>
> >> On 07/09/10 06:29, Kukjin Kim wrote:
> >> > This patch fixes debug message format on rtc-s3c.
> >> >
> >> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> > Cc: Ben Dooks <ben-linux@fluff.org>
> >> > ---
> >> >  drivers/rtc/rtc-s3c.c |   18 +++++++++---------
> >> >  1 files changed, 9 insertions(+), 9 deletions(-)
> >> >
> >>
> >> how long has this lot been broken for?
> >>
> > Haha...we don't know :-)
> >
> >> Acked-by: Ben Dooks <ben-linux@fluff.org>
> >
> > Thanks for your ack...so...
> >
> > Hi Alessandro Zummo,
> > Is it possible to send this to upstream through your tree?
> > Or which tree is better to care this.
> 
> 
> Please get help from Andrew.
> 
Ok ;-)

Hello Andrew,

Could you please handle following items which have been got Ben's ack?

http://lists.infradead.org/pipermail/linux-arm-kernel/2010-September/025387.html
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-September/025388.html
http://lists.infradead.org/pipermail/linux-arm-kernel/2010-September/025391.html

And it's available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git next-rtc-s3c

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
