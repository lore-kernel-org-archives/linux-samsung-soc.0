From: Kukjin Kim <kgene@kernel.org>
Subject: RE: 3.19-rc1: peach*: display not working (missing patches)
Date: Mon, 05 Jan 2015 22:20:52 +0900
Message-ID: <059f01d028ea$6e02cd00$4a086700$@kernel.org>
References: <20141223101616.GA6238@peachpi>
 <CABxcv=mJ=pGdU700PWF2B4iCjLzG7SGo-6XWFFs814n4-v9PuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28675 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753292AbbAENUy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Jan 2015 08:20:54 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHP005XKH2SRMC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 05 Jan 2015 22:20:52 +0900 (KST)
In-reply-to: <CABxcv=mJ=pGdU700PWF2B4iCjLzG7SGo-6XWFFs814n4-v9PuA@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>, 'Paolo Pisati' <p.pisati@gmail.com>, 'Kukjin Kim' <kgene@kernel.org>, 'Vivek Gautam' <gautam.vivek@samsung.com>
Cc: 'linux-samsung' <linux-samsung-soc@vger.kernel.org>

Javier Martinez Canillas wrote:
> 
> [adding Kukjin and Vivek as cc]
> 
> Hello Paolo,
> 
> On Tue, Dec 23, 2014 at 11:16 AM, Paolo Pisati <p.pisati@gmail.com> wrote:
> > Hi,
> >
> > 3.19-rc1 still misses these two patches:
> >
> > 156823e arm: dts: Exynos5: Use pmu_system_controller phandle for dp phy
> > 03c16e7 ARM: exynos_defconfig: Enable options for display panel support156823e
> >
> > and without them, the display doesn't turn on on my peachpi: can we have them
> > queued for rc2?
> 
> Yes, Vivek re-posted his dp phy patch a couple of times and I pinged
> Kukjin several times about this both during the 3.18 -rc cycle (since
> this also affected 3.18 where display is not working) and during the
> 3.19 merge window but unfortunately it was not picked yet...
> 
> I hope he can merge those patches as 3.19 fixes during the -rc cycle
> to avoid having another kernel release with a non-working display on
> Exynos5 boards.
> 
Hi,

Hmm...Probably I've queued the patch into -fixes if I remember correctly but
unfortunately only in my local at that time because all of pull-requests for
3.19 have been sent out before that. Then, maybe I've missed it :(

Anyway, I'll take the patch for 3.19-rc. Thanks and sorry for that.

- Kukjin
