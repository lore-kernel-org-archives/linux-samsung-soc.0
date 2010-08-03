From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Please remind 'WARNING: about Samsung merge window over'
Date: Tue, 03 Aug 2010 09:53:10 +0900
Message-ID: <00e701cb32a6$4282cf20$c7886d60$%kim@samsung.com>
References: <003401cb3206$d68a1fc0$839e5f40$%kim@samsung.com>
 <AANLkTimJvS0djVprEgCJ8k3_SYeaKc72NMNZNrRpqXHi@mail.gmail.com>
 <20100802073138.GB10608@n2100.arm.linux.org.uk>
 <AANLkTim1qtiYzvGKKRDcgt-Wds30qVX27GDMcnquOvBP@mail.gmail.com>
 <20100802092233.GB30670@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23055 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753787Ab0HCAxH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 20:53:07 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6J00A9OX4GMR50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 09:53:04 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6J00CZ4X4GX0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 09:53:04 +0900 (KST)
In-reply-to: <20100802092233.GB30670@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, kimty@samsung.com, ben-linux@fluff.org, nala.la@samsung.com, linux-arm-kernel@lists.infradead.org, 'Marek Szyprowski' <m.szyprowski@samsung.com>

Russell King wrote:
> 
> On Mon, Aug 02, 2010 at 05:35:37PM +0900, Kyungmin Park wrote:
> > As the maintainer, he merged his features freely but others can't get
> > the chance if the implementation is not fit his taste or company
> > policy.
> >
> > Look at the example.
> > [PATCH v2 0/4] ARM: S5P: Support gpio interrupts
> > http://marc.info/?l=linux-arm-kernel&m=127840208508625&w=2
> >
> > We need the gpio interrupt support but he refused it since it used too
> > many irq. Actually his board don't use this features.
> > "It is because there are too many gpio interrupts and having support
> > of all of them is unnecessary as realistically only few of them maybe
> > used."
> 
> From my count, there's already 144 IRQs, and you'll be adding 27*8 = 216
> additional IRQs to that.  That's quite small compared to some platforms
> which have in the order of 512 or even 1024 IRQs.
> 
> > And current kernel don't support the sparse irq feature. then it's
> > reasonable to merge it first and revise it later.
> 
> sparse irq support has been queued for almost a month for the merge
> window which has just this morning opened.  This doesn't help you if
> you instantiate all your 360 interrupts though - just because you
> don't _use_ an interrupt which has been declared as existing doesn't
> reduce the size of the arrays.
> 
> > Another why FIMC support is missing? we modified it as his requested
> > and send it properly.
> > [PATCH v3 3/8] ARM: Samsung: Add platform definitions and helpers for
> > http://marc.info/?l=linux-arm-kernel&m=127990218813931&w=2
> 
> This looks like it's been missed.  People get busy and miss things on
> the mailing list, there's nothing special about that.
> 
Yeah...actually I missed reply for it...so I requested re-submit v4 patch to
Marek with some modifying and finished review it just now.

> > [PATCH v3 1/8] ARM: Samsung: Add register definitions for Samsung S5P
> > http://marc.info/?l=linux-arm-kernel&m=127990218613922&w=2
> 
> Kukjin Kim replied to this one with a point requiring an answer, but
> nothing came back.
> 
>    "Looks ok...however, I'm still thinking whether really need all these
>     definitions."
> 
> Seems to be a perfectly reasonable point to raise, and if there's no
> reply to justify them...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
