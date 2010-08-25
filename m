From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RE-SEND] ARM: S5P: Move OneNAND device definitions in
 plat-s5p
Date: Thu, 26 Aug 2010 08:23:57 +0900
Message-ID: <001301cb44ac$9a4c0c90$cee425b0$%kim@samsung.com>
References: <1282522043-2420-1-git-send-email-kgene.kim@samsung.com>
 <01ba01cb4268$8346fa50$89d4eef0$%park@samsung.com>
 <006001cb426b$e84dd560$b8e98020$%kim@samsung.com>
 <AANLkTi=V52VyR7ydy6CPChsn0Qp0jW0G0x=ozroDBZYo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14307 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751181Ab0HYXYK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Aug 2010 19:24:10 -0400
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L7Q007HREBMQE40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Aug 2010 08:23:46 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L7Q001X8EBM67@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Aug 2010 08:23:46 +0900 (KST)
In-reply-to: <AANLkTi=V52VyR7ydy6CPChsn0Qp0jW0G0x=ozroDBZYo@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, 'Kyungmin Park' <"Kyungmin Park <kyungmin.park"@samsung.com>

Kyungmin Park wrote:
> 
> On Mon, Aug 23, 2010 at 11:35 AM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> > Kyungmin Park wrote:
> >>
> >> " Note: S5PC110 and S5PC210 have same OneNAND driver."
> >>
> >> Yes I also think it's same device. At least Spec is same. But I heard
it
> > has
> >> some different feature related with DMA operation.
> >> I'm not yet receive the official release from LSI. So I can't tell the
> > exact
> >> one.
> >>
> >> If it's true. we need to separate it if required.
> >>
> > No need to separate this stuff.
> > It means that no problem to use this commonly for S5PC110 and S5PC210.
> As DMA operation is changed, we need to register onenand device
> separately like s5pc210-onenand.
> to use the different read operations.
> 
I'm not sure why we need separate platform data even though changed DMA
operation.
Anyway, maybe you received information that we can use this on S5PC110 and
S5PC210.

> >
> > But...I will check it again before applying.
> >
> >> Thank you,
> >> Kyungmin Park
> >>
> >> -----Original Message-----
> >> From: Kukjin Kim [mailto:kgene.kim@samsung.com]
> >> Sent: Monday, August 23, 2010 9:07 AM
> >> To: linux-arm-kernel@lists.infradead.org;
> > linux-samsung-soc@vger.kernel.org
> >> Cc: ben-linux@fluff.org; Kukjin Kim; Kyungmin Park
> >> Subject: [PATCH RE-SEND] ARM: S5P: Move OneNAND device definitions in
> >> plat-s5p
> >>
> >> This patch moves OneNAND device definitions from mach-s5pv210 to
plat-s5p
> >> so that can support it commonly.
> >>
> >> Note: S5PC110 and S5PC210 have same OneNAND driver.
> >>
> >> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >> Cc: Kyungmin Park <Kyungmin Park <kyungmin.park@samsung.com>
> >> ---
(snip)


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
