From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Cleanup Samsung stuff
Date: Thu, 21 Apr 2011 20:11:40 +0900
Message-ID: <031701cc0014$e7906e50$b6b14af0$%kim@samsung.com>
References: <012801cbfe33$a76fa490$f64eedb0$%kim@samsung.com>
 <BANLkTimTuQ1YE8Xu04NyMZxF42KGDr_XBQ@mail.gmail.com> <4DADA0F9.7010104@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35004 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752115Ab1DULLt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Apr 2011 07:11:49 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LK0001G91RN8Q30@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 20:11:47 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LK0007D91RNQC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Apr 2011 20:11:47 +0900 (KST)
In-reply-to: <4DADA0F9.7010104@ti.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'David Anders' <x0132446@ti.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'LAK' <linux-arm-kernel@lists.infradead.org>, 'Marek Szyprowski' <m.szyprowski@samsung.com>

David Anders
> 
> Greetings All,
> 
Hi,

> 
> i've been looking at a number of machine files for boards that are no
> longer in production(mainly the ones i maintain), thoughts on removing
them?

You mean mach-amlm5900.c and mach-tct_hammer.c in mach-s3c2410?

Hmm...as you know, we need to think again and talk to others before removing
them even though you made them and as I said in previous reply, there is no
decisions yet about that.

As a note, Ben Dooks maintains S3C SoCs. I mean I need to talk to him about
that in detail.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
