From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: fix uncompress.h and debug-macro.S for
 EXYNOS5440
Date: Wed, 02 Jan 2013 14:42:07 -0800
Message-ID: <042601cde93a$662750c0$3275f240$@samsung.com>
References: <1356632834-8934-1-git-send-email-kgene.kim@samsung.com>
 <CAK9yfHycpk6S1e3wW-8hLB7HM2tFykZGOSiz2jaYVwMf2khOUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28790 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752762Ab3ABWmV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jan 2013 17:42:21 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MG0002G1SEKOK30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:42:20 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MG0002Q8SEIXVB0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 03 Jan 2013 07:42:19 +0900 (KST)
In-reply-to: <CAK9yfHycpk6S1e3wW-8hLB7HM2tFykZGOSiz2jaYVwMf2khOUA@mail.gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sachin Kamat wrote:
> 
> Hi Kukjin,
> 
Hi,

> On 27 December 2012 23:57, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > This patch fixes uart base address for uncompress and debug-macro
> > on EXYNOS5440.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> >  arch/arm/mach-exynos/include/mach/debug-macro.S |   25
> +++++++++++++++++------
> >  arch/arm/mach-exynos/include/mach/map.h         |    1 +
> >  arch/arm/mach-exynos/include/mach/uncompress.h  |   20
> +++++++++++-------
> >  3 files changed, 33 insertions(+), 13 deletions(-)
> 
> With this patch I found that Origen board does not boot.
> It stops at "Uncompressing Linux...".
> Tested using your latest for-next branch.
> 
Oh, OK. Let me check it again.
Thanks for your test.

Happy New Year!

- Kukjin
