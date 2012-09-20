From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH V4] ARM: EXYNOS5: Add bus clock and set parent clock for
 FIMD
Date: Thu, 20 Sep 2012 10:28:53 +0900
Message-ID: <006e01cd96cf$4bfb75e0$e3f261a0$%han@samsung.com>
References: <1347892995-17924-1-git-send-email-l.krishna@samsung.com>
 <002001cd94bc$05177bc0$0f467340$%han@samsung.com>
 <04f401cd94c0$6a13da10$3e3b8e30$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47770 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751231Ab2ITB2z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Sep 2012 21:28:55 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAM008BZK3DUFH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 10:28:54 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.119.56])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAM00FISK46L350@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Sep 2012 10:28:54 +0900 (KST)
In-reply-to: <04f401cd94c0$6a13da10$3e3b8e30$@org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, 'Jingoo Han' <jg1.han@samsung.com>

On Monday, September 17, 2012 7:37 PM Kukjin Kim wrote
> 
> Jingoo Han wrote:
> >
> > On Monday, September 17, 2012 11:43 PM Leela Krishna Amudala wrote
> > >
> > > This patch adds the bus clock for FIMD and changes the device name for
> > lcd clock
> > > also sets mout_mpll_user as parent clock to fimd
> > >
> > > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> >
> > Acked-by: Jingoo Han <jg1.han@samsung.com>
> >
> In this case, since Leela addressed comments from you, seems it should be
> 'Reviewed-by'?
> 

According to 'Documentation/SubmittingPatches',

402 Acked-by: is often used by the maintainer of the affected code when that
403 maintainer neither contributed to nor forwarded the patch.

I just use 'Acked-by' as Samsung Framebuffer maintainer, because
this patch affects Samsung Framebuffer driver directly.

Good luck.
