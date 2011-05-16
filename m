From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
Date: Mon, 16 May 2011 16:15:13 +0900
Message-ID: <002001cc1399$02964bb0$07c2e310$%kim@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
 <4DCBA717.3090307@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31782 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751576Ab1EPHPU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 May 2011 03:15:20 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LLA00KHD1G7HQ80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 16:15:18 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LLA00GWI1HI7O@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 May 2011 16:15:18 +0900 (KST)
In-reply-to: <4DCBA717.3090307@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Mauro Carvalho Chehab' <mchehab@infradead.org>, 'Nick Pelling' <nickpelling@nanodome.com>

Sylwester Nawrocki wrote:
> 
> Hi Kukjin,
> 
Hi,

> Shouldn't there be some deprecation period for whole s5pc100 support
removal ?

This is that. But I know, there is no time...

> It looks a bit rude to me that suddenly whole support for the SoC is
vanished.

Hmm...what did you think about my previous comments: 'removing some
"mach-s5pxxxx"s'?

> I know at least one active user of mainline FIMC driver @ s5pc100.

Do you _really_ want to keep it in later mainline?

I was not sure we should keep continually 6442 and C100 in mainline when I
decided to removing 'mach-s5pxxxx'.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
