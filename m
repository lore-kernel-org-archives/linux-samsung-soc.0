From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/7] ARM: S5PC210: I2C devices support and Universal board
 updates
Date: Tue, 05 Oct 2010 17:40:07 +0900
Message-ID: <001401cb6468$ed8d06d0$c8a71470$%kim@samsung.com>
References: <20100930044814.GA16892@july>
 <AANLkTiknkbts6AtiBpqceSDqEXsE9E+qpMKJx2fzygB6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61363 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757390Ab0JEIjy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Oct 2010 04:39:54 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9T003XK6QGCC10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 17:39:52 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9T00F5I6QGF6@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 05 Oct 2010 17:39:52 +0900 (KST)
In-reply-to: <AANLkTiknkbts6AtiBpqceSDqEXsE9E+qpMKJx2fzygB6@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> Hi,
> 
Hi,

> I think we made some conclusion. first apply the current style and
> improve it later for consistency.
> 
Yeah, we should decide for this.

However, it's expected following problem with current I2C style.

Suppose A board want to use only I2C0, 1, 2, 3, 4, 7 as I2C and B board want
to use all of I2C channels as I2C. If use one kernel image for A and B,
maybe selected all I2C channels. It can be happened the some problem about
I2C5 and I2C6 on A board when it used for other purpose.

Of course can happen regardless of number of I2C channel, but if more I2C
channels, the probability can be increased.

Anyway I know Mr. Han is preparing I2C patches for it and almost done.
How about continuing discussion for this after submitting it?

I think we have some time that talk about this issue.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
