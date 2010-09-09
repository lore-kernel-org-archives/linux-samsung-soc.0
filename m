From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 5/5] rtc: rtc-s3c: Fix debug message format on RTC
Date: Thu, 09 Sep 2010 10:11:41 +0900
Message-ID: <000601cb4fbb$f9fbab90$edf302b0$%kim@samsung.com>
References: <1283837381-9575-1-git-send-email-kgene.kim@samsung.com>
 <1283837381-9575-6-git-send-email-kgene.kim@samsung.com>
 <4C86CAC1.2050205@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:27814 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408Ab0IIBLb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Sep 2010 21:11:31 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8G00A1AGN69L90@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 10:11:30 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8G00BAIGN6L1@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Sep 2010 10:11:30 +0900 (KST)
In-reply-to: <4C86CAC1.2050205@fluff.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, p_gortmaker@yahoo.com, a.zummo@towertech.it

Ben Dooks wrote:
> 
> On 07/09/10 06:29, Kukjin Kim wrote:
> > This patch fixes debug message format on rtc-s3c.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > ---
> >  drivers/rtc/rtc-s3c.c |   18 +++++++++---------
> >  1 files changed, 9 insertions(+), 9 deletions(-)
> >
> 
> how long has this lot been broken for?
> 
Haha...we don't know :-)

> Acked-by: Ben Dooks <ben-linux@fluff.org>

Thanks for your ack...so...

Hi Alessandro Zummo,
Is it possible to send this to upstream through your tree?
Or which tree is better to care this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
