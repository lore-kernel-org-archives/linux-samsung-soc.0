From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Tue, 27 Dec 2011 09:37:51 +0900
Message-ID: <08e101ccc42f$c3a10b00$4ae32100$%kim@samsung.com>
References: <1324624169-16102-1-git-send-email-riverful.kim@samsung.com>
 <088901ccc1dd$deea1e00$9cbe5a00$%kim@samsung.com>
 <CAH9JG2WEcA1BwWq+uovrax5bWvuXaYsGky8D9txymXta7GY8TQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30081 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752804Ab1L0Ahz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Dec 2011 19:37:55 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWU008OX718QK70@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 09:37:53 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWU004YR7335280@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Dec 2011 09:37:53 +0900 (KST)
In-reply-to: <CAH9JG2WEcA1BwWq+uovrax5bWvuXaYsGky8D9txymXta7GY8TQ@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: "'HeungJun, Kim'" <riverful.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'arm-linux' <linux-arm-kernel@lists.infradead.org>

Kyungmin Park wrote:
> 
> On 12/24/11, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > HeungJun, Kim wrote:
> >>
> >> This patch adds Samsung Mobile TRATS board support.
> >>
> >> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
> >>  arch/arm/mach-exynos/Kconfig       |   11 ++
> >>  arch/arm/mach-exynos/Makefile      |    1 +
> >>  arch/arm/mach-exynos/board-trats.c |  340
> >> ++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 352 insertions(+), 0 deletions(-)
> >>  create mode 100644 arch/arm/mach-exynos/board-trats.c
> >>
> >
> > If this is for v3.3, unfortunately, it's a little late to add board file
> and
> > since many things have changed I don't want to cause the conflicts with
> > others now.
> >
> > BTW, why is the name board-xxx not mach-xxx like others?
> 
> It's mentioned several times,
> How do you talk with other when talk about the smdk?
> "I'm using the smdk machine and it's based on smdk machine?"
> As board is more proper word and it's easy to know when find the board
> at source code.
> So hope to use the board if it's not big deal.
> 
Yes, we say 'SMDK board blah blah' so it can be no big deal, but I don't
want to make a confusion between CONFIG_MACH_XXX and mach-xxx.c yet even
though there is a similar situation of arch/arm/mach-xxx/ directory and
CONFIG_ARCH_XXX. In addition, the machine_is_xxx() is used to distinguish
board in the kernel.

Anyway, I think, if to use board-xxx.c is required, we can change it all at
once and let me think again.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
