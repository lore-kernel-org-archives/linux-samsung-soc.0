From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/7] ARM: S5PC210: I2C devices support and Universal board
 updates
Date: Thu, 07 Oct 2010 10:37:50 +0900
Message-ID: <004501cb65c0$45409e20$cfc1da60$%kim@samsung.com>
References: <20100930044814.GA16892@july>
 <AANLkTiknkbts6AtiBpqceSDqEXsE9E+qpMKJx2fzygB6@mail.gmail.com>
 <001401cb6468$ed8d06d0$c8a71470$%kim@samsung.com>
 <AANLkTik022VftXnVXgxEKkATnafPV2U8ZFOQqd+2jXNC@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:56877 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756378Ab0JGBhi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Oct 2010 21:37:38 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9W00AUPCIOBLB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:37:36 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9W001VOCIOLR@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 10:37:36 +0900 (KST)
In-reply-to: <AANLkTik022VftXnVXgxEKkATnafPV2U8ZFOQqd+2jXNC@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
> 
> On Tue, Oct 5, 2010 at 5:40 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Kyungmin Park wrote:
> >>
> >> Hi,
> >>
> > Hi,
> >
> >> I think we made some conclusion. first apply the current style and
> >> improve it later for consistency.
> >>
> > Yeah, we should decide for this.
> >
> > However, it's expected following problem with current I2C style.
> >
> > Suppose A board want to use only I2C0, 1, 2, 3, 4, 7 as I2C and B board
want
> > to use all of I2C channels as I2C. If use one kernel image for A and B,
> > maybe selected all I2C channels. It can be happened the some problem
about
> > I2C5 and I2C6 on A board when it used for other purpose.
> 
> It's handled by platform_device id. Even though turn on all I2C. A
> board don't register 5 or 6 then no configure any GPIOs.
> 
Yes, you're right.
Please kindly ignore it.

> >
> > Of course can happen regardless of number of I2C channel, but if more
I2C
> > channels, the probability can be increased.
> >
> > Anyway I know Mr. Han is preparing I2C patches for it and almost done.
> > How about continuing discussion for this after submitting it?
> >
> > I think we have some time that talk about this issue.
> >

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
